-- Position de la compagnie de routier
local trucker_locations = {
	{name="Mission camions", id=162, x= 814.87, y= -1664.11, z= 29.38},
	{name="Mission camions", id=162, x= 814.87, y= -1664.11, z= 29.38},
	{name="Mission camions", id=162, x= 814.87, y= -1664.11, z= 29.38},
}


-- Missions Routier
local MissionRoutier = {
	
	['mission1'] = {
		["name"] = "Mission 1",
		["start"] = {['x'] = 814.879, ['y'] = -1664.115, ['z'] = 29.381},
		["end"] = {['x'] = -654.597, ['y'] = 308.810, ['z'] = 82.900},
		["payment"] = 1500
		},
	
	['mission2'] = {
		["name"] = "Mission 2",
		["start"] = {['x'] = 814.879, ['y'] = -1664.115, ['z'] = 29.381},
		["end"] = {['x'] = -1092.924, ['y'] = -2052.076, ['z'] = 13.291},
		["payment"] = 1500
		},
	
	['mission3'] = {
		["name"] = "Mission 3",
		["start"] = {['x'] = 814.879, ['y'] = -1664.115, ['z'] = 29.381},
		["end"] = {['x'] = 2354.301, ['y'] = 3133.806, ['z'] = 48.208},
		["payment"] = 2500
		},
}

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end




RegisterNetEvent('missionRoutierFinie')
AddEventHandler('missionRoutierFinie', function()
	TriggerServerEvent('missionRoutierFinie', GetVehiclePedIsIn(GetPlayerPed(-1), false))
end)
	


RegisterNetEvent('startMissionRoutier')
AddEventHandler('startMissionRoutier', function()
	local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	TriggerServerEvent('startMissionRoutier', vehicle, GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
end)



local blip_routier
local markers = {}
curJob = ""
local trucking_marker

local displayMissionTerminee = false

local function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline, center)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
	if(center)then
		SetTextCentre(1)
	end
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent("setCurrentJob")
AddEventHandler("setCurrentJob", function(j)
	curJob = j

	if(trucking_marker)then
		TriggerServerEvent("cancelTrucking")
	end
end)


RegisterNetEvent('createMarkerRoutier')
AddEventHandler('createMarkerRoutier', function(id, x, y, z, dr)
	trucking_marker = {['x'] = x, ['y'] = y, ['z'] = z}
	trucker_blip = AddBlipForCoord(x,  y,  z)
	SetBlipRoute(trucker_blip, true)

	Citizen.Trace(dr .. "\n")

	DecorSetInt(GetVehiclePedIsIn(GetPlayerPed(-1), false), "drugs", dr)
end)

local rt
local curMsg = "SHOW_MISSION_PASSED_MESSAGE"
