local config = { 
    rate = 2,
    storage = 1000,
    expstorage = 1100,
    register = 1200,
    time = 10800,
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if getPlayerStorageValue(cid, config.storage) <= 0 then
        local rates = getPlayerRates(cid)
        setPlayerStorageValue(cid, config.expstorage, rates[SKILL__LEVEL])
        setPlayerStorageValue(cid, config.register, 1)
        itemEx=itemid == 9004
        doCreatureSay(cid, "Your extra experience rate has been activated! It now is: " .. config.rate .. "x added to your former experience rate.", TALKTYPE_ORANGE_1, true, cid)
        setPlayerStorageValue(cid, config.storage, os.time()+config.time)
        doPlayerSetExperienceRate(cid, rates[SKILL__LEVEL]*config.rate)
        doRemoveItem(item.uid,1)
        registerCreatureEvent(cid, "ExpStage")
    else
        doCreatureSay(cid, "You must finish first exp condition to start other exp condition !", TALKTYPE_ORANGE_1, true, cid)
    end
return true
end
function onThink(cid, interval)
    if getPlayerStorageValue(cid, config.register) == 1 then
        if getPlayerStorageValue(cid, config.storage) <= os.time() then
            doCreatureSay(cid, "Your extra experience rate has finished! It is now normaly experience rate.", TALKTYPE_ORANGE_1, true, cid)
            setPlayerStorageValue(cid, config.storage, 0)
            setPlayerStorageValue(cid, config.register, 0)
            local oldexp = getPlayerStorageValue(cid, config.expstorage)
            doPlayerSetExperienceRate(cid, oldexp)
            unregisterCreatureEvent(cid, "ExpStage")
        end
    end
return true
end
function onLogin(cid)
    if getPlayerStorageValue(cid, config.register) == 1 then
        registerCreatureEvent(cid, "ExpStage")
        local rates = getPlayerRates(cid)
        doCreatureSay(cid, "Your extra experience rate is still here! It is: " .. config.rate .. "x added to your former experience rate.", TALKTYPE_ORANGE_1, true, cid)
        if getPlayerStorageValue(cid, config.storage) > os.time() then
        local oldexp = getPlayerStorageValue(cid, config.expstorage)
        doPlayerSetExperienceRate(cid, oldexp+config.rate)
        end
    end  
return true
end