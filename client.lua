ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end

    PlayerLoaded = true
    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

local animacja = false

RegisterNetEvent('kaczor:picie')
AddEventHandler('kaczor:picie', function()
	if not IsAnimated then
		local playerPed  = PlayerPedId()
		local coords     = GetEntityCoords(playerPed)
		local boneIndex  = GetPedBoneIndex(playerPed, 18905)

		IsAnimated = true
		ESX.Game.SpawnObject('prop_ld_flow_bottle', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(15)
			end

			AttachEntityToEntity(object, playerPed, boneIndex, 0.09, -0.065, 0.045, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, -1, 48, 0.0, false, false, false)
			Citizen.Wait(4000)

	        IsAnimated = false
	        ClearPedSecondaryTask(playerPed)
			DeleteObject(object)
		end)
	end
end)
