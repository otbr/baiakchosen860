function onDeath(cid, corpse, deathList)

   if not isMonster(cid) or not isPet(cid) then return true end

   doCreatureSetStorage(getCreatureMaster(cid), petStorages.isDead, 1)
   doPlayerSendTextMessage(getCreatureMaster(cid), MESSAGE_STATUS_CONSOLE_BLUE, "Your pet is dead.")
   return true
end