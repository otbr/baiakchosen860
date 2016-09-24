function onUse(cid, item, frompos, item2, topos)
if item.uid == 1454 then
queststatus = getPlayerStorageValue(cid,1454)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você ganhou 300 de HP e 300 de MP!.")
        local health = 300
		local mana = 300
 setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + health)
 setCreatureMaxMana(cid, getCreatureMaxMana(cid) + mana)
setPlayerStorageValue(cid,1454,1)
else
doPlayerSendTextMessage(cid,22,"Você já pegou seu premio!")
end
else
return 0
end
return 1
end 