-- driveby.lua
RegisterNetEvent('preventDriveBy')
AddEventHandler('preventDriveBy', function()
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 then
        -- Désactive le tir depuis le véhicule
        DisableControlAction(0, 24, true) -- INPUT_ATTACK
        DisableControlAction(0, 257, true) -- INPUT_ATTACK2
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        TriggerEvent('preventDriveBy')
    end
end)
