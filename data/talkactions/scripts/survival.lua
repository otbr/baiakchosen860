----------------[[System by Eduardo Carvalho]]----------------------------------
--------------------------------------------------------------------------------
--[[CONFIG WORDS]]--
local wordsPlayer = "!goEvent" -- o que o player tem que falar.
local wordsGm = "!openEvent" -- o que o god tem que falar.
--[[CONFIG NAME]]--
local name = "Survival of the Fittest" -- nome do evento
--[[CONFIG "PLAYER"]]--
local level = 150  -- level necessario
local storagePlayer = 12940 -- 1ª storage
local storagePlayer2 = 123654 -- 2ª storage
local storagePlayer3 = 654321 -- 3ª storage
local posPlayer = {x= 1368, y= 871, z= 7} -- Posição para onde o player será teleportado.
--[[CONFIG "GOD"]]--
local storageGlobal = 17892 -- storage global.
local time = 5 -- tempo para acabar o evento em minutos.
--[[RECOMPENSA]]--
local recompensa = {{2160, 100}, {7440, 1}} -- {{id do item, quantidade} , {id do item, quantidade}}
-------- Para adicionar mais items segue esse padrão : {{1 recompensa}, {2 recompensa}, {...}, {...}}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
         function fim()
             if getGlobalStorageValue(storageGlobal) >= 1 then
               local max = 0
                local winner = 0
                  for _, pid in pairs(getPlayersOnline()) do
                     local sto = getPlayerStorageValue(pid, storagePlayer)
                     if sto > max then
                         max = sto
                         winner = pid
                     end
                  end
                   if isPlayer(winner) then
                       doBroadcastMessage("O Jogador ["..getCreatureName(winner).."] matou ["..getPlayerStorageValue(winner, storagePlayer).." Player's] e ganhou o evento.")
                      for i = 1, #recompensa do
                       doPlayerAddItem(winner, recompensa[i][1], recompensa[i][2])
                      end
                   else
                       doBroadcastMessage("O evento acabou e não teve um vencedor.")
                   end
                     setGlobalStorageValue(storageGlobal, 0)
             end
         end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function onSay(cid, words, param)
--------------------------------------------------------------------------------
if(words == wordsPlayer) then
 if getPlayerGroupId(cid) <= 1 then
    if getGlobalStorageValue(storageGlobal) >= 1 then
       if getPlayerStorageValue(cid, storagePlayer2) <= 0 then
          if getPlayerLevel(cid) >= level then
             if getCreatureCondition(cid, CONDITION_INFIGHT) == FALSE then
                doTeleportThing(cid, posPlayer)
                   doSendMagicEffect(posPlayer, 5)
                     doPlayerSendCancel(cid, "Boa Sorte, mate todos.")
                   doBroadcastMessage("O Jogador ["..getCreatureName(cid).."] está participando, essa é sua chance de matá-lo.")
                  setPlayerStorageValue(cid, storagePlayer2, 1)
                setPlayerStorageValue(cid, storagePlayer3, os.time() + time * 60)
             else
               doPlayerSendCancel(cid, "Você não pode ser teleportado com Battle.")
             end
          else
            doPlayerSendCancel(cid, "Para participar do evento você precisa ter level maior ou igual à  "..level..".")
          end
       else
          doPlayerSendCancel(cid, "Você já participou do evento nessa rodada.")
       end
    else
       doPlayerSendCancel(cid, "O Evento não está aberto.")
    end
 else
  doPlayerSendCancel(cid, "Essa Função é Para Players.")
end
--------------------------------------------------------------------------------
elseif(words == wordsGm) then
 if getPlayerGroupId(cid) >= 4 then
     if getGlobalStorageValue(storageGlobal) <= 0 then
        for _, pid in pairs(getPlayersOnline()) do
           setPlayerStorageValue(pid, storagePlayer, 0)
           setPlayerStorageValue(pid, storagePlayer2, 0)
        end
          doBroadcastMessage("O Evento ["..name.."] começou, e será Fechado em "..time.." Minutos. Fale ["..wordsPlayer.."] Para participar.")
            setGlobalStorageValue(storageGlobal, 1)
          addEvent(fim, time*60*1000)
      else
          doPlayerSendCancel(cid, "O Evento ["..name.."] já está aberto.")
     end
 else
      doPlayerSendCancel(cid, "Apenas o [ADM] Pode Usar essa função")
 end
end
--------------------------------------------------------------------------------
 return true
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------