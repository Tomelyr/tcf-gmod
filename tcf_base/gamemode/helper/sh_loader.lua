TCF.Disabled = {}
TCF.Disabled = {
	["hud"]		= false,
	["sprint"]	= false
}

if file.Exists("config/disabled.lua", "LUA") then
	if SERVER then AddCSLuaFile("config/disabled.lua") end
	include("config/disabled.lua")
end

local function loadModules()
	local folder = "modules/"
	
	local _, folders = file.Find(folder .. "*", "LUA")
	MsgN("[TCF] Loading Modules...")
	for _, folder in SortedPairs(folders, true) do
		if folder != "base" then
			if folder == "." or folder == ".." or TCF.Disabled then continue end
		end
		
		for _, File in SortedPairs(file.Find(fol .. foldler .. "/sh_*.lua", "LUA"), true) do
			if SERVER then
				AddCSLuaFile(fol .. foldler .. "/" .. File)
			end
			include(fol .. foldler .. "/" .. File)
			MsgN("[TCF] Loading shared file " .. fol .. foldler .. "/" .. File)
		end
		for _, File in SortedPairs(file.Find(fol .. foldler .. "/cl_*.lua", "LUA"), true) do
			if SERVER then
				AddCSLuaFile(fol .. foldler .. "/" .. File)
			else
				include(fol .. foldler .. "/" .. File)
			end
			MsgN("[TCF] Loading clientside file " .. fol .. foldler .. "/" .. File)
		end
		if SERVER then
			for _, File in SortedPairs(file.Find(fol .. foldler .. "/sv_*.lua", "LUA"), true) do
				include(fol .. foldler .. "/" .. File)
				MsgN("[TCF] Loading server file " .. fol .. foldler .. "/" .. File)
			end
		end
	end
end
loadModules()

