ENT.Base			= "base_anim"
ENT.Type			= "anim"
ENT.PrintName		= "Rocket Part"
ENT.Author			= "vin"
ENT.Category 		= "impulse"
ENT.AutomaticFrameAdvance = true

ENT.Spawnable = false
ENT.AdminOnly = true

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "PartName")
end