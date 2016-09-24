local npcHandler = NpcHandler:new(keywordHandler)
function onThink()
	npcHandler:onThink()
	doCreatureSetLookDirection(getNpcId(), (2))
end