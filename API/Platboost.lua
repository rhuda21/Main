local PB = {}
local service = "2062";
local secret = ""; 
local useNonce = true; 
local onMessage = function(message)  game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", { Text = message; }) end;
repeat task.wait(1) until game:IsLoaded() or game.Players.LocalPlayer;
local requestSending = false;
local fSetClipboard, fRequest, fStringChar, fToString, fStringSub, fOsTime, fMathRandom, fMathFloor, fGetHwid = setclipboard or toclipboard, request or http_request, string.char, tostring, string.sub, os.time, math.random, math.floor, gethwid or function() return game:GetService("Players").LocalPlayer.UserId end
local cachedLink, cachedTime = "", 0;
local HttpService = game:GetService("HttpService")

function PB.lEncode(data)
    return HttpService:JSONEncode(data)
end
function PB.lDecode(data)
    return HttpService:JSONDecode(data)
end
function PB.lDigest(input)
    local inputStr = tostring(input)
    
    
    local hash = {}
    for i = 1, #inputStr do
        table.insert(hash, string.byte(inputStr, i))
    end

    local hashHex = ""
    for _, byte in ipairs(hash) do
        hashHex = hashHex .. string.format("%02x", byte)
    end
    
    return hashHex
end
local host = "https://api.platoboost.com";
local hostResponse = fRequest({
    Url = host .. "/public/connectivity",
    Method = "GET"
});
if hostResponse.StatusCode ~= 200 or hostResponse.StatusCode ~= 429 then
    host = "https://api.platoboost.net";
end

function PB.cacheLink()
    if cachedTime + (10*60) < fOsTime() then
        local response = fRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = PB.lEncode({
                service = service,
                identifier = PB.lDigest(fGetHwid())
            }),
            Headers = {
                ["Content-Type"] = "application/json"
            }
        });

        if response.StatusCode == 200 then
            local decoded = PB.lDecode(response.Body);

            if decoded.success == true then
                cachedLink = decoded.data.url;
                cachedTime = fOsTime();
                return true, cachedLink;
            else
                onMessage(decoded.message);
                return false, decoded.message;
            end
        elseif response.StatusCode == 429 then
            local msg = "you are being rate limited, please wait 20 seconds and try again.";
            onMessage(msg);
            return false, msg;
        end

        local msg = "Failed to cache link.";
        onMessage(msg);
        return false, msg;
    else
        return true, cachedLink;
    end
end
PB.cacheLink();
local generateNonce = function()
    local str = ""
    for _ = 1, 16 do
        str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97)
    end
    return str
end
for _ = 1, 5 do
    local oNonce = generateNonce();
    task.wait(0.2)
    if generateNonce() == oNonce then
        local msg = "platoboost nonce error.";
        onMessage(msg);
        error(msg);
    end
end

PB.copyLink = function()
    local success, link = PB.cacheLink();
    
    if success then
        print("SetClipBoard")
        fSetClipboard(link);
    end
end

PB.redeemKey = function(key)
    local nonce = generateNonce();
    local endpoint = host .. "/public/redeem/" .. fToString(service);

    local body = {
        identifier = PB.lDigest(fGetHwid()),
        key = key
    }

    if useNonce then
        body.nonce = nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "POST",
        Body = PB.lEncode(body),
        Headers = {
            ["Content-Type"] = "application/json"
        }
    });

    if response.StatusCode == 200 then
        local decoded = PB.lDecode(response.Body);
        if decoded.success == true then
            if decoded.data.valid == true then
                if useNonce then
                    if decoded.data.hash == PB.lDigest("true" .. "-" .. nonce .. "-" .. secret) then
                        return true;
                    else
                        onMessage("failed to verify integrity.");
                        return false;
                    end    
                else
                    return true;
                end
            else
                onMessage("key is invalid.");
                return false;
            end
        else
            if fStringSub(decoded.message, 1, 27) == "unique constraint violation" then
                onMessage("you already have an active key, please wait for it to expire before redeeming it.");
                return false;
            else
                onMessage(decoded.message);
                return false;
            end
        end
    elseif response.StatusCode == 429 then
        onMessage("you are being rate limited, please wait 20 seconds and try again.");
        return false;
    else
        onMessage("server returned an invalid status code, please try again later.");
        return false; 
    end
end


PB.verifyKey = function(key)
    if requestSending == true then
        onMessage("a request is already being sent, please slow down.");
        return false;
    else
        requestSending = true;
    end

    local nonce = generateNonce();
    local endpoint = host .. "/public/whitelist/" .. fToString(service) .. "?identifier=" .. PB.lDigest(fGetHwid()) .. "&key=" .. key;

    if useNonce then
        endpoint = endpoint .. "&nonce=" .. nonce;
    end
    local response = fRequest({
        Url = endpoint,
        Method = "GET",
    });

    requestSending = false;

    if response.StatusCode == 200 then
        local decoded = PB.lDecode(response.Body);
        if decoded.success == true then
            if decoded.data.valid == true then
                if useNonce then
                    return true;
                else
                    return true;
                end
            else
                if fStringSub(key, 1, 4) == "FREE_" then
                    return PB.redeemKey(key);
                else
                    onMessage("key is invalid.");
                    return false;
                end
            end
        else
            onMessage(decoded.message);
            return false;
        end
    elseif response.StatusCode == 429 then
        onMessage("you are being rate limited, please wait 20 seconds and try again.");
        return false;
    else
        onMessage("server returned an invalid status code, please try again later.");
        return false;
    end
end


PB.getFlag = function(name)
    local nonce = generateNonce();
    local endpoint = host .. "/public/flag/" .. fToString(service) .. "?name=" .. name;

    if useNonce then
        endpoint = endpoint .. "&nonce=" .. nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "GET",
    });

    if response.StatusCode == 200 then
        local decoded = PB.lDecode(response.Body);
        if decoded.success == true then
            if useNonce then
                if decoded.data.hash == PB.lDigest(fToString(decoded.data.value) .. "-" .. nonce .. "-" .. secret) then
                    return decoded.data.value;
                else
                    onMessage("failed to verify integrity.");
                    return nil;
                end
            else
                return decoded.data.value;
            end
        else
            onMessage(decoded.message);
            return nil;
        end
    else
        return nil;
    end
end
return PB
