function onLogout(cid)
local pos = {x=1039, y=1072, z=7} -- Para onde quando o player deslogar da hunt sera teleportado
if getPlayerStorageValue(cid, 28680) == 1 then
doSendMagicEffect(getThingPos(cid), 29)
doTeleportThing(cid, pos)
setGlobalStorageValue(24688, 0)
setGlobalStorageValue(24686, none)
setPlayerStorageValue(cid, 28680, 0)
return true
end
return true
end