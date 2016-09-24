function onStepIn(cid, item, position, fromPosition)

local tileConfig = {
        kickPos = fromPosition,                        
        vipStorage = 13540
}

    if(getPlayerStorageValue(cid, tileConfig.vipStorage) <= 0) then
        doTeleportThing(cid, tileConfig.kickPos)
        return
    end   
        return true
end