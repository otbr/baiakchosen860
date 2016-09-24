local minheal = 1000
local maxheal = 1500

function onUse(cid, item, frompos, item2, topos)
levell = getPlayerLevel(cid)
if levell >= 1 then
doSendAnimatedText(getPlayerPosition(cid), "Ahh...", TEXTCOLOR_ORANGE)
doCreatureAddHealth(cid, math.random(minheal, maxheal))
doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)

if item.type > 1 then
else
end
else
doSendMagicEffect(frompos,2)
doPlayerSendCancel(cid,"You don't have the required level to use that potion.")
end

return 1
end