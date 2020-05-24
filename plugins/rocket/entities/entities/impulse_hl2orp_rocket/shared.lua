ENT.Base			= "base_anim"
ENT.Type			= "anim"
ENT.PrintName		= "Rocket"
ENT.Author			= "vin"
ENT.Category 		= "impulse"
ENT.AutomaticFrameAdvance = true

ENT.Spawnable = true
ENT.AdminOnly = true

game.AddParticles("particles/choreo_launch.pcf")
PrecacheParticleSystem("choreo_launch_camjet_1")
PrecacheParticleSystem("choreo_launch_rocket_jet")
PrecacheParticleSystem("choreo_launch_rocket_upsmoke_backup")

game.AddParticles("particles/steampuff.pcf")
PrecacheParticleSystem("steam_jet_50_steam")
PrecacheParticleSystem("steam_jet_80")

ENT.Parts = {
	["Payload"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 0),
		model = "models/props_silo/rocket.mdl",
		steamPoints = {
			Vector(-52.659839630127, 27.620447158813, -205.36724853516),
			Vector(-60.051677703857, 22.487745285034, -174.97695922852),
			Vector(-50.303581237793, 18.544095993042, -235.20906066895)
		},
		takes = {}
	},
	["Hatch"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 0),
		model = "models/props_silo/rocket_hatch.mdl",
		takes = {}
	},
	["Stage 3"] = {
		pos = Vector(0, 0, -328),
		ang = Angle(0, 0, 0),
		model = "models/props_silo/rocket_stage3.mdl",
		steamPoints = {
			Vector(-76.691123962402, -0.24458837509155, -305.59356689453),
			Vector(-76.083358764648, 13.762880325317, -270.49017333984)
		},
		takes = {}
	},
	["Stage 2"] = {
		pos = Vector(0, 0, -514),
		ang = Angle(0, 0, 0),
		model = "models/props_silo/rocket_stage2.mdl",
		steamPoints = {
			Vector(-76.083358764648, 13.762880325317, -270.49017333984)
		},
		takes = {}
	},
	["Stage 1"] = {
		pos = Vector(0, 0, -906),
		ang = Angle(0, 0, 0),
		model = "models/props_silo/rocket_stage1.mdl",
		steamPoints = {
			Vector(-76.083358764648, 13.762880325317, -270.49017333984)
		},
		takes = {}
	},
	["Engine 1"] = {
		pos = Vector(0, 0, -906),
		ang = Angle(0, 0, 0),
		model = "models/props_silo/rocket_engine.mdl",
		takes = {}
	},
	["Engine 2"] = {
		pos = Vector(0, 0, -906),
		ang = Angle(0, 120, 0),
		model = "models/props_silo/rocket_engine.mdl",
		takes = {}
	},
	["Engine 3"] = {
		pos = Vector(0, 0, -906),
		ang = Angle(0, 240, 0),
		model = "models/props_silo/rocket_engine.mdl",
		takes = {}
	},
}