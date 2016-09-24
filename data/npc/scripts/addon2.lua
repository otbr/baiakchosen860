local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	selfSay('Ol� ' .. getCreatureName(cid) .. ', fale {addon 2} para mais informa��es!',cid)

	if(msgcontains(msg, 'addon 2') or msgcontains(msg, 'seccond addon') or msgcontains(msg, 'addon')) then
		selfSay('Para conseguir o addon 2 do Warmaster eu preciso que voc� me traga uma {Baiak Sword}, voc� trouxe uma?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if(getPlayerItemCount(cid, 8931) >= 1) then
			if(doPlayerRemoveItem(cid, 8931,1) == TRUE) then				
				if getPlayerSex(cid) == 0 then
				doPlayerAddOutfit(cid, 335, 2)
				else
				doPlayerAddOutfit(cid, 336, 2)
				talk_start = 0
				end 
				selfSay('Parab�ns! Agora voc� possui o segundo Addon Warmaster.', cid)
			else
				selfSay('Desculpe, volte quando tiver uma {Baiak Sword}.', cid)
			end
		else
			selfSay('Desculpe, voc� n�o tem uma {Baiak Sword}.', cid)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
