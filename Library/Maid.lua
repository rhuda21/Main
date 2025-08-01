--!strict
--[[
  https://raw.githubusercontent.com/Quenty/NevermoreEngine/refs/heads/main/src/maid/src/Shared/Maid.lua
	Manages the cleaning of events and other things. Useful for
	encapsulating state and make deconstructors easy.

	See the [Five Powerful Code Patterns talk](https://developer.roblox.com/en-us/videos/5-powerful-code-patterns-behind-top-roblox-games)
	for a more in-depth look at Maids in top games.

	```lua
	local maid = Maid.new()

	maid:GiveTask(function()
		print("Cleaning up")
	end)

	maid:GiveTask(workspace.ChildAdded:Connect(print))

	-- Disconnects all events, and executes all functions
	maid:DoCleaning()
	```

	@ignore
	@class Maid
]]
-- luacheck: pop

local Maid = {}
Maid.ClassName = "Maid"

export type MaidTask = (() -> ()) | Instance | thread | any | RBXScriptConnection | nil

export type Maid = typeof(setmetatable(
	{} :: {
		Add: <T>(self: Maid, task: T) -> T,
		GiveTask: (self: Maid, task: MaidTask) -> number,
		GivePromise: <T>(self: Maid, promise: T) -> T,
		DoCleaning: (self: Maid) -> (),
		Destroy: (self: Maid) -> (),
		_tasks: { [any]: MaidTask },
		[string | number | MaidTask]: any,
	},
	{} :: typeof({ __index = Maid })
))

--[[
	Constructs a new Maid object

	```lua
	local maid = Maid.new()
	```

	@ignore
	@return Maid
]]
function Maid.new(): Maid
	return setmetatable(
		{
			_tasks = {},
		} :: any,
		Maid
	) :: Maid
end

--[[
	Returns true if the class is a maid, and false otherwise.

	```lua
	print(Maid.isMaid(Maid.new())) --> true
	print(Maid.isMaid(nil)) --> false
	```

	@ignore
	@param value any
	@return boolean
]]
function Maid.isMaid(value: any): boolean
	return type(value) == "table" and value.ClassName == "Maid"
end

--[[
	Returns Maid[key] if not part of Maid metatable

	```lua
	local maid = Maid.new()
	maid._current = Instance.new("Part")
	print(maid._current) --> Part

	maid._current = nil
	print(maid._current) --> nil
	```

	@ignore
	@param index any
	@return MaidTask
]]
function Maid.__index(self: Maid, index: any)
	if Maid[index] then
		return Maid[index]
	else
		return self._tasks[index]
	end
end

--[[
	Add a task to clean up. Tasks given to a maid will be cleaned when
	maid[index] is set to a different value.

	Task cleanup is such that if the task is an event, it is disconnected.
	If it is an object, it is destroyed.

	```
	Maid[key] = (function)         Adds a task to perform
	Maid[key] = (event connection) Manages an event connection
	Maid[key] = (thread)           Manages a thread
	Maid[key] = (Maid)             Maids can act as an event connection, allowing a Maid to have other maids to clean up.
	Maid[key] = (Object)           Maids can cleanup objects with a `Destroy` method
	Maid[key] = nil                Removes a named task.
	```

	@ignore
	@param index any
	@param newTask MaidTask
]]
function Maid.__newindex(self: Maid, index: any, newTask: MaidTask)
	if Maid[index] ~= nil then
		error(string.format("Cannot use '%s' as a Maid key", tostring(index)), 2)
	end

	local tasks = self._tasks
	local job = tasks[index]

	if job == newTask then
		return
	end

	tasks[index] = newTask

	if job then
		if typeof(job) == "function" then
			(job :: any)()
		elseif typeof(job) == "table" then
			local destructable: any = job
			if type(destructable.Destroy) == "function" then
				destructable:Destroy()
			end
		elseif typeof(job) == "Instance" then
			job:Destroy()
		elseif typeof(job) == "thread" then
			local cancelled
			if coroutine.running() ~= job then
				cancelled = pcall(function()
					task.cancel(job)
				end)
			end

			if not cancelled then
				task.defer(function()
					task.cancel(job)
				end)
			end
		elseif typeof(job) == "RBXScriptConnection" then
			job:Disconnect()
		end
	end
end

--[[
	Gives a task to the maid for cleanup and returns the resulting value

	@ignore
	@param task MaidTask -- An item to clean
	@return MaidTask
]]
function Maid.Add<T>(self: Maid, task: T): T
	if not task then
		error("Task cannot be false or nil", 2)
	end

	self[#(self._tasks :: any) + 1] = task :: any

	if type(task) == "table" and not task.Destroy then
		warn("[Maid.Add] - Gave table task without .Destroy\n\n" .. debug.traceback())
	end

	return task
end

--[[
	Gives a task to the maid for cleanup, but uses an incremented number as a key.

	@ignore
	@param task MaidTask -- An item to clean
	@return number -- taskId
]]
function Maid.GiveTask(self: Maid, task: MaidTask): number
	if not task then
		error("Task cannot be false or nil", 2)
	end

	local taskId = #(self._tasks :: any) + 1
	self[taskId] = task

	if type(task) == "table" and not (task :: any).Destroy then
		warn("[Maid.GiveTask] - Gave table task without .Destroy\n\n" .. debug.traceback())
	end

	return taskId
end

--[[
	Gives a promise to the maid for clean.

	@ignore
	@param promise Promise<T>
	@return Promise<T>
]]
function Maid.GivePromise(self: Maid, promise: any): any
	if not promise:IsPending() then
		return promise
	end

	local newPromise = promise.resolved(promise)
	local id = self:GiveTask(newPromise)

	-- Ensure GC
	newPromise:Finally(function()
		self[id] = nil
	end)

	return newPromise
end

--[[
	Cleans up all tasks and removes them as entries from the Maid.

	:::note
	Signals that are already connected are always disconnected first. After that
	any signals added during a cleaning phase will be disconnected at random times.
	:::

	:::tip
	DoCleaning() may be recursively invoked. This allows the you to ensure that
	tasks or other tasks. Each task will be executed once.

	However, adding tasks while cleaning is not generally a good idea, as if you add a
	function that adds itself, this will loop indefinitely.
	:::

	@ignore
]]
function Maid.DoCleaning(self: Maid)
	local tasks = self._tasks

	-- Disconnect all events first as we know this is safe
	for index, job in tasks do
		if typeof(job) == "RBXScriptConnection" then
			tasks[index] = nil
			job:Disconnect()
		end
	end

	-- Clear out tasks table completely, even if clean up tasks add more tasks to the maid
	local index, job = next(tasks)
	while job ~= nil do
		tasks[index] = nil
		if typeof(job) == "function" then
			(job :: any)()
		elseif typeof(job) == "table" and type((job :: any).Destroy) == "function" then
			(job :: any):Destroy()
		elseif typeof(job) == "Instance" then
			job:Destroy()
		elseif typeof(job) == "thread" then
			local cancelled
			if coroutine.running() ~= job then
				cancelled = pcall(function()
					task.cancel(job)
				end)
			end

			if not cancelled then
				local toCancel = job
				task.defer(function()
					task.cancel(toCancel)
				end)
			end
		elseif typeof(job) == "RBXScriptConnection" then
			job:Disconnect()
		end
		index, job = next(tasks)
	end
end

--[[
	Alias for [Maid.DoCleaning()](/api/Maid#DoCleaning)

	@ignore
	@function Destroy
	@within Maid
]]
Maid.Destroy = Maid.DoCleaning

return Maid
