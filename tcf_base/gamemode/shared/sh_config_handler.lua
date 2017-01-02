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
	if team == 1 then
		GM:Config_AddWeapon(weptype, 2, ent, damage, accuracy, firerate, level)
		GM:Config_AddWeapon(weptype, 3, ent, damage, accuracy, firerate, level)
		return
	end
	local weptbl = weapons.Get(ent)
	Weapons[#Weapons + 1] = {weptype = weptype,
							team = team, entname = ent or "",
							display = weptbl.PrintName or weptbl.ClassName or "" ,
							model = weptbl.WorldModel or nil,
							damage = damage or 0,
							accuracy = accuracy or 0,
							firerate = firerate or 0,
							level = level or 0
							}
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

