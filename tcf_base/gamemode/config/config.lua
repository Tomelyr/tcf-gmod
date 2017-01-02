Config = {}
-- IMPORTANT: MAKE SURE THIS NAME MATCHES UP WITH THE FOLDER NAME FOR THE GAMEMODE OR ELSE SHIT BREAKS
Config["FolderName"] = "tcf_base"

-- Configure the gamemode's basics here.
Config["Team1Name"] = "team1"
Config["Team2Name"] = "team2"
Config["Team1PrettyName"] = "Team 1"
Config["Team2PrettyName"] = "Team 2"
Config["Team1Icon"] = "materials/gui/team1-icon.png"
Config["Team2Icon"] = "materials/gui/team2-icon.png"
Config["Team1MenuModel"] = "models/player/gman_high.mdl"
Config["Team2MenuModel"] = "models/player/gman_high.mdl"
Config["GM.Team1Color"] = Color( 0, 51, 102, 255 )
Config["GM.Team2Color"] = Color( 102, 0, 0, 255 )
Config["Team1Win"] = "Team 1 won!"
Config["Team2Win"] = "Team 2 won!"
Config["TieWin"] = "it's a Tie!"
Config["Team1DefaultPrimary"] = "weapon_smg1"
Config["Team1DefaultSecondary"] = "weapon_pistol"
Config["Team1DefaultMelee"] = "weapon_crowbar"
Config["Team2DefaultPrimary"] = "weapon_ar2"
Config["Team2DefaultSecondary"] = "weapon_pistol"
Config["Team2DefaultMelee"] = "weapon_stunstick"
-- Turn this off if you haven't installed custom voice acting for the gamemode. If you've got custom voice acting, such as the sample included with the example ARW setup, feel free to turn it on.
Config["VoiceActing"] = false
Config["WalkSpeed"] = 100
Config["RunSpeed"] = 250
-- Tea Party is themed after Revolutionary War stuff by default. You can use this to re-theme it to whatever you want.
Config["TeaPartyName"] = "Debug Smash"
Config["TeaPartyDescriptionStart"] = "Team 2 must defend the barrels for "
Config["TeaPartyDescriptionFinish"] = " seconds while Team 1 destroys them!"
Config["TeaPartyCrateModel"] = "models/props_c17/oildrum001.mdl"

-- Other options for configuration.
Config["RestTime"] = 60
Config["RoundTime"] = 300
Config["regen-delay"] = 15 
Config["kill-reward"] = 100 -- higher rank kills is this * 2 exp
Config["barricade-reward"] = 200 -- exp
Config["round-exp-reward"] = 300 -- what a player gets rewarded for team win
Config["round-cash-reward"] = 1000 
Config["player-tags-esp"] = true 
Config["death-sound"] = Sound("soundtrack/kill.wav")
Config["loot-reward"] = 300
Config["objective-reward"] = 50 -- every Config["objective-reward-refresh"] seconds when in objective zone
Config["objective-reward-refresh"] = 8 -- how many seconds reward refreshing for objectives

-- Gamemodes. Don't disable any or add any new ones without setting them up in init.lua (DO NOT ATTEMPT UNLESS YOU KNOW WHAT YOU'RE DOING), but feel free to rename/modify their icon.
GameType = {}

GameType[1] = { name = "Team Deathmatch", icon = "materials/gametype/tdm-icon.png"}
GameType[2] = { name = "Capture Points", icon = "materials/gametype/ctp-icon.png"}
GameType[3] = { name = "King of The Hill", icon = "materials/gametype/koth-icon.png"}
GameType[4] = { name = Config["TeaPartyName"], icon = "materials/gametype/tp-icon.png"}
GameType[5] = { name = "VIP", icon = "materials/gametype/vip-icon.png"}
GameType[6] = { name = "Random", icon = "materials/gametype/random-icon.png"}

/* usage of GM:Config_AddWeapon(weptype, team, ent, damage, accuracy, firerate, level)

weptype = 1 for Primary or 2 for Secondary
team = 1 for all Teams, 2 for Team 1, 3 for Team 2.
ent = classname of SWEP
damage = This and the following two are purely cosmetic for you to show players the weapon's stats. 
accuracy = See above.
firerate = See above.
level = The level required to use the weapon. 0 is always available.

*/

GM:Config_AddWeapon(1,1,"weapon_ar2",5,10,1,0)
GM:Config_AddWeapon(1,1,"weapon_smg1",3,3,8,5)
GM:Config_AddWeapon(1,1,"weapon_pistol",5,10,1,0)
GM:Config_AddWeapon(1,1,"weapon_357",3,3,8,5)
				
-- Spawn locations for both teams during all 3 round types.
Location = {}
	
Location[Config["Team2PrettyName"] .. "-spawn"] = {pos = Vector(8888.750977, 2070.588867, 195.946396)}
Location[Config["Team1PrettyName"] .. "-spawn"] = {pos = Vector(-7397.078613, -1323.084473, 196.989029)}

Location[Config["Team1PrettyName"] .. "-prep"] = {pos = Vector(-3930.692627, 525.278259, 193.856583)}
Location[Config["Team2PrettyName"] .. "-prep"] = {pos = Vector(4873.492188, -150.858917, 205.890381)}

Location[Config["Team1PrettyName"] .. "-Fight"] = {pos = Vector(-3001.453369, 598.242676, 284.071167)}
Location[Config["Team2PrettyName"] .. "-Fight"] = {pos = Vector(3045.126953, -146.878693, 284.796997)}

-- One of these is required for Capture Points.
Location["Barricade"] = {pos = Vector(129.681686, -4250.608398, 249.985199)}

