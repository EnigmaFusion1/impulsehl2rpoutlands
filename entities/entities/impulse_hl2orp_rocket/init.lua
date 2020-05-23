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
    self:AddEFlags(EFL_FORCE_CHECK_TRANSMIT)
    self.ConnectedParts = {}

    local pos = self:GetPos()
    pos.z = pos.y + 1000
    self.FlyTo = pos

    self:AddPart("Payload")
    self:AddPart("Stage 3")
    self:AddPart("Stage 2")
    self:AddPart("Stage 1")
    self:AddPart("Engine 1")
    self:AddPart("Engine 2")
    self:AddPart("Engine 3")

    self.loco = ents.Create("func_movelinear")
    self.loco:SetPos(self:GetPos())
    self.loco:SetAngles(self:GetAngles())
    self.loco:Spawn()
    self.loco:SetMoveType(MOVETYPE_PUSH)
    self.loco:SetNoDraw(true)
    self.loco.rocket = self
    self:SetParent(self.loco)

    self.loco:CallOnRemove("removeLocoRocket", function(ent)
        if IsValid(ent.rocket) then
            ent.rocket:Remove()
        end
    end)

    self:CallOnRemove("removeRocketLoco", function(ent)
        if IsValid(self.loco) then
            self.loco:Remove()
        end
    end)

    self.loco:SetSaveValue("m_vecPosition1", tostring(self:GetPos()))
    self.loco:SetSaveValue("m_vecPosition2", tostring(self.FlyTo))

    self:SetRocketSpeed(10)
end

function ENT:SetRocketSpeed(speed)
    self.loco:Fire("SetSpeed", speed)
    self.Speed = speed
end

function ENT:LaunchSequence()
	self:WarmupEngines()
	timer.Simple(11.5, function()
		if not IsValid(self) then
			return
		end

		self:RealLaunch()
	end)
end

function ENT:WarmupEngines()
	local offset = Vector(44.873348236084, -19.690498352051, -4.3700480461121)

	ParticleEffect("choreo_launch_camjet_1", self.ConnectedParts["Engine 1"]:LocalToWorld(offset), Angle(0, 0, 0), self.ConnectedParts["Engine 1"])
	ParticleEffect("choreo_launch_camjet_1", self.ConnectedParts["Engine 2"]:LocalToWorld(offset), Angle(0, 0, 0), self.ConnectedParts["Engine 2"])
	ParticleEffect("choreo_launch_camjet_1", self.ConnectedParts["Engine 3"]:LocalToWorld(offset), Angle(0, 0, 0), self.ConnectedParts["Engine 3"])

	self.ConnectedParts["Engine 1"]:EmitSound("HeadcrabCanister.AfterLanding")
end

function ENT:CutFuelLines()
end

function ENT:MakeFuelLines()
end

function ENT:RealLaunch()
	self.ConnectedParts["Engine 1"]:StopSound("HeadcrabCanister.AfterLanding")
    self:EmitSound("ep02_outro.RocketTakeOffBlast")
    ParticleEffectAttach("choreo_launch_rocket_jet", PATTACH_POINT_FOLLOW, self.ConnectedParts["Engine 1"], 0)
    self:AttachLight()

    local function timed(time, func)
        timer.Simple(time, function()
            if IsValid(self) then
                func(self)
            end
        end)
    end

    timed(1.5, function() 
        self.loco:Fire("Open")
        self.light:SetActiveState(true)
        self.light:SetBrightness(40)
    end)
    timed(1.8, function() 
        self:SetRocketSpeed(100)
        ParticleEffect("choreo_launch_rocket_upsmoke_backup", Vector(-13166.34765625, 8366.0576171875, 1010.9049072266), Angle(-88.420539855957, 96.050674438477, 0))
    end)
    timed(2.8, function() self:SetRocketSpeed(250) end)
    timed(4, function() self:SetRocketSpeed(600) end)
    timed(7, function() 
        self:SetRocketSpeed(800) 
        self.light:SetBrightness(330)
    end)
    timed(8, function() 
        self:SetRocketSpeed(1200) 
        self.light:SetBrightness(340) 
    end)
    timed(12, function() self:Remove() end)

    util.ScreenShake(self:GetPos(), 100, 5, 15, 10000)
end

function ENT:AttachLight()
    self.light = ents.Create("expensive_light_new")
    self.light:SetParent(self)
    self.light:SetLocalPos(Vector(0, 0, -996))
    self.light:Spawn()

    self.light:SetActiveState(false)
    self.light:SetDrawHelper(false)
    self.light:SetDrawSprite(false)
    self.light:SetShadows(true)
    self.light:SetBrightness(220)
    self.light:SetFarZ(10000)
    self.light:SetNearZ(4)
    self.light:SetLightColor(Vector(245, 208, 57))
end

function ENT:UpdateTransmitState()
    return TRANSMIT_ALWAYS
end

function ENT:AddPart(type)
    local part = self.Parts[type]

    local e = ents.Create("impulse_hl2orp_rocketpart")
    e:SetParent(self)
    e:SetLocalPos(part.pos)
    e:SetLocalAngles(part.ang)
    e:SetModel(part.model)
    if part.mat then
        e:SetMaterial(part.mat)
    end
    e:DrawShadow(false)
    e:Spawn()
    e:SetPartName(type)

    self.ConnectedParts[type] = e
end

function ENT:Use(caller, activator)
end