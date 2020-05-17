TEAM_OTA = impulse.Teams.Define({
	name = "Overwatch Transhuman Arm",
	color = Color(60, 60, 60, 255),
	description = [[The OTA are the military wing of the Universal Union’s forces.
	They are highly trained and extensively modified super soldiers, far stronger
	than any normal human. They are entirely without fear or emotion of any kind,
	called on to the streets only when circumstances are at their most dire.
	Otherwise, they remain in the Nexus or guarding hardpoints around the city.
	They are completely obedient to their commander, following orders without
	regard to their own safety. Operating in small squads, the OTA are a force
	to be reckoned with, and haunt the dreams of any citizen with common sense.]],
	loadout = {"impulse_hands", "weapon_physgun", "gmod_tool"},
	salary = 300,
	model = "models/player/soldier_stripped.mdl",
	handModel = "models/weapons/c_arms_combine.mdl",
	percentLimit = true,
	limit = 0.15,
	xp = 500,
	cp = true,
	doorGroup = {1, 2, 3, 4},
	blockNameChange = true,

	classes = {
		{
			name = "ECHO",
			description = "ECHO units are highly trained medium-range combat units. ECHO units are a jack of all trades, master of none. They have access to a mix of close and medium range weaponry.",
			model = "models/Combine_Soldier.mdl",
			skin = 0,
			xp = 500,
			armour = 100,
			noMenu = true
		},
		{
			name = "MACE",
			description = "MACE units are close-quaters engagement specialists. They are ineffective at medium and long ranges however they excel at close-quaters due to their SPAS-12 shotgun and heavy armour. MACE units are excellent at performing raids and bruteforcing into enemy strongholds.",
			model = "models/Combine_Soldier.mdl",
			skin = 1,
			itemsAdd = {
				{class = "wep_shotgun", amount = 1}
			},
			xp = 1000,
			armour = 130,
			percentLimit = true,
			limit = 0.05,
			noMenu = true
		},
		{
			name = "SENTINEL",
			description = "SENTINEL units are elite, disiplined units that act as close protection for the City Administrator or any high value political figures. They are equipped with heavy armour and medium range weaponry. They do not attach to a normal OTA squad and instead stay with the City Administrator at all times.",
			model = "models/Combine_Super_Soldier.mdl",
			skin = 0,
			itemsAdd = {
				{class = "wep_ar2", amount = 1}
			},
			xp = 1500,
			armour = 130,
			limit = 2,
			noMenu = true
		}
	},

	ranks = {
		{
			name = "OWS",
			description = "ows",
			xp = 500,
			onBecome = function(ply, rank)
				if ply:GetTeamClass() == CLASS_ECHO then
					ply:GiveInventoryItem("wep_smg", 1, true)
				end
			end
		},
		{
			name = "EOW",
			description = "eow",
			xp = 1500,
			onBecome = function(ply, rank)
				if ply:GetTeamClass() == CLASS_ECHO then
					ply:GiveInventoryItem("wep_ar2", 1, true)
				end
			end
		},
		{
			name = "LDR",
			description = "ldr",
			xp = 3000,
			percentLimit = true,
			limit = 0.04,
			onBecome = function(ply, rank)
				if ply:GetTeamClass() == CLASS_ECHO then
					ply:GiveInventoryItem("wep_ar2", 1, true)
				end
			end
		}
	}
})

CLASS_ECHO = 1
CLASS_MACE = 2
CLASS_SENTINEL = 3

RANK_OWS = 1
RANK_EOW = 2
RANK_LDR = 3