function onUse(cid, item, frompos, item2, topos)
if item.uid == 1453 then
queststatus = getPlayerStorageValue(cid,1453)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você ganhou 400 de HP e 200 de MP!.")
        local health = 400
		local mana = 200
 setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + health)
 setCreatureMaxMana(cid, getCreatureMaxMana(cid) + mana)
setPlayerStorageValue(cid,1453,1)
else
doPlayerSendTextMessage(cid,22,"Você já pegou seu premio!")
end
else
return 0
end
return 1
end 