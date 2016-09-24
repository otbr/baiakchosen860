local chests = {
[6000] = {storage = 8000, item = 7900, amount = 1}, -- magma monocle
[6002] = {storage = 8000, item = 2496, amount = 1}, -- horned helmet
[6003] = {storage = 8000, item = 2474, amount = 1}, -- winged helmet
[6004] = {storage = 8001, item = 7899, amount = 1}, -- magma coat
[6005] = {storage = 8001, item = 8883, amount = 1}, -- windborn colossus armor
[6006] = {storage = 8001, item = 8877, amount = 1}, -- lavos armor
[6007] = {storage = 8002, item = 7894, amount = 1}, -- magma legs
[6008] = {storage = 8002, item = 2477, amount = 1}, -- knight legs
[6009] = {storage = 8002, item = 8923, amount = 1}, -- ranger legs
[6010] = {storage = 8003, item = 2218, amount = 1}, -- paw amulet
[6011] = {storage = 8004, item = 2527, amount = 1}, -- rose shield
[6012] = {storage = 8005, item = 6574, amount = 1}, -- bar of chocolate
[6013] = {storage = 8006, item = 5907, amount = 1}, -- slingshot
[6014] = {storage = 8007, item = 2179, amount = 1}, -- gold ring
[6015] = {storage = 8007, item = 2123, amount = 1}, -- ring of the sky
[6016] = {storage = 8007, item = 2121, amount = 1}, -- wedding ring
[6017] = {storage = 8008, item = 7958, amount = 1}, -- vip rod
[6018] = {storage = 8008, item = 7414, amount = 1}, -- vip wand
[6019] = {storage = 8008, item = 8932, amount = 1}, -- vip sword
[6020] = {storage = 8008, item = 8293, amount = 1}, -- vip axe
[6021] = {storage = 8008, item = 8929, amount = 1}, -- vip club
[6022] = {storage = 8008, item = 8857, amount = 1}, -- vip bow
[6023] = {storage = 8009, item = 8930, amount = 1}, -- emerald sword
[6024] = {storage = 8009, item = 8918, amount = 1}, -- spellbook of dark mysteries
[6025] = {storage = 8009, item = 8888, amount = 1}, -- master archer's armor
[6026] = {storage = 8009, item = 8890, amount = 1}, -- robe of the underworld
[6027] = {storage = 8009, item = 8881, amount = 1}, -- fireborn giant armor
[6028] = {storage = 8009, item = 8928, amount = 1}, -- obsidian truncheon
[6029] = {storage = 8009, item = 8851, amount = 1}, -- royal crossbow
[6030] = {storage = 8009, item = 8856, amount = 1}, -- yol's bow
[6031] = {storage = 8009, item = 8924, amount = 1}, -- hellforged axe
[6032] = {storage = 8010, item = 10310, amount = 1}, -- claw of the noxious spawn
[6033] = {storage = 8011, item = 9931, amount = 1}, -- coconut shoes
[6034] = {storage = 8012, item = 7957, amount = 1}, -- jester hat
[6035] = {storage = 8013, item = 8892, amount = 1}, -- ethno coat
[6036] = {storage = 8014, item = 2471, amount = 1}, -- golden helmet
[6037] = {storage = 8015, item = 2523, amount = 1}, -- blessed shield
[6038] = {storage = 8016, item = 7424, amount = 1}, -- barao staff
[6039] = {storage = 8016, item = 8854, amount = 1}, -- barao bow
[6040] = {storage = 8016, item = 7417, amount = 1}, -- barao sword
[6041] = {storage = 8016, item = 7450, amount = 1}, -- barao club
[6042] = {storage = 8016, item = 8926, amount = 1}, -- barao axe
[6043] = {storage = 8017, item = 3972, amount = 1}, -- vip helmet
[6044] = {storage = 8017, item = 3983, amount = 1}, -- bast skirt
[6045] = {storage = 8017, item = 8903, amount = 1}, -- spellbook of lost souls
[6046] = {storage = 8018, item = 2517, amount = 1}, -- shield of honour
[6047] = {storage = 8019, item = 2407, amount = 1}, -- bright sword
[6048] = {storage = 8020, item = 2466, amount = 1}, -- golden armor
[6049] = {storage = 8021, item = 2392, amount = 1}, -- fire sword
[6050] = {storage = 8022, item = 2430, amount = 1}, -- knight axe
[6051] = {storage = 8023, item = 2432, amount = 1}, -- fire axe
[6052] = {storage = 8024, item = 2472, amount = 1}, -- magic plate armor
[6053] = {storage = 8025, item = 2466, amount = 1}, -- golden armor
[6054] = {storage = 8026, item = 2427, amount = 1}, -- guardian halberd
[6055] = {storage = 8027, item = 4852, amount = 1}, -- vip stone
[6056] = {storage = 8028, item = 7890, amount = 1}, -- red skull amulet
[6057] = {storage = 8029, item = 2393, amount = 1}, -- giant sword
[6059] = {storage = 8030, item = 2400, amount = 1}, -- sword of valor
[6060] = {storage = 8030, item = 2431, amount = 1}, -- stonecutter axe
[6061] = {storage = 8030, item = 2421, amount = 1}, -- thunder hammer
[6062] = {storage = 8030, item = 2494, amount = 1}, -- demon armor
[6063] = {storage = 8031, item = 2453, amount = 1}, -- arcane staff
[6064] = {storage = 8031, item = 6528, amount = 1}, -- the avenger
[6065] = {storage = 8031, item = 5803, amount = 1}, -- arbalest
[6066] = {storage = 8032, item = 2365, amount = 1}, -- backpack of holding
[6067] = {storage = 8033, item = 6529, amount = 100}, -- infernal bolts
[6068] = {storage = 8034, item = 6132, amount = 1}, -- soft boots
[6069] = {storage = 8035, item = 5791, amount = 1}, -- stuffed dragon
[6070] = {storage = 8036, item = 2361, amount = 1}, -- frozen starlight
[6071] = {storage = 8037, item = 6132, amount = 1}, -- soft boots
[6072] = {storage = 8038, item = 2493, amount = 1}, -- demon helmet
[6073] = {storage = 8039, item = 2520, amount = 1}, -- demon shield
[6074] = {storage = 8040, item = 2645, amount = 1}, -- steel boots
[6075] = {storage = 8041, item = 2495, amount = 1}, -- demon legs
[6076] = {storage = 8041, item = 8905, amount = 1}, -- rainbow shield
[6077] = {storage = 8041, item = 8918, amount = 1}, -- spellbook of dark mysteries
[6078] = {storage = 8041, item = 8851, amount = 1}, -- royal crossbow
[6079] = {storage = 8042, item = 9933, amount = 1}, -- firewalker boots
[6080] = {storage = 8043, item = 2469, amount = 1}, -- dragon scale legs
[6081] = {storage = 8044, item = 8905, amount = 1}, -- rainbow shield
[6082] = {storage = 8045, item = 2476, amount = 1}, -- knight armor
[6083] = {storage = 8046, item = 2414, amount = 1}, -- dragon lance
[6084] = {storage = 8046, item = 2391, amount = 1}, -- war hammer
[6085] = {storage = 8046, item = 2393, amount = 1}, -- giant sword
[6086] = {storage = 8047, item = 2656, amount = 1}, -- blue robe
[6087] = {storage = 8048, item = 2187, amount = 1}, -- wand of inferno


--[Vermelho] = {storage = Verde, item = Azul, amount = Laranja},
--[Vermelho] = {storage = Verde, item = Azul, amount = Laranja}

-- Como editar:
--Vermelho: significa o unique ID do báu
--Verde: É a storage do báu(pode ser colocada a mesma storage caso for mais de um báu na mesma quest)
--Azul: É o ID do item que será dado ao jogador que abrir o báu
--Laranja: É a quantidade de items que o player vai receber

}
function onUse(cid,item,fromPosition,itemEx,toPosition)
local v = chests[item.uid]
if getPlayerStorageValue(cid, v.storage) ~= -1 then
return doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty")
elseif getPlayerFreeCap(cid) < (getItemWeightById(v.item)*v.amount) then
return doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You need " .. (getItemWeightById(v.item)*v.amount) .. " capacity in order to get the item")
end
if isItemStackable(v.item) or v.amount == 1 then
doPlayerAddItem(cid, v.item, v.amount) 
else
for i = 1, v.amount do 
doPlayerAddItem(cid, v.item, 1)  
end
end
setPlayerStorageValue(cid,v.storage,1)
return doPlayerSendTextMessage(cid,22,"You have found a " .. getItemNameById(v.item) .. ".")
end