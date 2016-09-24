--2 Dias donates iniciais
function onUse(cid, item, frompos, item2, topos)
 
if item.uid ==5998 then
queststatus = getPlayerStorageValue(cid,5998)
if queststatus == 1 then
doPlayerSendTextMessage(cid,22,"Você ja recebeu seu bonus de boas vindas.")
 
else
doPlayerSendTextMessage(cid,22,"Seja bem vindo, receba 2 Dias DONATES para desfrutar de nosso servidor.")
doSendMagicEffect(topos,12)
coins_uid = doPlayerAddItem(cid,10311,2)
setPlayerStorageValue(cid,5998,1)
end
return 0
end
return 1
end
