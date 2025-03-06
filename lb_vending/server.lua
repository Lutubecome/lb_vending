RegisterNetEvent('lb_vending:buycoffee', function()
    
    exports.ox_inventory:RemoveItem(source, 'cash', 10)

    exports.ox_inventory:AddItem(source, 'coffee', 1)

end)

RegisterNetEvent('lb_vending:buywater', function()
    
    exports.ox_inventory:RemoveItem(source, 'cash', 8)

    exports.ox_inventory:AddItem(source, 'water', 1)

end)

RegisterNetEvent('lb_vending:buysoda', function(sodatype)
    
    if sodatype == 1 then --cola
        
        exports.ox_inventory:RemoveItem(source, 'cash', 12)

        exports.ox_inventory:AddItem(source, 'cola', 1)


    end 
end)

RegisterNetEvent('lb_vending:buysnack', function(snacktype)
    
end)

lib.callback.register('lb_vending:hasmoney', function(amount)

    if exports.ox_inventory:GetItem(source, 'cash', nil, true) >= amount then

        return true

    else
        return false
    end

end)