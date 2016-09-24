function onStepIn(cid, item, pos)
	doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
	doCreatureAddMana(cid, getCreatureMaxMana(cid))
	doSendMagicEffect(getCreaturePosition(cid), 12)
end