CreateThread(function()
    while true do 
        local interval = 250 
        local playerPos = GetEntityCoords(PlayerPedId())


        for k,v in pairs(Config.PositionPoint) do 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local pos = Config.PositionPoint
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
            if dist <= 3 then
                interval = 0
                lib.showTextUI("[E] - Parlez à Léonardo", {
                    position = 'left-center',
                    icon = 'fa-solid fa-comments',
                    style = {
                        borderRadius = 0,
                        backgroundColor = '#009eff',
                        color = 'white'
                    }
                })
                DrawMarker(22, pos[k].x + 1, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.5, 0.5, 0.5, 255, 0, 0, 255, false, true, p19, true)
            end
            if dist <= 2.0 then 
                interval = 0 
                if IsControlJustPressed(1, 51) then
                    discu()
                end
                if Config.useoxtarget == true then
                    setTargetState(false)
                end
            end
        end
          Wait(interval)
        end
end)

CreateThread(function()
    local Hash = GetHashKey("s_m_y_dealer_01")
    while not HasModelLoaded(Hash) do
		RequestModel(Hash)
		Wait(20)
	end

    pos = Config.PositionPed

    local ped = CreatePed("PED_TYPE_CIVFEMALE", Hash, pos.x, pos.y, pos.z, 340.00, true, false)
    SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
end)

function discu()
    local alert = lib.alertDialog({
        header = '[Vous]',
        content = 'Yo j\'aurais de l\'argent à faire blanchire',
        centered = true,
        cancel = false
    })
    print(alert)
    Wait(10)
    local alert = lib.alertDialog({
        header = '[Léonardo]',
        content = 'Ta combien à blanchire ?',
        centered = true,
        cancel = false
    })
    print(alert)
    Wait(10)
    local input = lib.inputDialog('Combien veut ty blanchire', {
        {type = 'number', label = 'Saisie le montant juste ici', icon = 'list-ol', required = true},
    })
    local count = input[1]
    print(json.encode(input))
    Wait(10)
    local alert = lib.alertDialog({
        header = '[Vous]',
        content = 'J\'ai ' ..count..' $ tu peut me les faire',
        centered = true,
        cancel = false
    })
    print(alert)
    Wait(10)
    local alert = lib.alertDialog({
        header = '[Léonardo]',
        content = 'Passe moi l\'argent je vais compter',
        centered = true,
        cancel = false
    })
    print(alert)
    TriggerServerEvent("SeikoBlanchiment:Blanchiment", count)
end

RegisterNetEvent("SeikoBlanchiment:Checked")
AddEventHandler("SeikoBlanchiment:Checked", function(amount)
    Wait(10)
    local alert = lib.alertDialog({
        header = '[Léonardo]',
        content = 'Y\'a bien le compte tiens ' ..amount.. '$ d\'argent propre',
        centered = true,
        cancel = false
    })
    print(alert)
    Wait(10)
    local alert = lib.alertDialog({
        header = '[Vous]',
        content = 'Merci on ce revois plus tard',
        centered = true,
        cancel = false
    })
    print(alert)
    Wait(10)
    local alert = lib.alertDialog({
        header = '[léonardo]',
        content = ' Vsy à plus frero',
        centered = true,
        cancel = false
    })
    print(alert)
end)

RegisterNetEvent("SeikoBlanchiment:Unchecked")
AddEventHandler("SeikoBlanchiment:Unchecked", function()
    Wait(10)
    local alert = lib.alertDialog({
        header = '[léonardo]',
        content = 'Tu te fou de ma geule y\'a pas le compte !!',
        centered = true,
        cancel = false
    })
    print(alert)
    Wait(10)
    local alert = lib.alertDialog({
        header = '[léonardo]',
        content = 'Dégage tu reviendras quand tu auras de l\'argent',
        centered = true,
        cancel = false
    })
    print(alert)
    Wait(10)
    local alert = lib.alertDialog({
        header = '[Vous]',
        content = 'Okok calme',
        centered = true,
        cancel = false
    })
    print(alert)
end)