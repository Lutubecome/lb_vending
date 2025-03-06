local modelsdrink = {

  "prop_vend_soda_02",
  "prop_vend_soda_01",
  "prop_vend_fags_01"
}

local modelswater = {

  "prop_vend_water_01",
  "prop_watercooler",
  "prop_watercooler_dark"
}

local modelscoffee = {

  "prop_vend_coffe_01",
}

local modelssnack = {

  "prop_vend_snak_01",
  "prop_vend_snak_01_tu",
}
--hier script funktionen

local function buyanimation()
  
  if lib.progressCircle({
    duration = 4000,
    position = 'bottom',
    useWhileDead = false,
    canCancel = false,
    disable = {
      car = true,
      move = true,
      combat = true,
      sprint = true,
    },
    anim = {
        dict = 'random@atmrobberygen',
        clip = 'a_atm_mugging'
    },


}) then 

  

else 



 end

end

local function animation(type)
  
  if type == 1 then --vending mashine
    
    if lib.progressCircle({
      duration = 2000,
      position = 'bottom',
      useWhileDead = false,
      canCancel = false,
      disable = {
        car = true,
        move = true,
        combat = true,
        sprint = true,
      },
      anim = {
          dict = 'anim@amb@prop_human_atm@interior@female@enter',
          clip = 'enter'
      },
  }) then 
  
    

  else 



   end
  
  else --water

    if lib.progressCircle({
      duration = 2000,
      position = 'bottom',
      useWhileDead = false,
      canCancel = true,
      disable = {
        car = true,
        move = true,
        combat = true,
        sprint = true,
      },
      anim = {
          dict = 'random@atmrobberygen',
          clip = 'a_atm_mugging'
      },

  })
  then
  

    
  else 
    

    
  end
  
  end

end

lib.registerContext({
  id = 'lb_snackMenu',
  title = 'Snack Maschine',
  options = {
    {
      title = 'Cola?',
      icon = 'fas fa-bottle-water',
      onSelect = function()

        if lib.callback.await('lb_vending:hasmoney', 12) then

          buyanimation()

          TriggerServerEvent('lb_vending:buysoda', 1)

        end
          
      end,
    },
    {
      title = 'Wasser?',
      icon = 'fas fa-bottle-water',
      onSelect = function()

        if lib.callback.await('lb_vending:hasmoney', 8) then

          buyanimation()

          TriggerServerEvent('lb_vending:buywater')

        end
          
      end,
    },
  }
})

lib.registerContext({
  id = 'lb_sodaMenu',
  title = 'Soda Maschine',
  options = {
    {
      title = 'Cola?',
      icon = 'fas fa-bottle-water',
      onSelect = function()

        if lib.callback.await('lb_vending:hasmoney', 12) then

          buyanimation()

          TriggerServerEvent('lb_vending:buysoda', 1)

        end
          
      end,
    },
    {
      title = 'Wasser?',
      icon = 'fas fa-bottle-water',
      onSelect = function()

        if lib.callback.await('lb_vending:hasmoney', 8) then

          buyanimation()

          TriggerServerEvent('lb_vending:buywater')

        end
          
      end,
    },
  }
})
  Citizen.CreateThread(function ()
    
    exports.ox_target:addModel(modelscoffee, {
        
        label = "Kaffee kaufen",
        icon = 'fas fa-dollar-sign',
        distance = 1.0,
        onSelect = function ()

          if lib.callback.await('lb_vending:hasmoney', 10) then

            animation(1)

            TriggerServerEvent('lb_vending:buycoffee')
          end    
        end

    })

  end)

  Citizen.CreateThread(function ()
    
    exports.ox_target:addModel(modelsdrink, {
        
        label = "Soda kaufen",
        icon = 'fas fa-dollar-sign',
        distance = 1.0,
        onSelect = function ()
          --menu
            animation(1)
            lib.showContext('lb_sodaMenu')
          
                
        end

    })

  end)

  Citizen.CreateThread(function ()
    
    exports.ox_target:addModel(modelssnack, {
        
        label = "Snacks kaufen",
        icon = 'fas fa-dollar-sign',
        distance = 1.0,
        onSelect = function ()
          --menu
          if lib.callback.await('lb_vending:hasmoney', 15) then

            animation(1)

            lib.showContext('lb_snackMenu')
          end 
                
        end

    })

  end)
  Citizen.CreateThread(function ()
    
    exports.ox_target:addModel(modelswater, {
        
        label = "Wasser kaufen",
        icon = 'fas fa-dollar-sign',
        distance = 1.0,
        onSelect = function ()
                --wasser direkt kaufen
                if lib.callback.await('lb_vending:hasmoney', 8) then

                  animation(2)

                  TriggerServerEvent('lb_vending:buywater')
                end 
        end

    })

  end)
