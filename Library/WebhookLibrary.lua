local WebhookLib = {}
local WebhookTemplate = {}
local HttpService = game:GetService("HttpService")
local MarketService = game:GetService("MarketplaceService")
local function getGameName()
    local s, name = pcall(function()
        return MarketService:GetProductInfo(game.PlaceId).Name
    end)
    return s and name or "Unknown Game"
end
local success, GameName = pcall(function() return getGameName() end)
local cfg = {
    color = 14893841,
    footer = "🔹 UB Hub | Report bugs in discord",
    thumbnail = "",
    author = "UB Hub | " .. (success and GameName or "Failed to get game")
}
function WebhookLib.SendMessageEMBED(url, embed, mention)
    local targetUrl = string.gsub(url, "discord%.com", "webhook.lewisakura.moe")
    local data = {
        content = (mention and mention ~= "") and ("<@" .. tostring(mention) .. ">") or "",
        embeds = {{
            title = embed.title,
            description = embed.description,
            color = embed.color or cfg.color,
            fields = embed.fields,
            footer = embed.footer and {text = embed.footer.text, icon_url = embed.footer.icon_url} or nil,
            thumbnail = embed.thumbnail and {url = typeof(embed.thumbnail) == "table" and embed.thumbnail.url or tostring(embed.thumbnail)} or nil,
            author = embed.author and {name = embed.author.name, icon_url = embed.author.icon_url} or nil,
            timestamp = embed.timestamp
        }}
    }
    local ok, err = pcall(function()
        request({
            Url = targetUrl,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(data)
        })
    end)
    if not ok then warn("Webhook failed:", err) end
end
function WebhookTemplate:CreateEmbed()
    return {
        title = "",
        description = "",
        color = cfg.color,
        fields = {},
        footer = {text = cfg.footer, icon_url = ""},
        thumbnail = cfg.thumbnail,
        author = {name = cfg.author, icon_url = ""},
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }
end
function WebhookTemplate:AddField(embed, name, value, inline)
    table.insert(embed.fields, {
        name = name or "",
        value = value or "",
        inline = inline or false
    })
    return embed
end
function WebhookTemplate:SetColor(embed, color)
    if type(color) == "string" then
        color = color:gsub("#", "")
        embed.color = tonumber(color, 16) or cfg.color
    else
        embed.color = tonumber(color) or cfg.color
    end
    return embed
end
function WebhookTemplate:CreateStatsEmbed(stats, opts)
    opts = opts or {}
    local embed = self:CreateEmbed()
    embed.title = opts.title or "🎮 Game Stats"
    embed.description = opts.description or "📊 Tracking your game stats"
    if opts.color then self:SetColor(embed, opts.color) end
    if opts.thumbnail then embed.thumbnail = opts.thumbnail end
    if opts.fields then
        for _, field in ipairs(opts.fields) do
            if field.custom and type(field.custom) == "function" then
                local custom = field.custom()
                if custom then
                    self:AddField(embed, custom.name, custom.value, custom.inline)
                end
            else
                local val = stats[field.key]
                if val then
                    local display = field.format and string.format(field.format, val) or tostring(val)
                    local fieldName = field.emoji and (field.emoji .. " " .. field.key) or field.key
                    self:AddField(embed, fieldName, "```\n" .. display .. "\n```", field.inline ~= false)
                end
            end
        end
    end
    if opts.showTimestamp ~= false then
        local time = opts.timestamp or os.time()
        local timeStr = opts.timestampFormat == "discord" and ("<t:%d:R>"):format(time) or os.date(opts.timestampFormat or "%c", time)
        self:AddField(embed, "🕒 Last Updated", timeStr, false)
    end
    return embed
end
function WebhookTemplate:Configure(newCfg)
    for k, v in pairs(newCfg) do
        if cfg[k] then cfg[k] = v end
    end
end
return WebhookLib, WebhookTemplate
