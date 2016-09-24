function onStepIn(cid, item, position, fromPosition)

local config = {
msgDenied = "Desculpe, você nao é DONATE. Compre agora mesmo em nosso site..",
msgWelcome = "Bem Vindo a Area DONATE!"
}

if getPlayerStorageValue(cid, 13500) - os.time() <= 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
return TRUE
end