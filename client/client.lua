local ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("openDialogCreate")
AddEventHandler("openDialogCreate", function()
    local input = lib.inputDialog(_U('title'), {
        { type = "input", label = _U('code'), placeholder = "ALYF-STORE" },
        { type = "number", label = _U('maxUse'), default = 1 },
        { type = "input", label = _U('reward') , placeholder = "Premio" },
        { type = "checkbox", label = "¿Puede el jugador canjear este código más de uno?", checked = true },
        { type = "number", label = _U('quantity'), default = 1 }
    })

    if input == nil then return end

    ESX.TriggerServerCallback('alyf_vips:crearsorteo', function(cb, code)
        if cb == 'success' then
            ESX.ShowNotification('Giveaway', _U('insert_success'), 'success')
            print('Code: ' .. code)
        elseif cb == 'updated' then
            ESX.ShowNotification('Giveaway', _U('updated'), 'success')
        else
            ESX.ShowNotification('Giveaway', _U('insert_failed'), 'error')
        end
    end, input)
end)

RegisterNetEvent("openDialogRedeem")
AddEventHandler("openDialogRedeem", function()
    local input = lib.inputDialog(_U('redeem'), {
        { type = "input", label = _U('code_redeem'), placeholder = 'ALYF-STORE' },
    })

    ESX.TriggerServerCallback('alyf_vips:pedirsorteo', function(cb)
        if cb == 'success' then
            ESX.ShowNotification('Giveaway', _U('redeem_success'), 'success')
        elseif cb == 'empty' then
            ESX.ShowNotification('Giveaway', _U('empty'), 'error')
        elseif cb == 'format' then
            ESX.ShowNotification('Giveaway', _U('format'), 'error')
        elseif cb == 'not_exist' then
            ESX.ShowNotification('Giveaway', _U('not_exist'), 'error')
        elseif cb == 'limit' then
            ESX.ShowNotification('Giveaway', _U('limit'), 'error')
        elseif cb == 'full' then
            ESX.ShowNotification('Giveaway', _U('full'), 'error')
        elseif cb == 'same_user' then
            ESX.ShowNotification('Giveaway', _U('same_user'), 'error')
        end
    end, input)
end)
