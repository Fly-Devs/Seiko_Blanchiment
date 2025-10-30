RegisterServerEvent("SeikoBlanchiment:Blanchiment")
AddEventHandler("SeikoBlanchiment:Blanchiment", function(amount)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local pourcentage = amount * Config.pourcentage
    local Totale = amount - pourcentage
    local total = amount

    if amount > 0 and xPlayer.getAccount("black_money").money >= amount then 
        xPlayer.removeAccountMoney("black_money", amount)
        xPlayer.addMoney(Totale)
        print(total)
        TriggerClientEvent("SeikoBlanchiment:Checked", _src, total)
    else 
        TriggerClientEvent("SeikoBlanchiment:Unchecked", _src)
    end
end)
