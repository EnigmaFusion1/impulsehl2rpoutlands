-- this is a boot controller, it is called before anything else and is meant to be used to load dependencies from other schemas

-- make environment backwards compatible (kinda hacky ik)
-- these bois no longer exist x/
TEAM_CP = 900
TEAM_CA = 901
TEAM_CWU = 902

-- manually declare teams because they dont load until after the dependencies boot, could probably fix this a neater way but meh
TEAM_CITIZEN = 1
TEAM_OTA = 2 
TEAM_VORT = 3

-- use PiggyBoot to boot partially off hl2rp main schema, this should make development much easier
impulse.Schema.PiggyBootEntities("impulsehl2rp")

impulse.Schema.PiggyBoot("impulsehl2rp", "schema/items")
impulse.Schema.PiggyBoot("impulsehl2rp", "schema/benches")
impulse.Schema.PiggyBoot("impulsehl2rp", "schema/mixtures")
impulse.Schema.PiggyBoot("impulsehl2rp", "schema/buyables")
impulse.Schema.PiggyBoot("impulsehl2rp", "schema/config")

impulse.Schema.PiggyBoot("impulsehl2rp", "schema/scripts")
impulse.Schema.PiggyBoot("impulsehl2rp", "schema/scripts/vgui")
impulse.Schema.PiggyBoot("impulsehl2rp", "schema/scripts/hooks")

-- load core hl2rp plugins
impulse.Schema.PiggyBootPlugin("impulsehl2rp", "combineoverlay")
impulse.Schema.PiggyBootPlugin("impulsehl2rp", "dispatch")
impulse.Schema.PiggyBootPlugin("impulsehl2rp", "dropships")
impulse.Schema.PiggyBootPlugin("impulsehl2rp", "headcrabcanister")
impulse.Schema.PiggyBootPlugin("impulsehl2rp", "plogs")
impulse.Schema.PiggyBootPlugin("impulsehl2rp", "snow")
impulse.Schema.PiggyBootPlugin("impulsehl2rp", "xf_sync")