-- The King of The Hill capture point's location.
Location["KOTH"] = {pos = Vector(152.299698, -5508.940430, 206.572662)}

-- Currently unused. Feel free to ignore.
Location["Paper"] = {pos = Vector(-790.058105, -45.686008, 213.875656)}

-- All the objectives for Capture Points. Feel free to add/remove as many as you like, as long as there is at least one on the map.
Objectives = {}
Objectives[2] = {pos = Vector(730.632874, 3378.484619, 205.509277), letter = "A"}
Objectives[1] = {pos = Vector(-759.893005, -48.941532, 160.737976), letter = "B"}
Objectives[3] = {pos = Vector(59.757538, -1851.403320, 134.939987), letter = "C"}
Objectives[4] = {pos = Vector(124.558128, -5437.647949, 219.013824), letter = "D"}

-- All the objectives for Tea Party(or whatever you rename it). Feel free to add/remove as many as you like, as long as there is at least one on the map.
-- Todo: move that into the Gamemodes
GM:Config_AddTeaCrate(Vector(557.825806, -5619.362793, 249.031250))
GM:Config_AddTeaCrate(Vector(547.544678, -5846.391113, 249.031250))
GM:Config_AddTeaCrate(Vector(345.031311, -5957.604004, 249.031250))

GM:Config_AddTeaCrate(Vector(-383.222351, -5654.589355, 249.031250))
GM:Config_AddTeaCrate(Vector(-464.142975, -5384.095215, 249.031250))
GM:Config_AddTeaCrate(Vector(-687.777710, -5578.760254, 249.031250))

GM:Config_AddTeaCrate(Vector(13.822784, -2401.628662, 162.782272))
GM:Config_AddTeaCrate(Vector(-86.861954, -2416.200928, 164.113464))
GM:Config_AddTeaCrate(Vector(-60.340714, -2292.388916, 164.673431))

GM:Config_AddTeaCrate(Vector(-1290.126099, -1114.311646, 192.213455))
GM:Config_AddTeaCrate(Vector(-1111.859131, -1089.209839, 198.177856))
GM:Config_AddTeaCrate(Vector(-1188.244629, -863.862427, 210.978821))

GM:Config_AddTeaCrate(Vector(-1116.227539, -228.156967, 220.343048))
GM:Config_AddTeaCrate(Vector(-831.201050, -16.967257, 215.175766))
GM:Config_AddTeaCrate(Vector(-541.809692, -4.899796, 226.122406))

GM:Config_AddTeaCrate(Vector(-780.686218, 2537.644531, 263.383484))
GM:Config_AddTeaCrate(Vector(-615.908508, 2514.665283, 284.019562))
GM:Config_AddTeaCrate(Vector(-728.508057, 2163.985107, 304.579559))

GM:Config_AddTeaCrate(Vector(923.803833, 3431.851563, 264.812592))
GM:Config_AddTeaCrate(Vector(553.439331, 3409.010010, 266.337585))
GM:Config_AddTeaCrate(Vector(734.179993, 3101.103516, 263.925964))

Rank = {}
-- Ensure these playermodels are set to the ones you want to use for gameplay.
Rank[Config["Team1PrettyName"] .. "-Private"] = {name = "Private", model = "models/kriegsyntax/awoi/rebels/private/playermodel.mdl"}
Rank[Config["Team2PrettyName"] .. "-Private"] = {name = "Private", model = "models/kriegsyntax/awoi/british/private/playermodel.mdl"}

Rank[Config["Team1PrettyName"] .. "-Corporal"] = {name = "Corporal", model = "models/kriegsyntax/awoi/rebels/private/playermodel.mdl"}
Rank[Config["Team2PrettyName"] .. "-Corporal"] = {name = "Corporal", model = "models/kriegsyntax/awoi/british/private/playermodel.mdl"}

Rank[Config["Team1PrettyName"] .. "-Sergeant"] = {name = "Sergent", model = "models/kriegsyntax/awoi/rebels/private/playermodel.mdl"}
Rank[Config["Team2PrettyName"] .. "-Sergeant"] = {name = "Sergent", model = "models/kriegsyntax/awoi/british/private/playermodel.mdl"}

Rank[Config["Team1PrettyName"] .. "-SergeantMajor"] = {name = "SergentMajor", model = "models/kriegsyntax/awoi/rebels/private/playermodel.mdl"}
Rank[Config["Team2PrettyName"] .. "-SergeantMajor"] = {name = "SergentMajor", model = "models/kriegsyntax/awoi/british/private/playermodel.mdl"}

Rank[Config["Team1PrettyName"] .. "-Lieutenant"] = {name = "Lieutenant", model = "models/kriegsyntax/awoi/rebels/private/playermodel.mdl"}
Rank[Config["Team2PrettyName"] .. "-Lieutenant"] = {name = "Lieutenant", model = "models/kriegsyntax/awoi/british/private/playermodel.mdl"}

Rank[Config["Team1PrettyName"] .. "-Captain"] = {name = "Captain", model = "models/kriegsyntax/awoi/rebels/private/playermodel.mdl"}
Rank[Config["Team2PrettyName"] .. "-Captain"] = {name = "Captain", model = "models/kriegsyntax/awoi/british/private/playermodel.mdl"}

Rank[Config["Team1PrettyName"] .. "-Major"] = {name = "Major", model = "models/kriegsyntax/awoi/rebels/private/playermodel.mdl"}
Rank[Config["Team2PrettyName"] .. "-Major"] = {name = "Major", model = "models/kriegsyntax/awoi/british/private/playermodel.mdl"}
