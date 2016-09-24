function onStepIn(cid, item, position, fromPosition)

local config = {
msgDenied = "Está área é exclusiva para jogadores VIP 2. Para adquirir sua VIP basta fazer a quest VIP, localizada no Temple.",
msgWelcome = "Bem vindo!"
}

if getPlayerStorageValue(cid, 13540) - os.time() <= 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
return TRUE
end