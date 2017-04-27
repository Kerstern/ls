-- Missions Routier
local MissionRoutier = {
	
		[0] = {-654.597, 308.810, 82.900, 1500}, --x,y,z,money
		[1] = {-1092.924, -2052.076, 13.291, 1500},
		[2] = {2354.301, 3133.806, 48.208, 2500},
	}


-- Ajouteur blip dans Blips

local MISSION = {}
MISSION.start = false
MISSION.tailer = false
MISSION.truck = false

MISSION.hashTruck = 0
MISSION.hashTrailer = 0

local currentMission = -1

local playerCoords
local playerPed
