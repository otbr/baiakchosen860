-----------------------------------------------------------------------------------
--[[CONFIG]]-- --[[obs: todas as storages devem ser iguais a do primeiro script]]--
local storageGlobal = 17892 -- storage global.
-----------------------------------------------------------------------------------
local storagePlayer = 12940 -- 1ª storage.
local storagePlayer2 = 123654 -- 2ª storage.
local storagePlayer3 = 654321 -- 3ª storage
-----------------------------------------------------------------------------------
local rankStorage = 456321 -- Rank Storage.
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
function onDeath(cid, corpse, killer)
    if getGlobalStorageValue(storageGlobal) >= 1 then
       if isPlayer(cid) and isPlayer(killer[1]) then
           if (getPlayerStorageValue(cid, storagePlayer3) - os.time() >= 1) and (getPlayerStorageValue(killer[1], storagePlayer3) - os.time() >= 1) then
               setPlayerStorageValue(killer[1], storagePlayer, getPlayerStorageValue(killer[1], storagePlayer) + 1)
              if (getPlayerStorageValue(killer[1], rankStorage) == -1) then
                  setPlayerStorageValue(killer[1], rankStorage, 1)
                   else
                  setPlayerStorageValue(killer[1], rankStorage, getPlayerStorageValue(killer[1], rankStorage) + 1)
              end
          end
       end
    end
-----------------------------------------------------------------------------------
 return true
end
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
function onLogin(cid)
registerCreatureEvent(cid, "SurvivalOfTheFittest")
    if (getPlayerStorageValue(cid, storagePlayer3) - os.time() <= 0) then
        setPlayerStorageValue(cid, storagePlayer, 0)
        setPlayerStorageValue(cid, storagePlayer2, 0)
    end
-----------------------------------------------------------------------------------
 return true
end
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------