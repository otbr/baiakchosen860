--[[
 
Name: Reputation Sytem
Author: Kimoszin
Version: v0.1
Site: www.phenomy.com.br
 
]]--
 
function setReputation(id, point)
        local reps = db.getResult("SELECT `rep` FROM `players` WHERE `id` = "..id..";")
        local p = reps:getDataInt("rep") + point
        if db.executeQuery("UPDATE `players` SET `rep` = "..p.." WHERE `id` = "..id..";") then
        return TRUE
    end
        return FALSE
end
 
function removeReputation(id, point)
        local reps = db.getResult("SELECT `rep` FROM `players` WHERE `id` = "..id..";")
        local p = reps:getDataInt("rep") - point
        if db.executeQuery("UPDATE `players` SET `rep` = "..p.." WHERE `id` = "..id..";") then
        return TRUE
    end
        return FALSE
end
 
function getMyReputation(cid)
        return getReputation(getPlayerAccountId(cid))
end
 
function getReputation(id)
        local reps = db.getResult("SELECT `rep` FROM `players` WHERE `id` = "..id..";")
        return reps:getDataInt("rep")
end