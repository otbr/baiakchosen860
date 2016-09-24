local l =
{
   ["north"] = NORTH,
   ["east"] = EAST,
   ["south"] = SOUTH,
   ["west"] = WEST,
   ["southwest"] = SOUTHWEST,
   ["southeast"] = SOUTHEAST,
   ["northwest"] = NORTHWEST,
   ["northeast"] = NORTHEAST
}
--fixed by falcon--
function onSay(cid, words, param, channel)
   if(param == '') then
	  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
	  return true
   end

   if param:lower() == "call" then
	  if getCreatureStorage(cid, petStorages.isDead) > 0 then
		 return doPlayerSendCancel(cid, "You need to revive your pet first.")
	  end
	  if getTilePzInfo(getCreaturePosition(cid)) then
		 return doPlayerSendCancel(cid, "You cannot call your pet in protection zone.")
	  end
	  local pet = getPlayerPet(cid)
	  if not pet then
		 return callPet(cid)
	  else
		 doCreatureSetStorage(cid, petStorages.health, getCreatureHealth(pet))
		 doCreatureSetStorage(cid, petStorages.mana, getCreatureMana(pet))  
		 doSendMagicEffect(getCreaturePosition(pet), CONST_ME_POFF)
		 doRemoveCreature(pet)
		 return doCreatureSay(cid, "It's enough!", TALKTYPE_SAY)
	  end
   elseif param:lower() == "info" then
	  local pet = getPlayerPet(cid)
	  if pet then
		 local pet_ = getPetInfo(getCreatureName(pet))
		 local attacks = ""
		 if pet_.attacks and #pet_.attacks > 0 then
		    for i = 1, #pet_.attacks do
			   attacks = attacks .. "Attack ID: " .. i .. "\n" .. (pet_.attacks[i].name ~= "" and "    Name: " .. pet_.attacks[i].name .. "\n" or "") .. "    Level: " .. pet_.attacks[i].level .. "\n    Pet level: " .. pet_.attacks[i].petLevel .. "\n    Pet mana: " .. pet_.attacks[i].mana .. "\n"
		    end
		 end
		 return doShowTextDialog(cid, 1948, "Here is your pet info:\n" ..
		    "\nName: " .. getCreatureName(pet) ..
		    "\nHealth: " .. getCreatureHealth(pet) .. "-" .. getCreatureMaxHealth(pet) ..
		    "\nMana: " .. getCreatureMana(pet) .. "-" .. getCreatureMaxMana(pet) ..
		    "\nLevel: " .. getPetLevel(pet) ..
		    "\nExperience: " .. getPetExperience(pet) ..
		    "\n-----Attacks-----\n" .. (attacks ~= "" and attacks or "No attacks"))
	  else
		 return doPlayerSendCancel(cid, "Please call your pet first.")
	  end
   elseif param:lower() == "take" then
	  local pet = getPlayerPet(cid)
	  if not pet then
		 return doPlayerSendCancel(cid, "Please call your pet first.")
	  end

	  local slot = 0
	  for i = 1, carryItems do
		 if getCreatureStorage(cid, petItems[i]) < 1 then
		    slot = i
		    break
		 end
	  end

	  if slot == 0 then
		 return doPlayerSendCancel(cid, "You only can carry " .. carryItems .. " items.")
	  end

	  local item = getTopItem(getCreaturePosition(pet))
	  if getItemWeightById(item.itemid, 1) and getItemWeightById(item.itemid, 1) < 1 then
		 return doPlayerSendCancel(cid, "There is no item to carry.")
	  end

	  if isInArray(blockedItems, item.itemid) then
		 return doPlayerSendCancel(cid, "You cannot carry this item.")
	  end
	  doCreatureSetStorage(cid, petItems[slot], item.itemid * 1000 + (item.type > 0 and item.type or 1))
	  doRemoveItem(item.uid)
	  doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You take an item.")
	  return true
   elseif param:lower() == "items" then
	  local list = "Here is the list of items:\n"
	  for i = 1, carryItems do
		 if getCreatureStorage(cid, petItems[i]) < 1 then
		    list = list .. "\n" .. i .. ". Empty."
		 else
		    local thing = getCreatureStorage(cid, petItems[i])
		    local item = math.floor(thing / 1000)
		    local count = thing - item * 1000
		    list = list .. "\n" .. i .. ". x" .. count .. " " .. getItemNameById(item) .. "."
		 end
	  end

	  return doShowTextDialog(cid, 1948, list)
   else
	  param = string.explode(param, ":")
	  if param[1]:lower() == "attack" then
		 local pet = getPlayerPet(cid)
		 if not pet then
		    return doPlayerSendCancel(cid, "Please call your pet first.")
		 end
		 if not param[2] or not isNumber(param[2]) or tonumber(param[2]) < 1 then
		    return doPlayerSendCancel(cid, "No attack index specified.")
		 end

		 if exhaustion.get(cid, petStorages.exhaust) then
		    return doPlayerSendCancel(cid, "You are exhausted.") and doSendMagicEffect(getCreaturePosition(getCreatureSummons(cid)[1]), CONST_ME_POFF)
		 end

		 doAttack(pet, getCreatureTarget(cid), tonumber(param[2]))
		 exhaustion.set(cid, petStorages.exhaust, petExhaust)
	  elseif param[1]:lower() == "give" then
		 local pet = getPlayerPet(cid)
		 if not pet then
		    return doPlayerSendCancel(cid, "Please call your pet first.")
		 end
		 if not param[2] or not isNumber(param[2]) or tonumber(param[2]) < 1 then
		    return doPlayerSendCancel(cid, "No slot specified.")
		 end

		 if getCreatureStorage(cid, petItems[tonumber(param[2])]) > 0 then
		    local thing = getCreatureStorage(cid, petItems[tonumber(param[2])])
		    local item = math.floor(thing/1000)
		    local count = thing-item*1000
		    doPlayerAddItem(cid, item, count)
		    doCreatureSetStorage(cid, petItems[tonumber(param[2])], 0)
		    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You get an item.")
		 else
		    return doPlayerSendCancel(cid, "This slot is empty.")
		 end
	  elseif param[1]:lower() == "say" then
		 local pet = getPlayerPet(cid)
		 if not pet then
		    return doPlayerSendCancel(cid, "Please call your pet first.")
		 end
		 if not param[2] or param[2] == "" then
		    return doPlayerSendCancel(cid, "Command param required.")
		 end

		 if exhaustion.get(cid, petStorages.sayExhaust) then
		    return doPlayerSendCancel(cid, "You are exhausted.") and doSendMagicEffect(getCreaturePosition(getCreatureSummons(cid)[1]), CONST_ME_POFF)
		 end

		 doCreatureSay(pet, param[2], TALKTYPE_MONSTER)
		 exhaustion.set(cid, petStorages.sayExhaust, petExhaust)
	  elseif param[1]:lower() == "move" then
		 local pet = getPlayerPet(cid)
		 if not pet then
		    return doPlayerSendCancel(cid, "Please call your pet first.")
		 end
		 if not param[2] or param[2] == "" then
		    return doPlayerSendCancel(cid, "Command param required.")
		 end

		 if exhaustion.get(cid, petStorages.moveExhaust) then
		    return doPlayerSendCancel(cid, "You are exhausted.") and doSendMagicEffect(getCreaturePosition(getCreatureSummons(cid)[1]), CONST_ME_POFF)
		 end

		 local dir
		 if l[param[2]:lower()] then
		    dir = l[param[2]:lower()]
		    local toPos = getPosByDir(getCreaturePosition(pet), dir, 1)
		    local ret = queryTileAddThing(pet, toPos)
		    if ret == RETURNVALUE_NOERROR then
			   doMoveCreature(pet, dir)
			   exhaustion.set(cid, petStorages.moveExhaust, petExhaust)
		    else
			   return doPlayerSendCancel(cid, "There is not enough room.") and doSendMagicEffect(getCreaturePosition(pet), CONST_ME_POFF)
		    end
		 else
		    return doPlayerSendCancel(cid, "No direction specified.")
		 end
	  elseif isInArray({"mana", "health"}, param[1]:lower()) then
		 if getPlayerGroupId(cid) < 3 then
		    return false
		 end
		 local pet = getPlayerPet(cid)
		 if not pet then
		    return doPlayerSendCancel(cid, "Please call your pet first.")
		 end
		 if not param[2] or not isNumber(param[2]) then
		    return doPlayerSendCancel(cid, "Command param required.")
		 end

		 if param[1]:lower() == "health" then
		    doCreatureAddHealth(pet, tonumber(param[2]))
		 elseif param[1]:lower() == "mana" then
		    doCreatureAddMana(pet, tonumber(param[2]))
		 end
		 return doSendMagicEffect(getCreaturePosition(pet), (param[1]:lower() == "health" and CONST_ME_MAGIC_RED or CONST_ME_MAGIC_BLUE))
	  end
   end
   return true
end