function onSay(cid, words, param)

local config = {
pz = true, -- players precisam estar em protection zone para usar? (true or false)
battle = false, -- players deve estar sem battle? (true or false)
custo = true, -- precisa de dinheiro para teleportar? (true or false)
need_level = true, -- nível necessario para usar o comando (true or false)
vip = true -- se precisa ser vip account ou premium account (true or false)
}

--[[ Config lugares]]-- level é o nivel necessario para usar o comando, e price é o dinheiro necessario para usar o comando
local lugar = {
["depot"] = { -- nome do lugar
pos = {x= 126, y= 53, z= 6},level = 150,price = 1000}, 
["temple"] = { -- nome do lugar
pos = {x= 160, y= 54, z= 7},level = 150, price = 1000},
["npc"] = { -- nome do lugar
pos = {x= 126, y= 52, z= 4},level = 150,price = 1000},
["teleportes"] ={ -- nome do lugar
pos = {x=307, y=196, z=8},level = 150,price = 1000}
}

--[[ Lista de Viagem (Não mexa) ]]--
if (param == "list") then
local str = ""
str = str .. "Citys list:\n\n"
for name, pos in pairs(lugar) do
str = str..name.."\n"
end
str = str .. ""
doShowTextDialog(cid, 6579, str)
return TRUE
end


local a = lugar[param]
if not(a) then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Desculpa,Lugar Nao Existe,Diga temple,depot,npc e teleportes")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
elseif config.pz == true and getTilePzInfo(getCreaturePosition(cid)) == FALSE then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Voce deve estar na Area de PZ.")
return TRUE
elseif config.vip == true and isPremium(cid) == false then -- Se você tiver um sistema de VIP, pegar o comando isVip, ou algo semelhante e trocar por isPremium
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Apenas os Jogadores PREMIUM podem Teleportar.diga !buypremium") 
return TRUE
elseif config.battle == true and getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce Presisa Tar Fora de Combate")
return TRUE
elseif config.need_level == true and getPlayerLevel(cid) < a.level then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce nao tem level, você precisa de um "..a.level.." level para Teleportar.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
elseif config.custo == true and doPlayerRemoveMoney(cid, a.price) == FALSE then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce nao Dinheiro, Voce Precisa De"..a.price.." Gp's Para Ser Teleportado.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
end
doTeleportThing(cid, a.pos)
doSendMagicEffect(a.pos, CONST_ME_TELEPORT)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce Foi Teletransportado Para" .. param .. ".")
return TRUE
end