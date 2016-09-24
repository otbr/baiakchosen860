-- == Blood Castle Event por Killua == --

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
     if item.actionid == 4726 then
          setGlobalStorageValue(bloodconfig.playersStorage, getPlayersInBlood()+1)
          print(getPlayersInBlood().. " Jogadores no Blood Castle")
     elseif item.actionid == 9371 then
          setGlobalStorageValue(bloodconfig.playersStorage, getPlayersInBlood()-1)
          print(getPlayersInBlood().. " Jogadores no Blood Castle")
     end
return true
end