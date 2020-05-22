AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")


function ENT:Initialize()
    self:SetModel("models/hunter/blocks/cube025x025x025.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(SOLID_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self:DrawShadow(false)

    self:SetRocketSpeed(600)

    self:AddPart("Payload")
    self:AddPart("Stage 3")
    self:AddPart("Stage 2")
    self:AddPart("Stage 1")
    self:AddPart("Engine 1")
    self:AddPart("Engine 2")
    self:AddPart("Engine 3")
end

function ENT:AddPart(type)
    local part = self.Parts[type]

    local e = ents.Create("impulse_hl2orp_rocketpart")
    e:SetParent(self)
    e:SetLocalPos(part.pos)
    e:SetLocalAngles(part.ang)
    e:SetModel(part.model)
    e:DrawShadow(false)
    e:Spawn()
    e:SetPartName(type)
end

function ENT:Use(caller, activator)
end

function ENT:Think()
    if self:GetRocketSpeed() > 0 then
        local cur = self:GetPos()
        cur.z = cur.z + (FrameTime() * self:GetRocketSpeed())
        self:SetPos(cur)
    end

    self:NextThink(CurTime())
    return true
end