local WebhookLib = {}
local WebhookTemplate = {}
local success, GameName = pcall(function() return "Disable" end)

local config = {
    defaultColor = 14893841,
    defaultFooter = "🔹 UB Hub | Report Bugs in Discord",
    defaultThumbnail = "",
    defaultAuthor = "UB Hub | " .. (success and GameName or "Fail to get Game")
}

function WebhookLib.SendMessageEMBED(url, embed, mention)
    local payload = {
        content = mention and ("<@" .. mention .. ">") or "",
        embeds = {{
            title = embed.title,
            description = embed.description,
            color = 14893841 or embed.color,
            fields = embed.fields,
            footer = embed.footer and {text = embed.footer.text, icon_url = embed.footer.icon_url} or nil,
            thumbnail = embed.thumbnail and {url = embed.thumbnail.url} or nil,
            author = embed.author and {name = embed.author.name, icon_url = embed.author.icon_url} or nil,
            timestamp = embed.timestamp
        }}
    }
    local success, response = pcall(function()
        return request({
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
            },
            Body = game:GetService("HttpService"):JSONEncode(payload)
        })
    end)
    if not success then
        warn("Failed to send webhook:", response)
    end
end
function WebhookTemplate:CreateEmbed()
    return {
        title = "",
        description = "",
        color = config.defaultColor,
        fields = {},
        footer = {
            text = config.defaultFooter,
            icon_url = ""
        },
        thumbnail = {
            url = config.defaultThumbnail
        },
        author = {
            name = config.defaultAuthor,
            icon_url = ""
        },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }
end
function WebhookTemplate:AddField(embed, name, value, inline)
    table.insert(embed.fields, {name = name or "",value = value or "",inline = inline or false})
    return embed
end
function WebhookTemplate:SetColor(embed, color)
    if type(color) == "string" and color:match("^#?[0-9a-fA-F]+") then
        color = color:gsub("#", "")
        embed.color = tonumber(color, 16) or config.defaultColor
    else
        embed.color = tonumber(color) or config.defaultColor
    end
    return embed
end
function WebhookTemplate:CreateStatsEmbed(stats, options)
    options = options or {}
    local embed = self:CreateEmbed()
    embed.title = options.title or "🎮 Game Stats"
    embed.description = options.description or "📊 Tracking your game statistics"
    if options.color then
        self:SetColor(embed, options.color)
    end
    if options.fields then
        for _, field in ipairs(options.fields) do
            if field.custom and type(field.custom) == "function" then
                local customField = field.custom()
                if customField then self:AddField(embed, customField.name, customField.value, customField.inline) end
            else
                local value = stats[field.key]
                if value ~= nil then
                    local displayValue = field.format and string.format(field.format, value) or tostring(value)
                    local fieldName = field.emoji and (field.emoji .. " " .. field.key) or field.key
                    self:AddField(embed, fieldName, "```\n" .. displayValue .. "\n```", field.inline ~= false)
                end
            end
        end
    end
    if options.showTimestamp ~= false then
        local timestamp = options.timestamp or os.time()
        local timestampStr = options.timestampFormat == "discord" and 
                           ("<t:%d:R>"):format(timestamp) or
                           os.date(options.timestampFormat or "%c", timestamp)
        self:AddField(embed, "🕒 Last Updated", timestampStr, false)
    end
    return embed
end
function WebhookTemplate:Configure(newConfig)
    for key, value in pairs(newConfig) do
        if config[key] ~= nil then
            config[key] = value
        end
    end
end
return WebhookLib, WebhookTemplate
