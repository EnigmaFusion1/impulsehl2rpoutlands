ENT.Base			= "base_gmodentity" 
ENT.Type			= "anim"
ENT.PrintName		= "Rocket Launch Console"
ENT.Author			= "vin"
ENT.Purpose			= ""
ENT.Instructions	= "Press E"
ENT.Category 		= "impulse"

ENT.Spawnable = true
ENT.AdminOnly = true

ENT.HUDName = "Launch Console"
ENT.HUDDesc = "Requires a launch key."

function ENT:SetupDataTables()
	self:NetworkVar("Float", 0, "CountdownEnd")
end