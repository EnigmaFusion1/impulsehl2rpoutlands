include("shared.lua")

-- TODO: use drive system for movement
function ENT:Think()
	self:SetPredictable(true)
	if self:GetRocketSpeed() > 0 then
		local cur = self:GetPos()
        cur.z = cur.z + (FrameTime() * self:GetRocketSpeed())
        self:SetPos(cur)
        print("predic")
    end

	self:NextThink(CurTime())
	return true
end