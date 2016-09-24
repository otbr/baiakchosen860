function getItemReflectPercent(itemuid)
	return getItemAttribute(itemuid, "reflectPercent")
end
function doPlayerAddReflectedItem(cid, itemid, percent)
local item = doPlayerAddItem(cid, itemid)
doItemSetAttribute(item, "description", "[Reflect: "..percent.."%]")
doItemSetAttribute(item, "reflectPercent", percent)
end