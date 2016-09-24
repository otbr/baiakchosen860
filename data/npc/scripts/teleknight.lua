local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local pos = {x=1059,y=133,z=0}

function onCreatureAppear(cid)                  npcHandler:onCreatureAppear(cid)                end
function onCreatureDisappear(cid)               npcHandler:onCreatureDisappear(cid)             end
function onCreatureSay(cid, type, msg)          npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                              npcHandler:onThink()                            end

function creatureSayCallback(cid, type, msg)
if msgcontains(msg, 'go') then
if getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8 then           
selfSay("Boa viagem.", cid)
doTeleportThing(cid, pos)
else
selfSay("Eu só posso teleportar Knights.", cid)
end
end
return TRUE  
end
        
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())