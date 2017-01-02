-- Need to put these table into the GM later. dont want all the globals.
Weapons = Weapons or {}
TeaCrates = TeaCrates or {}

/**
 * New Weapon adding function, to remove user error
 *
 * param 	integer $weptype	Primary or Secondary check
 * param 	integer $team		TeamID for later use
 * param 	string	 $ent 		classname of swep ent
 * param 	integer $damage 	cosmetic number for UI, defaults to 0
 * param 	integer $accuracy 	cosmetic number for UI, defaults to 0
 * param 	integer $firerate 	cosmetic number for UI, defaults to 0
 * param 	integer $level 	Level requirement for SWEP, defaults to 0
 * 
 * return	nil
 */ 
function GM:Config_AddWeapon(weptype, team, ent, damage, accuracy, firerate, level)
-- Error handlers:
	if weptype == nil or team == nil or ent == nil then
		MsgN("[TCF] Weapon could not be added: " .. ent)
		return
	end
	local weptbl = weapons.Get(ent)
	Weapons[#Weapons + 1] = {weptype = weptype, -- 1 for Primary, 2 for Secondary
				team = team, -- 2 for Team 1, 3 for Team 2.
				entname = ent or "", -- The entity class of the weapon.
				display = weptbl.PrintName or weptbl.ClassName or "" , -- The display name of the weapon on the loadout screen.
				model = weptbl.WorldModel or nil, -- The icon model of the weapon on the loadout screen.
				damage = damage or 0, -- This and the following two are purely cosmetic for you to show players the weapon's stats.
				accuracy = accuracy or 0, -- See above.
				firerate = firerate or 0, -- See above.
				level = level or 0} -- The level required to use the weapon. 0 is always available.
end

/**
 * Adding TeaCrates Spawnpositions. Todo: Move them into the TeaCrates Gamemode.
 *
 * param 	vector $pos	Position of the crate
 * 
 * return	nil
 */ 
function GM:Config_AddTeaCrate(pos)
-- Error handlers:
	if pos == nil or !isvector(pos) then
		MsgN("[TCF](TeaCrate) TeaCrate could not be added at pos: " .. pos)
		return
	end
	TeaCrates[#TeaCrates + 1] = {pos = pos}
end

