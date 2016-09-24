local food =
{	
	[6574] = {60, "Mmmm."}	
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(food[item.itemid] ~= nil) then
		if(getPlayerFood(cid) + food[item.itemid][1]) >= 400 then
			doPlayerSendCancel(cid, "You are full.")
		else
			doPlayerFeed(cid, food[item.itemid][1] * 4)
			doCreatureSay(cid, food[item.itemid][2], TALKTYPE_ORANGE_1)			
		end
		return TRUE
	end
	return FALSE
end