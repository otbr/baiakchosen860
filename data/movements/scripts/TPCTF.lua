local config = {
pos = {x = 160, y = 54, z = 7},
storage = 16703
}


function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
if isPlayer(cid) and getCreatureStorage(cid, config.storage) < 0 then
doPlayerSendCancel(cid, "You cannot pass!")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
doTeleportThing(cid, fromPosition, true)
else
doTeleportThing(cid, config.pos)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
end
return true
end