function onLogout(cid)
local stor = 49015
local expfinal = 1
if getPlayerStorageValue(cid, stor) >= 1 then
setPlayerStorageValue(cid, stor, 0)
doPlayerSetExperienceRate(cid,expfinal)
else
end
return true
end