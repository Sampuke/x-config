local function disableShuff()
    for _ = 1, 100 do
        SetPedIntoVehicle(cache.ped, cache.vehicle, 0)
        SetPedConfigFlag(cache.ped, 184, true)
    end
end

lib.onCache("vehicle", function(value)
    if value and (GetIsTaskActive(cache.ped, 165) or GetSeatPedIsTryingToEnter(cache.ped) == 0 or cache.seat == 0) then
        disableShuff()
    end
end)

lib.onCache("seat", function(value)
    if value and value == 0 then
        disableShuff()
    end
end)

RegisterCommand("shuff", function()
    if not cache.vehicle then return end

    if cache.seat == -1 and IsVehicleSeatFree(cache.vehicle, 0) then
        TaskShuffleToNextVehicleSeat(cache.ped, cache.vehicle)
    elseif cache.seat == 0 and IsVehicleSeatFree(cache.vehicle, -1) then
        TaskShuffleToNextVehicleSeat(cache.ped, cache.vehicle)
    end
end, false)
