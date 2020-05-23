util.AddNetworkString("impulseHL2ORPRocketRhumble")
util.AddNetworkString("impulseHL2ORPRocketSound")

function impulse.Rocket.GetRocket()
	if IsValid(CACHED_ROCKET) then
		return CACHED_ROCKET
	end

	CACHED_ROCKET = ents.FindByClass("impulse_hl2orp_rocket")[1]

	return CACHED_ROCKET
end

function impulse.Rocket.LaunchSequence()
	local rocket = impulse.Rocket.GetRocket()
	local console = ents.FindByClass("impulse_hl2orp_rocketconsole")[1]

	if not IsValid(rocket) then
		return
	end

	local launchStart = CurTime()
	local launchEnd = CurTime() + 300
	local loop1
	local loop2

	impulse.Rocket.SetCountdownEnd(launchEnd)
	loop1 = console:StartLoopingSound("impulseRocketAlertLoop1")

	timer.Simple(1.5, function() impulse.Rocket.SpeakerEmitSound("ambient/levels/launch/1stfiringwarning.wav", 100) end)
	timer.Simple(4, function() console:EmitSound("impulseRocketAlertLoop1") end)
	timer.Simple(190, function() impulse.Rocket.SpeakerEmitSound("impulse/outlands/launchsiren_start.wav", 80, 100, 0.9) end)
	timer.Simple(290, function()
		console:StopLoopingSound(loop1)
		loop2 = console:StartLoopingSound("impulseRocketAlertLoopFinal")
	end)
	timer.Simple(300, function()
		console:StopLoopingSound(loop2)
	end)

	timer.Simple(275, function()
		impulse.Rocket.SpeakerEmitSound("ambient/levels/launch/launchvoice.wav", 95, 100, 1)
	end)

	timer.Simple(282, function()
		if not IsValid(rocket) or not IsValid(console) then
			return
		end

		net.Start("impulseHL2ORPRocketRhumble")
		net.Broadcast()

		console:EmitSound("ambient/levels/launch/interiorturbulance.wav")

		util.ScreenShake(rocket:GetPos(), 1.2, 5, 25, 20000)

		timer.Simple(4, function()
			if not IsValid(rocket) then
				return
			end

			rocket:LaunchSequence()
		end)

		timer.Simple(27, function()
			impulse.Rocket.SpeakerEmitSound("impulse/outlands/launchsiren_allclear.wav", 80, 100, 0.9)
		end)
	end)
end

function impulse.Rocket.SetCountdownEnd(time)
	local console = ents.FindByClass("impulse_hl2orp_rocketconsole")[1]
	console:SetCountdownEnd(time)
end

function impulse.Rocket.GetBlastDoor()

end

function impulse.Rocket.EmitRocketSound(sndscript)
	local rocket = impulse.Rocket.GetRocket()

	net.Start("impulseHL2ORPRocketSound")
	net.WriteEntity(rocket)
	net.WriteString(sndscript)
	net.Broadcast()
end

function impulse.Rocket.EmitGlobalSound()

end

function impulse.Rocket.SpeakerEmitSound(...)
	for v,k in pairs(ents.FindByClass("impulse_hl2orp_rocketspeaker")) do
		k:EmitSound(...)
	end
end

function impulse.Rocket.StartFuel()

end

function impulse.Rocket.StopFuel()

end
