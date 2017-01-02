AddCSLuaFile( "cl_init.lua" )
include( "shared.lua" )
AddCSLuaFile( "shared.lua" )

MsgN("_-_-_-_- Server Files -_-_-_-_")
MsgN("Loading Server Files")
for _, file in pairs (file.Find(Config["FolderName"] .. "/gamemode/server/*.lua", "LUA")) do
   MsgN("-> "..file)
   include(Config["FolderName"] .. "/gamemode/server/"..file) 
end

MsgN("_-_-_-_- Shared Files -_-_-_-_")
MsgN("Loading Shared Files")
for _, file in pairs (file.Find(Config["FolderName"] .. "/gamemode/shared/*.lua", "LUA")) do
   MsgN("-> "..file)
   AddCSLuaFile(Config["FolderName"] .. "/gamemode/shared/"..file)
   include(Config["FolderName"] .. "/gamemode/shared/"..file) 
end

MsgN("_-_-_-_- Client Files -_-_-_-_")
MsgN("Loading Client Files")
for _, file in pairs (file.Find(Config["FolderName"] .. "/gamemode/client/*.lua", "LUA")) do
   MsgN("-> "..file)
   AddCSLuaFile(Config["FolderName"] .. "/gamemode/client/"..file)
end
MsgN("SERVER: finished Loading Client Files")
function GM:Initialize()
	MsgN("SERVER: start network string memes")
	util.AddNetworkString( 'open_teammenu' )
	util.AddNetworkString( 'open_settings' )
	util.AddNetworkString( 'open_tutorial' )
	util.AddNetworkString( 'open_loadout' )
	util.AddNetworkString( 'SetTeam' )
	util.AddNetworkString( 'playsong' )
	MsgN("SERVER: end network string memes, start global inits")
   
	SetGlobalInt( "GameState", 1 ) -- 1/rest 2/prep 3/battle
	SetGlobalInt( "StateStartTime", RealTime())
	SetGlobalString( "GameTypeSelected", nil)
	MsgN("SERVER: end global inits")
   
end