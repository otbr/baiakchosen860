function onStepIn(cid, item, position, fromPosition)
		if getMyReputation(cid) <= 0 then
			   doTeleportThing(cid, fromPosition, false)
			   doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
			   doPlayerSendTextMessage(cid, 22, "Desculpe, mais voc� precisa de reputa��o para passar.Diga !helpRep e Ganhe Bonus e Promotion")
		end
		return TRUE
end