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
	
	local _, folders = file.Find(folder .. "*", "LUA)
	
	for _, folder in SortedPairs(folders, true) do
		if folder == "." or folder == ".." or TCF.Disabled then continue end
		
		for _, File in SortedPairs(file.Find(fol .. folder .. "/sh_*.lua", "LUA"), true) do
			if SERVER then
				AddCSLuaFile(fol .. foldler .. "/" .. File)
			end
			include(fol .. foldler .. "/" .. File)
		end
		for _, File in SortedPairs(file.Find(fol .. folder .. "/cl_*.lua", "LUA"), true) do
			if SERVER then
				AddCSLuaFile(fol .. foldler .. "/" .. File)
			end
		end
		for _, File in SortedPairs(file.Find(fol .. folder .. "/sv_*.lua", "LUA"), true) do
			include(fol .. foldler .. "/" .. File)
		end
	end
end
		