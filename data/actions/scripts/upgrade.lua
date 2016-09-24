--- Perfect refine system by Mock the bear (MTB).
--- Email: mock_otnet@hotmail.com
-- &a = weapon attack
-- &d = weapon defense
-- &s = shield defense
-- &p = armor defense
-- # = nivel do item
-- @ = max level
local gain = {
gainArmor='&p+(1)',loseArmor='&p-(1)',
gainShield='&s+#',loseShield='&s-(#+1)',
gainAttack='&a+(1*(#))',loseAttack='&a-(1*(#+1))',
gainDefense='&d+(1*(#))',loseDefense='&d-(1*(#+1))',
chance='(100/math.sqrt((((@/4)+(#*2))/@)*#))',
maxlvl = 3,
blocked_ids = {8881} -- items que nao podem ser aprimorados
}
local it = {
--[itemid] = [percent]
[8306] = 10, -- 0% additional
[8305] = 80, -- 50%
}
if not setItemName then
function setItemName(uid,name)
return doItemSetAttribute(uid,'name',name)
end
function setItemArmor(uid,name)
return doItemSetAttribute(uid,'armor',name)
end
function setItemDefense(uid,name)
return doItemSetAttribute(uid,'defense',name)
end
function setItemAttack(uid,name)
return doItemSetAttribute(uid,'attack',name)
end
function getItemAttack(uid)
return getItemAttribute(uid,'attack')
end
function getItemDefense(uid)
return getItemAttribute(uid,'defense')
end
function getItemArmor(uid)
if type(uid) == 'number' then
return getItemAttribute(uid,'armor')
else
return getItemInfo(uid.itemid).armor
end
end
end

local function isArmor(uid) -- Function by Mock the bear.
if (getItemInfo(uid.itemid).armor ~= 0) and (getItemWeaponType(uid.uid) == 0) then
return true
end
return false
end
local function isWeapon(uid) -- Function by Mock the bear.
uid = uid or 0
local f = getItemWeaponType(uid)
if f == 1 or f == 2 or f == 3 then
return true
end
return false
end
local function isShield(uid) -- Function by Mock the bear.
uid = uid or 0
if getItemWeaponType(uid) == 4 then
return true
end
return false
end
local function isBow(uid) -- Function by Mock the bear.
uid = uid or 0
if getItemWeaponType(uid) == 5 then
return true
end
return false
end
local function getWeaponLevel(uid) -- Function by Mock the bear.
uid = uid or 0
local name = getItemName(uid.uid) or getItemInfo(uid.itemid).name or ''
local lvl = string.match(name,'%s%+(%d+)%s*')
return tonumber(lvl) or 0
end
local function doTransform(s,i) -- Function by Mock the bear.
local c = string.gsub(s,'@',gain.maxlvl)
local c = string.gsub(c,'&a',(getItemAttack(i.uid) ~= 0 and getItemAttack(i.uid) or getItemInfo(i.itemid).attack))
local c = string.gsub(c,'&d',(getItemDefense(i.uid) ~= 0 and getItemDefense(i.uid) or getItemInfo(i.itemid).defense))
local c = string.gsub(c,'&s',(getItemDefense(i.uid) ~= 0 and getItemDefense(i.uid) or getItemInfo(i.itemid).defense))
local c = string.gsub(c,'&p',(getItemArmor(i.uid) ~= 0 and getItemArmor(i.uid) or getItemInfo(i.itemid).armor))
local c = string.gsub(c,'#',getWeaponLevel(i))
local q = assert(loadstring('return '..c))
return math.floor(assert(q()))
end
function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.uid == 0 or item.itemid == 0 then return false end
toPosition.stackpos = 255
if isInArray(gain.blocked_ids, itemEx.itemid)
or (not getItemWeaponType(itemEx.uid) or getItemWeaponType(itemEx.uid) > 5)
or (getItemWeaponType(itemEx.uid) == 0 and not isArmor(itemEx))
or itemEx.itemid == 0 or itemEx.type > 1 or isItemStackable(itemEx.uid) then
doPlayerSendTextMessage(cid, 24,"You cant refine this item.")
return TRUE
end
if isCreature(itemEx.uid) == TRUE then
return FALSE
end
local level = getWeaponLevel(itemEx)
local chance = doTransform(gain.chance,itemEx)
if level == gain.maxlvl then
doSendMagicEffect(toPosition, 2)
return doPlayerSendTextMessage(cid, 24,"Your item is on max level, you can't upgrade it.")
end
doPlayerSendTextMessage(cid, 24,"Trying refine with "..(chance+it[item.itemid] > 100 and 100 or chance+it[item.itemid]).."% of sucess!")
if chance+it[item.itemid] >= math.random(0,100) then
local nm = getItemName(itemEx.uid)
local slot = nm:match('(%[.+%])') or '' ---If you server use slot system dont change it
slot = slot~='' and ' '..slot or slot
setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..' +'..(level+1)..slot)
addEvent(doPlayerSendTextMessage,500,cid, 24,"Your item has been upgrated to +"..(level+1)..slot..".")
doSendMagicEffect(toPosition, 12)
if isArmor(itemEx) then
local get = doTransform(gain.gainArmor,itemEx)
setItemArmor(itemEx.uid,get)
elseif isBow(itemEx.uid) then
setItemAttack(itemEx.uid, doTransform(gain.gainAttack,itemEx))
elseif isWeapon(itemEx.uid) then
setItemAttack(itemEx.uid, doTransform(gain.gainAttack,itemEx))
setItemDefense(itemEx.uid, doTransform(gain.gainDefense,itemEx))
elseif isShield(itemEx.uid) then
setItemDefense(itemEx.uid, doTransform(gain.gainShield,itemEx))
end
else
if level == 0 then
addEvent(doPlayerSendTextMessage,500,cid, 24,"No effect.")
doSendMagicEffect(toPosition, 2)
elseif level > 0 then
local nm = getItemName(itemEx.uid)
local slot = nm:match('(%[.+%])') or '' ---If you server use slot system dont change it
slot = slot~='' and ' '..slot or slot
if level == 1 then
setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..slot)
addEvent(doPlayerSendTextMessage,500,cid, 24,"Your item back to normal.")
else
setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..' +'..(level-1)..slot)
addEvent(doPlayerSendTextMessage,500,cid, 24,"Your item back to +"..(level-1)..slot..".")
end
if isArmor(itemEx) then
setItemArmor(itemEx.uid,doTransform(gain.loseArmor ,itemEx))
elseif isWeapon(itemEx.uid) then
setItemAttack(itemEx.uid, doTransform(gain.loseAttack,itemEx))
setItemDefense(itemEx.uid, doTransform(gain.loseDefense,itemEx))
elseif isBow(itemEx.uid) then
setItemAttack(itemEx.uid, doTransform(gain.loseAttack,itemEx))
elseif isShield(itemEx.uid) then
setItemDefense(itemEx.uid, doTransform(gain.loseShield,itemEx))
end
end
doSendMagicEffect(toPosition, 9)
end
doRemoveItem(item.uid,1)
return true
end