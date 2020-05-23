include("shared.lua")

surface.CreateFont("Impulse-RocketCountdown", {
	font = "DS-Digital",
	size = 75,
	weight = 600,
	antialias = true,
	shadow = false
})

local black = Color(0, 0, 0)
local fore = Color(255, 140, 0)
function ENT:Draw()
	self:DrawModel()

	local entPos = self:GetPos()
	local entAng = self:GetAngles()
	local pos = self:GetPos()
	local ang = self:GetAngles()

	pos = pos + (ang:Up() * 19.1)
	pos = pos + (ang:Forward() * -13.71)
	pos = pos + (ang:Right() * 10.9)

	ang:RotateAroundAxis(entAng:Up(), 90)
	ang:RotateAroundAxis(entAng:Forward(), -2)
	ang:RotateAroundAxis(entAng:Right(), -90)

	cam.Start3D2D(pos, ang, 0.03)
		surface.SetDrawColor(black)
		surface.DrawRect(0, 0, 281, 115)

		if self:GetCountdownEnd() != 0 then
			local delta = math.Clamp(self:GetCountdownEnd() - CurTime(), 0, 999)
			draw.DrawText(string.FormattedTime(delta, "%02i:%02i:%02i"), "Impulse-RocketCountdown", 7, 4, fore, TEXT_ALIGN_LEFT)
		end
	cam.End3D2D()
end