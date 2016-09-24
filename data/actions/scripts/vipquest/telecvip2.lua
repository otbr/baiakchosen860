function onUse(cid, item, frompos, item2, topos)
pos = {x=38, y=290, z=7}
if item.itemid == 21000 then

doPlayerSendCancel(cid,"Abra o bau para se tornar vip!")
doTeleportThing(cid,pos)
doRemoveItem(item.uid,1)
else

doPlayerSendCancel(cid,"Fail !")


end

return 1

end 