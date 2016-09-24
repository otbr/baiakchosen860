local look = {lookType = 128, lookHead = 59, lookBody = 81, lookLegs = 81, lookFeet = 81, lookTypeEx = 0, lookAddons = 0}

function onStepIn(cid, item, pos)
doSetCreatureOutfit(cid, look, -1)
end