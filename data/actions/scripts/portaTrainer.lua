function onUse(cid, item, frompos, item2, topos)
doTransformItem(item.uid, item.itemid + 1)
doTeleportThing(cid, topos, TRUE)
return true
end