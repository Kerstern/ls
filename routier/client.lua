-- Missions Routier
local MissionRoutier = {
	
		[0] = {-654.597, 308.810, 82.900, 1500}, --x,y,z,money
		[1] = {-1092.924, -2052.076, 13.291, 1500},
		[2] = {2354.301, 3133.806, 48.208, 2500},
	}


local routier = {
  {name="Truck & Co", colour=15, id=68, x=-266.94, y=-960.744, z=31.2231},
}

---------------------------------- FUNCTIONS ----------------------------------

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

function IsNearJobs()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(changeYourJob) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 10) then
      return true
    end
  end
end

function menuJobs()
  MenuTitle = "Jobs"
  ClearMenu()
  for _, item in pairs(jobs) do
    local nameJob = item.name
    local idJob = item.id
    Menu.addButton(nameJob,"changeJob",idJob)
  end
end

function changeJob(id)
  TriggerServerEvent("jobssystem:jobs", id)
end

