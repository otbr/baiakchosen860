function onKill(cid, target, lastHit)

   if not isMonster(target) or getConfigValue("rateExperience") < 0.1 or getMonsterInfo(getCreatureName(target)) and getMonsterInfo(getCreatureName(target)).experience < 1 then return true end

   local pet = getPlayerPet(cid)
   if pet then
	  doPetAddExperience(pet, getMonsterInfo(getCreatureName(target)).experience * petExpRate)
	  if getLevelByExp(getPetExperience(pet)) > getPetLevel(pet) then
		 doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Your pet advanced from level " .. getPetLevel(pet) .. " to level " .. getLevelByExp(getPetExperience(pet)) .. ".")
		 doPetSetLevel(pet, getLevelByExp(getPetExperience(pet)))
	  end
   end
   return true
end