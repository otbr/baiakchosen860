function onUse(cid, item, frompos, item2, topos)
if item.uid == 10105 then
queststatus = getPlayerStorageValue(cid,20103)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou 50 crystal coin,500k")
doPlayerAddItem(cid,2160,50 )
setPlayerStorageValue(cid,20103,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez pegou sua recompensa")
end
else
return 0
end
return 1
end 