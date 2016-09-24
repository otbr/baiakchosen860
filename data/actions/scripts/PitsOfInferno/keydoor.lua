function onUse(cid, item, fromPosition, itemEx, toPosition)

   	if getPlayerGroupId(cid) <=5 then
		doPlayerSetGroupId(cid, 6)
		doRemoveItem(item.uid, 1)
		doPlayerSendTextMessage(cid, 22, 'The door is closed..')
	else
		doPlayerSendCancel(cid, "You open the doors.")
	end
   	
	return true
end