ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



ESX.RegisterUsableItem('cola', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('cola', 1)
    TriggerClientEvent("kaczor:picie", _source)
    TriggerClientEvent('esx_status:add', _source, 'thirst', 100000) 
	TriggerClientEvent('esx:showNotification', source, 'Wypiłeś cole')
end)


ESX.RegisterUsableItem('redbull', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('redbull', 1)
    TriggerClientEvent("kaczor:picie", _source)
    TriggerClientEvent('esx_status:add', _source, 'thirst', 100000) 
	TriggerClientEvent('esx:showNotification', source, 'Wypiłeś redbulla')
end)

ESX.RegisterUsableItem('gbs', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('gbs', 1)
    TriggerClientEvent("kaczor:picie", _source)
    TriggerClientEvent('esx_status:add', _source, 'thirst', 100000) 
	TriggerClientEvent('esx:showNotification', source, 'Wypiłeś gbs'a')
end)