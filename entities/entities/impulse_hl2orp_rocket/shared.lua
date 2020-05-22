ENT.Base			= "base_anim"
ENT.Type			= "anim"
ENT.PrintName		= "Rocket"
ENT.Author			= "vin"
ENT.Category 		= "impulse"
ENT.AutomaticFrameAdvance = true

ENT.Spawnable = true
ENT.AdminOnly = true

game.AddParticles("particles/choreo_launch.pcf")
PrecacheParticleSystem("choreo_launch_camjet1")
PrecacheParticleSystem("choreo_launch_rocket_jet")
PrecacheParticleSystem("choreo_launch_rocket_upsmoke_backup")

ENT.Parts = {
	["Payload"] = {
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 0),
		model = "models/props_silo/rocket.mdl",
		takes = {}
	},
	["Stage 3"] = {
		pos = Vector(0, 0, -328),
		ang = Angle(0, 0, 0),
		model = "models/props_silo/rocket_stage3.mdl",
		takes = {}
	},
	["Stage 2"] = {
		pos = Vector(0, 0, -514),
		ang = Angle(0, 0, 0),
		model = "models/props_silo/rocket_stage2.mdl",
		takes = {}
	},
	["Stage 1"] = {
		pos = Vector(0, 0, -906),
		ang = Angle(0, 0, 0),
		model = "models/props_silo/rocket_stage1.mdl",
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