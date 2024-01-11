local deleteTimer

CreateThread(function()
    while true do
        Wait(deleteTimer * 60000)
        TriggerClientEvent('QBCore:Notify', 1 { color = {255,0,0}, args = {'Hata', 'Araçlar 1 DK İçinde Çekilcek'}})
        Wait(45000) -- Zaman MS Cinsinde
        TriggerClientEvent('QBCore:Notify', 1 { color = {255,0,0}, args = {'Hata', 'Araçlar 15 SN İçinde Çekilcek'}})
        Wait(10000) -- Zaman MS Cinsinde
        TriggerClientEvent('QBCore:Notify', 1 { color = {255,0,0}, args = {'Hata', 'Araçlar 5 SN İçinde Çekilcek'}})
        Wait(5000) -- Zaman MS Cinsinde

        for i, veh in pairs(GetAllVehicles()) do 
            if HasVehicleBeenOwnedByPlayer(veh) then
                if not isVehicleOccupied(veh) then
                    DeleteEntity(veh)
                end
            end
        end
        TriggerClientEvent('QBCore:Notify', -1, { color = { 255, 0, 0 }, args = {'Hata', 'Tüm Araçlar Çekilmiştir'}})
    end
end)

function isVehicleOccupied(veh)
    for seat = 1, 6 do 
        if GetPedInVehicleSeat(veh, seat) ~= 0 then 
            return true 
        end
    end
    return false
end