local bluePresent = {2687, 6394, 6280, 6574, 6578, 6575, 6577, 6569, 6576, 6572, 2114}
local redPresent = {10221, 2644, 10220, 12279, 8855, 7390, 7412, 7423, 7887}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local count = 1
	if item.itemid == 6570 then
		local randomChance = math.random(1, 11)
		if randomChance == 1 then
			count = 10
		elseif randomChance == 2 then
			count = 3
		end
		doPlayerAddItem(cid, bluePresent[randomChance], count)
	elseif item.itemid == 6571 then
		local randomChance = math.random(1, 9)
		if randomChance > 0 and randomChance < 4 then
			count = 1
		end
		doPlayerAddItem(cid, redPresent[randomChance], count)
	end
	doSendMagicEffect(fromPosition, CONST_ME_GIFT_WRAPS)
	doRemoveItem(item.uid, 1)
	return TRUE
end