function onUse(cid, item, frompos, item2, topos)
if item.uid == 1452 then
queststatus = getPlayerStorageValue(cid,1452)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voc� ganhou 200 de HP e 400 de MP!.")
        local health = 200
		local mana = 400
 setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + health)
 setCreatureMaxMana(cid, getCreatureMaxMana(cid) + mana)
setPlayerStorageValue(cid,1452,1)
else
doPlayerSendTextMessage(cid,22,"Voc� j� pegou seu premio!")
end
else
return 0
end
return 1
end 