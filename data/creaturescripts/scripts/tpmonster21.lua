local config = {
message = "Parabens! O teleport vai fechar em 20 segundos",
timeToRemove = 20, -- seconds
teleportId = 1387,
bosses = {
["Gaia"] = { x = 207, y = 1966, z = 8 },

}
}

local function removal(position)
doRemoveThing(getTileItemById(position, config.teleportId).uid, 1)
return TRUE
end

function onDeath(cid, corpse, killer)
registerCreatureEvent(cid, "teleportmonster")
local position = getCreaturePosition(cid)

for name, pos in pairs(config.bosses) do
if name == getCreatureName(cid) then
teleport = doCreateTeleport(config.teleportId, pos, position)
doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
addEvent(removal, config.timeToRemove * 1000, position)
doSendMagicEffect(position,10)
end
end
return TRUE
end