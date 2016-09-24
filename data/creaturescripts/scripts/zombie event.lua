local config = {
        playerCount = 2001, -- Global storage for counting the players left/entered in the event
        
        goblet = 5805, -- id of the gold goblet you'll get when finishing the event.
        rewards = {7958, 3983, 8857}, -- You will get this +  a gold goblet with your name on.
        --              {moneyId, count, using? 1 for using moneyReward, 0 for not using.}
        moneyReward = {2160, 100, 1},
        
        -- Should be same as in the globalevent!
        -- The zombies will spawn randomly inside this area
        fromPosition = {x = 806, y = 38, z = 7}, -- top left cornor of the playground
        toPosition = {x = 868, y = 85, z = 7}, -- bottom right cornor of the playground
        }

function onStatsChange(cid, attacker, type, combat, value)
        if isPlayer(cid) and isMonster(attacker) then
                if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
                        if getGlobalStorageValue(config.playerCount) >= 2 then
                                doBroadcastMessage(getPlayerName(cid) .. " have been eated by Zombies!", MESSAGE_STATUS_CONSOLE_RED)
                                local corpse = doCreateItem(3058, 1, getPlayerPosition(cid))
                                doItemSetAttribute(corpse, "description", "You recognize " .. getCreatureName(cid) .. ". He was killed by "..(isMonster(attacker) and "a "..string.lower(getCreatureName(attacker)) or isCreature(attacker) and getCreatureName(attacker) or "a field item")..".")
                                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
                                doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
                                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
                                setGlobalStorageValue(config.playerCount, getGlobalStorageValue(config.playerCount)-1)
                        elseif getGlobalStorageValue(config.playerCount) == 1 then
                                if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
                                        doBroadcastMessage(getPlayerName(cid) .. " won the Zombie event! Congratulations!", MESSAGE_STATUS_WARNING)
                                        local goblet = doPlayerAddItem(cid, config.goblet, 1)
                                        doItemSetAttribute(goblet, "description", "Awarded to " .. getPlayerName(cid) .. " for winning the Zombie event.")
                                        local corpse = doCreateItem(3058, 1, getPlayerPosition(cid))
                                        doItemSetAttribute(corpse, "description", "You recognize " .. getCreatureName(cid) .. ". He was killed by "..(isMonster(attacker) and "a "..string.lower(getCreatureName(attacker)) or isCreature(attacker) and getCreatureName(attacker) or "a field item")..".")
                                        doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
                                        doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
                                        doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
                                        for _,items in ipairs(config.rewards) do
                                                doPlayerAddItem(cid, items, 1)
                                        end
                                        if config.moneyReward[3] == 1 then
                                                doPlayerAddItem(cid, config.moneyReward[1], config.moneyReward[2])
                                        end
                                end
                                                
                                for x = config.fromPosition.x, config.toPosition.x do
                                        for y = config.fromPosition.y, config.toPosition.y do
                                                for z = config.fromPosition.z, config.toPosition.z do
                                                        areapos = {x = x, y = y, z = z, stackpos = 253}
                                                        getMonsters = getThingfromPos(areapos)
                                                        if isMonster(getMonsters.uid) then
                                                                doRemoveCreature(getMonsters.uid)
                                                        end
                                                end
                                        end
                                end
                        end
                        return false
                end
        end
return true
end