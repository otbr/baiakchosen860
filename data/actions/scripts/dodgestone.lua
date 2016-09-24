local limite = 100 -- limite de dodge
local storagedodge = 98798644 -- storage do dodge
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if getPlayerStorageValue(cid, storagedodge) == -1 then
        doPlayerSetStorageValue(cid, storagedodge, (getPlayerStorageValue(cid, storagedodge)) + 2)
        doPlayerSendCancel(cid, " DodgeSKILL:["..getPlayerStorageValue(cid, storagedodge).."/"..limite.."].")
    elseif getPlayerStorageValue(cid, storagedodge) >= -1 and getPlayerStorageValue(cid, storagedodge) <= limite then
        doPlayerSetStorageValue(cid, storagedodge, (getPlayerStorageValue(cid, storagedodge)) + 1)
        doPlayerSendCancel(cid, " DodgeSKILL:["..getPlayerStorageValue(cid, storagedodge).."/"..limite.."].")
        doRemoveItem(item.uid, 1)
    else
        doPlayerSendCancel(cid, "Voce ja chego no maximo.DodgeSKILL:["..getPlayerStorageValue(cid, storagedodge).."/"..limite.."]")
    end
    return true
end