net.Receive("impulseHL2ORPRocketRhumble", function()
	LocalPlayer():EmitSound("ep02_outro.Rhumble01")
end)

net.Receive("impulseHL2ORPRocketSound", function()
	local ent = net.ReadEntity()
	local sndscript = net.ReadString()

	if not IsValid(ent) then
		return print("no wocket :(((")
	end

	ent:EmitSound(sndscript)
end)