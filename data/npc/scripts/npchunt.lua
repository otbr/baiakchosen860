local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)

local pos = {x=86, y=945, z=15} -- Local da hunt
local posreturn = {x=160, y=54, z=7} -- Posiçao onde o player sera teleportado quando acabar o tempo
local money = 250000 --- Quanto de dinheiro sera removido
config = {
time = 15 ---Tempo que ele vai ficar na hunt sabendo que cada numeral equivale a um minuto-----
}
function doReturnPos(cid)
if isCreature(cid) then
   doTeleportThing(cid, posreturn)
   setGlobalStorageValue(24688, 0)
   setGlobalStorageValue(24686, -1)
   setPlayerStorageValue(cid, 28680, 0)
end
end

if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if msgcontains(msg, 'arena') then
   if getGlobalStorageValue(24688) == 1 then
          doPlayerSendTextMessage(cid,22, "O player "..getGlobalStorageValue(24686).." esta na arena.")
          return true
   end
   if not doPlayerRemoveMoney(cid, money) then
          doPlayerSendTextMessage(cid, 22, getPlayerName(cid).." precisa de 500k para entrar na arena.")
          return true
   end
   doPlayerRemoveMoney(cid, money)
   doPlayerSendTextMessage(cid, 22, getPlayerName(cid).." voce tem 15 minutos para fazer a quest se passar o tempo, voce sera teleportado para o templo.")
   doTeleportThing(cid, pos)
   setGlobalStorageValue(24688, 1)
   setGlobalStorageValue(24686, getPlayerName(cid))
   setPlayerStorageValue(cid, 28680, 1)
   addEvent(doReturnPos, config.time*60*1000, cid)
else
   selfSay('Diga arena', cid)
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())