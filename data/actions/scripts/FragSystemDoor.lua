function onUse(cid, item, frompos, item2, topos)
local MyGuild = getPlayerGuildName(cid)
if not HaveGuild(cid) then
return doPlayerSendTextMessage(cid,22,"Desculpa, voc� n�o est� em uma guild.")
elseif not HaveAcess(MyGuild) then
return doPlayerSendTextMessage(cid,22,"Sua guilda n�o tem acesso a esta �rea.G.F.S") end
doTransformItem(item.uid, item.itemid + 1)
doTeleportThing(cid, topos, TRUE)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Bem-vindo, o acesso de sua Guild nesta �rea acaba em "..getAcessDate(getGuildWinnerName()))
return true
end