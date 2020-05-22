include("shared.lua")

function ENT:Think()
	if not self.HUDName then
		self.HUDName = self:GetPartName()
	end

	self:NextThink(CurTime() + 1)
	return true
end