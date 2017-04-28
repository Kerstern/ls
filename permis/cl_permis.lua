local Permis = {
  {name="Auto-Ecole", colour=15, id=351, x=-266.94, y=-960.744, z=31.2231},
  }

local voiture = { hash=0xEB70965F, x= , y= , z= , a= }

local licence = { name = "Permis B", id=1 }
  

 function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x , y)
end
  
  
function IsNearPermis()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(permis) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 10) then
      return true
    end
  end
end
  
function menuPermis()
  MenuTitle = "Permis"
  ClearMenu()
  for _, item in pairs(jobs) do
    local nameJob = item.name
    local idJob = item.id
    Menu.addButton(nameLicence,"Licence",idLicence)
  end
end

function Licence(id)
  TriggerServerEvent("permis:licence", id)
end
  
  
  

Citizen.CreateThread(function()
    for _, item in pairs(Permis) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipAsShortRange(item.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if (IsNearPermis() == true) then
      drawTxt('Appuyer sur ~g~H~s~ pour accéder au menu des permis',0,1,0.5,0.8,0.6,255,255,255,255)
    if (IsControlJustPressed(1,Keys["H"]) and IsNearPermis() == true) then
      menuPermis()
      Menu.hidden = not Menu.hidden 
    end
  end
    Menu.renderGUI()
  end
end)
  
AddEventHandler('permis:licence', function()
RequestModel(0xEB70965F) -- Blista
while not HasModelLoaded(0xEB70965F) do
	Wait(1)
end

-- Spawn la voiture
for _, item in pairs(voiture) do
	cab =  CreateVehicle(item.hash, item.x, item.y, item.z, item.a, false, false)
	SetVehicleOnGroundProperly(voitur)
end

end)
