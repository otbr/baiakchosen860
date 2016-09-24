local look = {lookType = 128, lookHead = 59, lookBody = 94, lookLegs = 94, lookFeet = 94, lookTypeEx = 0, lookAddons = 0}

function onStepIn(cid, item, pos)
doSetCreatureOutfit(cid, look, -1)
end