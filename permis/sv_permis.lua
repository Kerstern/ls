require "resources/essentialmode/lib/MySQL"
MySQL:open("localhost", "gta5_gamemode_essential", "root", "password")


function updatelicence(player, id)
  local licence = id
  MySQL:executeQuery("UPDATE users SET `licence`='@value' WHERE identifier = '@identifier'", {['@value'] = licence, ['@identifier'] = player})
end


RegisterServerEvent('permis:licence')
AddEventHandler('permis:licence', function(id)
  TriggerEvent('es:getPlayerFromId', source, function(user)
        local player = user.identifier
        local namePermis = namePermis(id)
        updatelicence(player, id)
        TriggerClientEvent("es_freeroam:notify", source, "CHAR_MP_STRIPCLUB_PR", 1, "Auto-Ecole", false, "Félicitations, vous avez votre permis !")
  end)
end)
