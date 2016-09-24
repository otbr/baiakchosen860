function onUse(cid, item, frompos, item2, topos)
if item.uid == 10106 then
queststatus = getPlayerStorageValue(cid,20103)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou 1kk Crystal Coin")
doPlayerAddItem(cid,2160,100 )
setPlayerStorageValue(cid,20103,1)
else
doPlayerSendTextMessage(cid,22,"Você ja ganhou sua recompensa")
end
else
return 0
end
return 1
end 