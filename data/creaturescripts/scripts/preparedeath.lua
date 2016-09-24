function onDeath(cid, corpse, deathList)
if (getPlayerSlotItem(cid, 2).itemid == 7890) and getPlayerSkullType(cid) >= 4 then 
	doCreatureSetDropLoot(cid, false)  
end
return true
end