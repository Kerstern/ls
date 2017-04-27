finereceived = 0
finesender = 0

RegisterNetEvent("rc:fine")
AddEventHandler("rc:fine", function(receiverid, fine)

  
		SetNotificationTextEntry("STRING");
        AddTextComponentString("You have been given a Fine, Do you wish to pay ? ~g~Y~w~ to pay ~r~N~w~ to refuse");
        DrawNotification(false, true);
        
        finereceived = 1
  
end)
RegisterNetEvent("test123456")
AddEventHandler("test123456", function(fineseid)

        
        finesender = tonumber(fineseid)
  
end)
AddEventHandler("rc:finere", function(receiverid)

  
		SetNotificationTextEntry("STRING");
        AddTextComponentString("~r~ the user refused the fine");
        DrawNotification(false, true);
        
  
end)

Citizen.CreateThread(function()
  while true do
 	Citizen.Wait(1)

 if finereceived == (1) then

if IsControlJustPressed(1,246) then


TriggerServerEvent('test1234')

finereceived = 0


     end
 if IsControlJustPressed(1,249) then


 TriggerServerEvent('test12345')

 finereceived = 0


     end


    end
  end
end)
