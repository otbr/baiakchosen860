function onStatsChange(cid, attacker, type, combat, value)

   if getPlayerPet(cid) and getPlayerPet(cid) == attacker then
	  return false
   end
   return true
end