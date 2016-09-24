function onDeath(cid, corpse, killer)

local M ={
["Darakan the Executioner"] = {Pos = {x=80,y=943,z=15},id= 1353 ,time = 60},
["Norgle Glacierbeard"] = {Pos = {x=66, y=943, z=15},id= 1353 ,time = 60},
["Svoren the Mad"] = {Pos = {x=52, y=943, z=15},id= 1353 ,time = 60},
["The Masked Marauder"] = {Pos = {x=38, y=943, z=15},id= 1353 ,time = 60},
["The Pit Lord"] = {Pos = {x=73, y=929, z=15},id= 1353 ,time = 60},
["Webster"] = {Pos = {x=59, y=929, z=15},id= 1353 ,time = 60},
["Gnorre Chyllson"] = {Pos = {x=45, y=929, z=15},id= 1353 ,time = 60},
["Fallen Mooh'tah Master Ghar"] = {Pos = {x=66, y=915, z=15},id= 1353 ,time = 60},
["Deathbringer"] = {Pos = {x=52, y=915, z=15},id= 1353 ,time = 60},
["The Obliverator"] = {Pos = {x=59, y=902, z=15},id= 1353 ,time = 60},
}

local x = M[getCreatureName(cid)]
function criar()
                local parede = getTileItemById(x.Pos, x.id)
                doCreateItem(x.id, 1, x.Pos)
                end
if x then
                local parede = getTileItemById(x.Pos, x.id)
                if parede then
                                doRemoveItem(parede.uid, 1)
                                 doCreatureSay(cid, "A pedra será criada novamente em "..x.time.." segundos.", TALKTYPE_ORANGE_1)
                                addEvent(criar, x.time*1000)
                end
end
return TRUE
end