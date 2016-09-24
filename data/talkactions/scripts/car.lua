--<< Configurable >>--
local storages = { speed = 314622, status = 352993 } -- Empty storages

local cfg = {	min_speed = 300, -- better not increase than that [ the least speed for a car ]
max_speed = 200,	 -- better not decrease than this [ the maximum speed for a car ]
Increase_per_command = 100, -- The speed increase or decrease value per each command (!car speed // !car slow)
Car_Explode = true -- Keep it true , so your map isnt filled with cars
}
-->> END <<--

--<< Functions >>--

function isWalkable(pos, creature, pz)-- Modificações by Hudsin,Arkires e Pinpao Xtibia
if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
if getTopCreature(pos).uid > 0 and creature then return false end
if getTileInfo(pos).protection and pz then return false, true end
local n = not proj and 3 or 2
for i = 0, 255 do
pos.stackpos = i
local tile = getTileThingByPos(pos)
if tile.itemid ~= 0 and not isCreature(tile.uid) then
if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
return false
end
end
end
return true
end

function getCarSpeed(cid) return getPlayerStorageValue(cid,storages.speed) end
function setCarSpeed(cid,value) return setPlayerStorageValue(cid,storages.speed, getPlayerStorageValue(cid,storages.speed) + value) end
function setCarStatus(cid,value) return setPlayerStorageValue(cid,storages.status,value) end
function carMove(cid) return getPlayerStorageValue(cid,storages.status) > 0 and true or false end

function move(cid,time)
local dir = getCreatureLookDir(cid)
local id = isInArray({1,3},getCreatureLookDir(cid)) and 7267 or 7266
local place = getPositionByDirection(getThingPos(cid),dir,1)
if isWalkable(place,true,true,true) then
doRemoveItem( getTileItemById(getThingPos(cid),7267).uid > 0 and getTileItemById(getThingPos(cid),7267).uid or getTileItemById(getThingPos(cid),7266).uid )
doTeleportThing(cid,place,false)
addEvent(doSendMagicEffect,time+10,place,34)
doCreateItem(id,1,place)
if carMove(cid) then
addEvent(move,time,cid,getCarSpeed(cid))
else
doRemoveItem( getTileItemById(getThingPos(cid),7267).uid > 0 and getTileItemById(getThingPos(cid),7267).uid or getTileItemById(getThingPos(cid),7266).uid )
end
else
doCreatureSetNoMove(cid, 0)
doPlayerSendTextMessage(cid,27,"You have hit somthng.")
setCarStatus(cid,0)
if cfg.Car_Explode then
doRemoveItem( getTileItemById(getThingPos(cid),7267).uid > 1 and 
getTileItemById(getThingPos(cid),7267).uid or getTileItemById(getThingPos(cid),7266).uid )
doSendAnimatedText(getThingPos(cid),"Crashed",TEXTCOLOR_RED)
doSendMagicEffect(getThingPos(cid),31)
end
end
end

--<< Functions Ends <<--

function onSay(cid, words, param, channel)
if param == "speed" then
if carMove(cid) then
if getCarSpeed(cid) > cfg.max_speed then
setCarSpeed(cid,-(cfg.Increase_per_command))
addEvent(doSendAnimatedText,10,getThingPos(cid),"Speeding",TEXTCOLOR_GREEN)
else
setCarSpeed(cid,cfg.max_speed)
doPlayerSendCancel(cid,"The car is in its maximum speed.")
end
else
doPlayerSendCancel(cid,"You should start moving first.")
end
elseif param == "slow" then
if carMove(cid) then
if getCarSpeed(cid) < cfg.min_speed then
setCarSpeed(cid,cfg.Increase_per_command)
addEvent(doSendAnimatedText,10,getThingPos(cid),"Slowing",TEXTCOLOR_GREEN)
else
setCarSpeed(cid,cfg.min_speed)
doPlayerSendCancel(cid,"The car is in its minumium speed.")
end
else
doPlayerSendCancel(cid,"You should start moving first.")
end
elseif param == "stop" then -- by DarkVelocity Xtibia
if carMove(cid) then
setCarStatus(cid,0)
doCreatureSetNoMove(cid, 0)

else
doPlayerSendCancel(cid,"Car is already stopped.")
end
elseif param == "move" then
if not carMove(cid) then
if getTileItemById(getThingPos(cid),7267).uid < 1 and getTileItemById(getThingPos(cid),7266).uid < 1 then 
local item = isInArray({1,3},getCreatureLookDir(cid)) and 7267 or 7266
doCreateItem(item,1,getThingPos(cid))
end
setPlayerStorageValue(cid,storages.speed,cfg.min_speed)
setCarStatus(cid,1)
doCreatureSetNoMove(cid, 1)
move(cid,getCarSpeed(cid))
else
doPlayerSendCancel(cid,"Car is already moving.")
end
end

return true
end