--[[
 * Nome: Scroll Messages
 * Author: Skyen Hasus
 * Version: 1.00.18
 
 * From:
 * www.otserv.com.br
 
 * Syntax: doScrollMessage(uid, message)
 * Example: doScrollMessage(cid, "Welcome!")
]]--
 
--[[ Config: ]]--
--[[ Display: string lenght]]--
local display = 60
 
--[[ Delay: Time in milliseconds ]]--
local delay = 100
 
function doScrollMessage(uid, message)
 
    if message == nil or uid == nil then
                return true
        end
 
        local chars = {}
 
    for i = 1, display do
                table.insert(chars, " ")
    end
 
    for i = 1, string.len(message) do
                table.insert(chars, string.sub(message, i, i))
    end
 
    for i = 1, display + 1 do
                table.insert(chars, " ")
    end
 
    local function doScroll(uid, message, i, j)
        if isPlayer(uid) then
          f = display + i
            if f > #chars then
                                f = display + string.len(message)
            end
 
                        doPlayerSendCancel(uid, table.concat(chars, "", i, f))
 
            if i <= j then
                                addEvent(doScroll, delay, uid, message, i+1, j)
            end
        end
    end
 
        doScroll(uid, chars, 1, display + string.len(message))
        return true
end