AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_silo/launch_button.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:DrawShadow(false)

    local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		phys:EnableMotion(false)
	end

	self:ResetSequence("open")
end

function ENT:OnTakeDamage(dmg) 
	return false
end

function ENT:Use(activator, caller)
	if not activator:IsPlayer() or not activator:Alive() then
		return
	end

	self:EmitSound("ambient/levels/outland/OL12a_LaunchSwitch_Push.wav")
	self:ResetSequence("pressed")

	impulse.Rocket.LaunchSequence()
end

