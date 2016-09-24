function onUse(cid, item, frompos, item2, topos)

if getPlayerAccess(cid) == 0 then


player1pos = {x=topos.x, y=topos.y, z=topos.z, stackpos=253}
player1 = getThingfromPos(player1pos)



if player1.itemid > 0 then
temple = {x=559, y=18, z=7}
outrapos = {x=100, y=50, z=7}
segundos = 60

doSendMagicEffect(topos,12)
doTeleportThing(player1.uid,temple)
addEvent(doTeleportThing, segundos*1000, player1.uid, outrapos)
addEvent(doPlayerSendTextMessage, segundos*1000, player1.uid,22,"Acorda FDP!.")
doSendMagicEffect(temple,12)
doPlayerSendTextMessage(player1.uid,22,"Você fumou um baseado do baum.")
if item.type > 1 then
doChangeTypeItem(item.uid,item.type-1)
else
doRemoveItem(item.uid,1)
end
return 0
else
doSendMagicEffect(frompos,2)
return 0
end
else
doPlayerSendTextMessage(cid,22,"FDP , TENTANDO FUMAR NÉ ???")
return 0
end
end
