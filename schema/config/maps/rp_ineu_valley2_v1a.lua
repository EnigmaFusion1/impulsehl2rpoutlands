impulse.Config.MapWorkshopID = "232486601"

impulse.Config.MenuCamPos = Vector(-7301.1215820313, -6692.30078125, 1501.1516113281)
impulse.Config.MenuCamAng = Angle(2.1246426105499, -72.518562316895, 0)

impulse.Config.SpawnPos1 = Vector(-1150.7692871094, 2095.2966308594, 1234.2391357422)
impulse.Config.SpawnPos2 = Vector(-5159.873046875, 3580.8022460938, 16.564235687256)

impulse.Config.CityCode = "S12"

impulse.Config.BlacklistEnts = {
	["game_text"] = true,
	["item_healthcharger"] = true,
	["item_suitcharger"] = true
}

impulse.Config.IntroScenes = {
	{
	    pos = Vector(2192.0412597656, 3848.9274902344, 3039.6599121094),
     	endpos = Vector(2205.1589355469, 3395.7192382813, 3039.6599121094),
     	posNoLerp = true,
     	posSpeed = 0.05,
	    ang = Angle(1.4019470214844, -175.22178649902, 0),
	    endang = Angle(-34.912124633789, 177.8243560791, 0),
	    fovFrom = 60,
	    fovTo = 94,
     	speed = 0.2,
	    time = 5,
	    text = "Welcome to the City 17 Industrial District.",
     	onStart = function()
        	LocalPlayer():ScreenFade(SCREENFADE.IN, Color(0, 0, 0), 1, 0.1)
     	end,
     	fadeOut = true
    },
	{
		pos = Vector(2390.1274414063, 4948.2817382813, 384.98208618164),
     	endpos = Vector(2678.0747070313, 4965.302734375, 456.45989990234),
     	posSpeed = 0.1,
     	posNoLerp = true,
	    ang = Angle(-11.153659820557, 0.51149892807007, 0),
     	endang = Angle(-13.375009536743, 0.89781904220581, 0),
	    text = "This is a roleplay server set in the Half-Life 2 Universe. You play as an oppressed citizen.",
	    time = 10,
	    fadeIn = true,
	    fadeOut = true
	},
	{
		pos = Vector(2912.8732910156, 2758.6337890625, 3030.9833984375),
	    ang = Angle(20.911111831665, 88.154899597168, 0),
	    endpos = Vector(2901.1027832031, 2802.4157714844, 3439.1896972656),
	    endang = Angle(-27.66863822937, 92.017936706543, 0),
	    posNoLerp = true,
	    posSpeed = 0.1,
	    speed = 0.1,
	    fovFrom = 75,
	    fovTo = 55,
	    fovSpeed = 0.1,
	    text = "An interdimensional empire known commonly as the Combine has taken control of Earth.",
	    time = 13.5,
	    fadeIn = true,
	    fadeOut = true
	},
	{
	    pos = Vector(2438.4790039063, 3677.5034179688, -203.09471130371),
	    endpos = Vector(2549.0437011719, 3827.8190917969, -167.09471130371),
	    posNoLerp = true,
	    posSpeed = 0.092,
	    ang = Angle(17.627307891846, 149.28977966309, 0),
	    text = "Metropolice and trans-human OTA units uphold the Combine's rule and squash civil resistance.",
	    time = 11,
	    fadeIn = true,
	    fadeOut = true
	},
	{
		pos = Vector(3228.2243652344, 4426.2797851563, 415.69180297852),
     	endpos = Vector(3055.4653320313, 4393.1123046875, 399.84503173828),
	    ang = Angle(21.876817703247, -129.53663635254, 0),
     	endang = Angle(20.041788101196, -55.363834381104, 0),
	    text = "Tokens and food rationed by the Combine are supplied at ration dispensers around the city.",
     	speed = 0.15,
	    time = 9.5,
	    fadeIn = true,
	    fadeOut = true
	},
	{
	    pos = Vector(3234.205078125, 5460.7192382813, 357.88122558594),
	    endpos = Vector(3130.3693847656, 5369.8588867188, 376.42010498047),
	    ang = Angle(5.0718064308167, 22.914667129517, 0),
	    endang = Angle(-10.960467338562, 97.280906677246, 0),
	    posSpeed = 0.18,
	    speed = 0.2,
	    fovFrom = 78,
	    fovTo = 82,
	    fovSpeed = 0.01,
	    text = "You can choose to join the Civil Workers Union and sell food, setup businesses or become a doctor.",
	    time = 10,
	    fadeIn = true,
	    fadeOut = true
	},
	{
		pos = Vector(208.09274291992, 4483.025390625, 1040.66796875),
		endpos = Vector(208.2241973877, 4477.4326171875, 721.21838378906),
		ang = Angle(89, -88.53897857666, 0),
		endang = Angle(89, 89.601470947266, 0),
		posSpeed = 0.1,
		speed = 0.1,
		text = "You can also purchase an apartment or property, decorate it or use it to store items.",
		time = 10,
	    fadeIn = true,
	    fadeOut = true
	},
	{ -- out of sync a bit
	    pos = Vector(8456.953125, 9063.96875, 607.52703857422),
	    endpos = Vector(8371.02734375, 8875.0048828125, 657.33618164063),
	    ang = Angle(4.1062116622925, 118.28520965576, 0),
	    endang = Angle(11.349680900574, 145.81045532227, 0),
	    posSpeed = 0.1,
	    posNoLerp = true,
	    speed = 0.15,
	    fovFrom = 52,
	    fovTo = 71,
	    fovSpeed = 0.14,
	    text = "If you wish to revolt, you may join the resistance, however it is no easy task...",
	    time = 12,
	    fadeIn = true,
	    fadeOut = true
	},
	{
	    pos = impulse.Config.MenuCamPos,
	    ang = impulse.Config.MenuCamAng,
	    fovFrom = 40,
	    fovSpeed = 0.2,
	    time = 13,
	    text = "Welcome to impulse: Half-Life 2 Roleplay.",
	    static = true,
	    fadeIn = true,
	    onStart = function()
	    	CHAR_MUSIC = CreateSound(LocalPlayer(), "music/hl2_song2.mp3")
	    	CHAR_MUSIC:SetSoundLevel(0)
	    	CHAR_MUSIC:ChangeVolume(1.5)
	    	CHAR_MUSIC:ChangePitch(70)
	    	CHAR_MUSIC:Play()
	    end
	}
}

impulse.Config.Zones = {}

impulse.Config.Buttons = {}

impulse.Config.LoadScript = function()
end