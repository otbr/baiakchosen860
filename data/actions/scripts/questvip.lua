function onUse(cid, item, frompos, item2, topos)
if item.uid == 1360 then --primeiro bau--
queststatus = getPlayerStorageValue(cid,1360)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voc� achou um spellbook of lost souls")
item_uid = doPlayerAddItem(cid,8903,1)
setPlayerStorageValue(cid,1360,1)

else
doPlayerSendTextMessage(cid,22,"O ba� est� vazio.")
end

elseif item.uid == 1361 then --segundo bau--
queststatus = getPlayerStorageValue(cid,1360)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voc� achou uma saia vegetal")
item_uid = doPlayerAddItem(cid,3983,1)
setPlayerStorageValue(cid,1360,1)

else
doPlayerSendTextMessage(cid,22,"O ba� est� vazio.")
end

elseif item.uid == 1362 then --terceiro bau--
queststatus = getPlayerStorageValue(cid,1360)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voc� achou um Vip Helmet")
item_uid = doPlayerAddItem(cid,3972,1)
setPlayerStorageValue(cid,1360,1)

else
doPlayerSendTextMessage(cid,22,"O ba� est� vazio.")
end

else
return 0
end
return 1
end