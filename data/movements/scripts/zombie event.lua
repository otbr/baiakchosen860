local config = {
        playerCount = 2001, -- Global storage for counting the players in the event
        maxPlayers = 20, -- Max players who can participate
        
        }
        
function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
        if getGlobalStorageValue(config.playerCount) < config.maxPlayers then
                setGlobalStorageValue(config.playerCount, getGlobalStorageValue(config.playerCount)+1)
                if getGlobalStorageValue(config.playerCount) == config.maxPlayers then
                        doBroadcastMessage("The Zombie event is now full [" .. getGlobalStorageValue(config.playerCount) .. " players]! The event will soon start.")
                else    
                        doBroadcastMessage(getPlayerName(cid) .. " entered the Zombie event! Currently " .. getGlobalStorageValue(config.playerCount) .. " players have joined!", MESSAGE_STATUS_CONSOLE_RED)
                end     
        else
                addEvent(tpBack, 1000, cid, fromPosition)
                doPlayerSendCancel(cid, "The event is full. There is already " .. config.maxPlayers .. " players participating in the quest.")
                return false
        end
        print(getStorage(config.playerCount) .. " Players in the zombie event.")
        return true
end

function tpBack(cid, fromPosition)
        doTeleportThing(cid, fromPosition, true)
        doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
end