function onStepIn(cid, item, position, fromPosition)
local tiles = {
[18001] = {x=1814, y=1341, z=7},
[18002] = {x=1810, y=2283, z=4},
[18003] = {x=180, y=54, z=7},
[18004] = {x=200, y=54, z=7}
}
return doTeleportThing(cid, tiles[item.actionid])
end