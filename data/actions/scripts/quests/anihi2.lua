function onUse(cid, item)

local pos = {x=194, y=118, z=9, stackpos=253} -- posição do jogador mais proximo da alavanca
local uid = nil
--local delay = 500 -- tempo para resetar a quest
local t = {}

for i  = pos.x -3, pos.x do
local player = getThingFromPos({x=i, y=pos.y, z=pos.z, stackpos=253}).uid
if isCreature(player) then
if getPlayerStorageValue(player, 32800) == -1 and getPlayerLevel(player) >= 100 then
uid = uid == nil and 1 or uid + 1
t[uid] = player
end
else
return doPlayerSendCancel(cid, "Você precisa de 4 membros para fazer a quest.")
end
end

if #t == 4 then
for i = pos.x -3, pos.x do
doTeleportThing(getThingFromPos({x=i, y=pos.y, z=pos.z, stackpos=253}).uid, {x=i, y=pos.y, z=pos.z + 1})
doSendMagicEffect({x=i, y=pos.y, z=pos.z + 1}, 27)
end
--setGlobalStorageValue(32800, delay + os.time())
--addEvent(doCheck, delay*1000, t)
else
doPlayerSendCancel(cid, "Alguém no seu grupo já fez a quest.")
end

return TRUE
end