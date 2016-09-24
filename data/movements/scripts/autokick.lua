local config = {
 tempo = 60, --[[ Tempo em minutos ]]
 storage = 20000, --[[ Não mexa aqui ]]
 teleport = {x=160, y=54, z=7} --[[ Coordenadas do seu templo ]]
}
function onStepIn(cid, item, fromPosition, toPosition)
 events[cid] = {}
 if(isPlayer(cid)) then
  if(getPlayerStorageValue(cid, config.storage) <= 0) then
   events[cid][1] = addEvent(setPlayerStorageValue, config.tempo*60*1000-1000, cid, config.storage, -1)
   events[cid][2] = addEvent(doTeleportThing, config.tempo*60*1000-500, cid, config.teleport)
					    events[cid][3] = addEvent(doRemoveCreature, config.tempo*60*1000, cid)
   doPlayerSendTextMessage(cid, 22, "[Ygnus Trainer]: Movimente-se a cada " .. config.tempo .. " minutos, caso contrário, seu char será deslogado.")
   setPlayerStorageValue(cid, config.storage, 1)
  end
 end
 return true
end
function onStepOut(cid, item, fromPosition, toPosition)
 if(isPlayer(cid)) then
  if(getPlayerStorageValue(cid, config.storage) >= 1) then
  stopEvent(events[cid][1])
  stopEvent(events[cid][2])
  stopEvent(events[cid][3])
			    events[cid] = nil
   setPlayerStorageValue(cid, config.storage, -1)
   doPlayerSendTextMessage(cid, 23, "System kick off!")
  end
 end
 return true
end