--[[
				SETUP TUTORIAL:
		1. Make sure FolderName config is set properly. VERY IMPORTANT!!!
		2. Configure team names and all the below config stuff.
		3. Go through the file and make sure to update any Location or Objective/TeaCrates related positions for your map you're using.
		4. The gamemode is by default set up for the following maps: arw_fields/acw_battlefield_farmlands/rp_arw_nomad/rp_arw_imperium or any versions of these series of maps.
		5. If you are not using the maps listed in step 4, please make sure to gather locations for stuff using the following:
			A. Load up the map in sandbox
			B. Go to a location you want to put a Capture Point at.
			C. Open your console, type "getpos", and hit enter.
			D. You should get an output like this: "setpos 500 420 340;setang 420 69 666"
			C. Turn the first three numbers into a vector in a text editor, format it like this: Vector(500,420,340)
			E. Set up the Capture Point line down by the others in the file like this: "Objectives[1] = {pos = Vector(500,420,340), letter = "A"}"
			F. Make sure that the number inside Objectives[] is the next number in the sequence.
			G. Repeat these steps for as many Objectives and TeaCrates as you want to add, or to add the required stuff like Barricades, player spawns, and the KOTH point!
		6. Set up the weapons, following the instructions listed there.
		7. Edit the rank playermodels to be what you want them to be for the two teams.
		8. Launch the server, and enjoy!

]]--

team.SetUp( 1, "Undecieded", Color( 0, 204, 0, 255 ) ) 
team.SetUp( 2, Config["Team1PrettyName"], Config["GM.Team1Color"] ) 
team.SetUp( 3, Config["Team2PrettyName"], Config["GM.Team2Color"] ) 

function GM:ScalePlayerDamage( ply, hitgroup, dmginfo )
	if hitgroup == HITGROUP_HEAD then
		if GetGlobalEntity("Team2VIP") == ply or GetGlobalEntity("Team1VIP") == ply then
			dmginfo:ScaleDamage(1)
		else
			dmginfo:ScaleDamage(2)
		end
	else
		if GetGlobalEntity("Team2VIP") == ply or GetGlobalEntity("Team1VIP") == ply then
			dmginfo:ScaleDamage(0.5)
		else
			dmginfo:ScaleDamage(1)
		end
	end
end

function GM:PlayerButtonDown( ply, button )
	if Config["VoiceActing"] != true then
		return
	end
	if ply.cooldown == true then
		return
	end
	if button == KEY_V and ply.is_voicechat != true then
		ply.is_voicechat = true
		print("voice chat on:")
		print(ply.is_voicechat)
		return
	end
	if button == KEY_0 and ply.is_voicechat == true then
		ply.is_voicechat = false
		print("voice chat off: ")
		print(ply.is_voicechat)
		return
	end
	if button == KEY_1 and ply.is_voicechat == true and ply:Alive() == true then
		if SERVER then
			ply:Say("(VOICE) Help!", true)
		end
		local sounds_r = {1,2,3,4}
		local sounds_b = {1,2,3}
		if SERVER then
			if ply:Team() == 2 then
				ply:EmitSound("voice/" .. Config["Team1Name"] .. "/help/" .. Config["Team1Name"] .. "-help-"..table.Random(sounds_r)..".wav")
			elseif ply:Team() == 3 then
				ply:EmitSound("voice/" .. Config["Team2Name"] .. "/help/" .. Config["Team2Name"] .. "-help-"..table.Random(sounds_b)..".wav")
			end
		end
		ply.is_voicechat = false
		ply.cooldown = true
		timer.Simple( 3, function() ply.cooldown = false end )
		return
	end
	if button == KEY_2 and ply.is_voicechat == true and ply:Alive() == true then
		local sounds_r = {1,2}
		local sounds_b = {1,2}
		if SERVER then
			if ply:Team() == 2 then
				ply:EmitSound("voice/" .. Config["Team1Name"] .. "/battle_cry/" .. Config["Team1Name"] .. "-battlecry-"..table.Random(sounds_r)..".wav")
			elseif ply:Team() == 3 then
				ply:EmitSound("voice/" .. Config["Team2Name"] .. "/battle_cry/" .. Config["Team2Name"] .. "-battle_cry-"..table.Random(sounds_b)..".wav")
			end
		end
		ply.is_voicechat = false
		ply.cooldown = true
		timer.Simple( 3, function() ply.cooldown = false end )
		return
	end
	if button == KEY_3 and ply.is_voicechat == true and ply:Alive() == true then
		local sounds_r = {1,2,3,4,5,6}
		local sounds_b = {1,2}
		if SERVER then
			if ply:Team() == 2 then
				ply:EmitSound("voice/" .. Config["Team1Name"] .. "/cheers/" .. Config["Team1Name"] .. "-cheers-"..table.Random(sounds_r)..".wav")
			elseif ply:Team() == 3 then
				ply:EmitSound("voice/" .. Config["Team2Name"] .. "/cheers/" .. Config["Team2Name"] .. "-cheers-"..table.Random(sounds_b)..".wav")
			end
		end
		ply.is_voicechat = false
		ply.cooldown = true
		timer.Simple( 3, function() ply.cooldown = false end )
		return
	end
	if button == KEY_4 and ply.is_voicechat == true and ply:Alive() == true then
		local sounds_r = {1,2,3,4,5,6,7,8}
		local sounds_b = {1,2,3,4}
		if SERVER then
			if ply:Team() == 2 then
				ply:EmitSound("voice/" .. Config["Team1Name"] .. "/jeers/" .. Config["Team1Name"] .. "-taunt-"..table.Random(sounds_r)..".wav")
			elseif ply:Team() == 3 then
				ply:EmitSound("voice/" .. Config["Team2Name"] .. "/jeers/" .. Config["Team2Name"] .. "-jeers-"..table.Random(sounds_b)..".wav")
			end
		end
		ply.is_voicechat = false
		ply.cooldown = true
		timer.Simple( 3, function() ply.cooldown = false end )
		return
	end
	if button == KEY_5 and ply.is_voicechat == true and ply:Alive() == true then
		if SERVER then
			ply:Say("(VOICE) Thanks!", true)
		end
		local sounds_r = {1,2,3}
		local sounds_b = {1,2}
		if SERVER then
			if ply:Team() == 2 then
				ply:EmitSound("voice/" .. Config["Team1Name"] .. "/thanks/" .. Config["Team1Name"] .. "-thanks-"..table.Random(sounds_r)..".wav")
			elseif ply:Team() == 3 then
				ply:EmitSound("voice/" .. Config["Team2Name"] .. "/thanks/" .. Config["Team2Name"] .. "-thanks-"..table.Random(sounds_b)..".wav")
			end
		end
		ply.is_voicechat = false
		ply.cooldown = true
		timer.Simple( 3, function() ply.cooldown = false end )
		return
	end
	if button == KEY_6 and ply.is_voicechat == true and ply:Alive() == true then
		if SERVER then
			ply:Say("(VOICE) Go Go Go!", true)
		end
		local sounds_r = {1,2,3,4}
		local sounds_b = {1,2,3}
		if SERVER then
			if ply:Team() == 2 then
				ply:EmitSound("voice/" .. Config["Team1Name"] .. "/gogogo/" .. Config["Team1Name"] .. "-gogogo-"..table.Random(sounds_r)..".wav")
			elseif ply:Team() == 3 then
				ply:EmitSound("voice/" .. Config["Team2Name"] .. "/gogogo/" .. Config["Team2Name"] .. "-gogogo-"..table.Random(sounds_b)..".wav")
			end
		end
		ply.is_voicechat = false
		ply.cooldown = true
		timer.Simple( 3, function() ply.cooldown = false end )
		return
	end
	if button == KEY_7 and ply.is_voicechat == true and ply:Alive() == true then
		if SERVER then
			ply:Say("(VOICE) Yes.", true)
		end
		local sounds_r = {1,2,3}
		local sounds_b = {1,2,3}
		if SERVER then
			if ply:Team() == 2 then
				ply:EmitSound("voice/" .. Config["Team1Name"] .. "/yes/" .. Config["Team1Name"] .. "-yes-"..table.Random(sounds_r)..".wav")
			elseif ply:Team() == 3 then
				ply:EmitSound("voice/" .. Config["Team2Name"] .. "/yes/" .. Config["Team2Name"] .. "-yes-"..table.Random(sounds_b)..".wav")
			end
		end
		ply.is_voicechat = false
		ply.cooldown = true
		timer.Simple( 3, function() ply.cooldown = false end )
		return
	end
	if button == KEY_8 and ply.is_voicechat == true and ply:Alive() == true then
		if SERVER then
			ply:Say("(VOICE) No.", true)
		end
		local sounds_r = {1,2,3,4}
		local sounds_b = {1,2,3}
		if SERVER then
			if ply:Team() == 2 then
				ply:EmitSound("voice/" .. Config["Team1Name"] .. "/no/" .. Config["Team1Name"] .. "-no-"..table.Random(sounds_r)..".wav")
			elseif ply:Team() == 3 then
				ply:EmitSound("voice/" .. Config["Team2Name"] .. "/no/" .. Config["Team2Name"] .. "-no-"..table.Random(sounds_b)..".wav")
			end
		end
		ply.is_voicechat = false
		ply.cooldown = true
		timer.Simple( 3, function() ply.cooldown = false end )
		return
	end
	if button == KEY_9 and ply.is_voicechat == true and ply:Alive() == true then
		if SERVER then
			ply:Say("(VOICE) Complete the objective!", true)
		end
		if GetGlobalString("GameTypeSelected") == GameType[1].name then
			local sounds_b = {7,8}
			local sounds_r = {9,10}
			if SERVER then
				if ply:Team() == 2 then
					ply:EmitSound("voice/" .. Config["Team1Name"] .. "/objective/" .. Config["Team1Name"] .. "-objectivespecific-"..table.Random(sounds_r)..".wav")
				elseif ply:Team() == 3 then
					ply:EmitSound("voice/" .. Config["Team2Name"] .. "/objective/" .. Config["Team2Name"] .. "-objective_specific-"..table.Random(sounds_b)..".wav")
				end
			end
		elseif GetGlobalString("GameTypeSelected") == GameType[2].name then
			local sounds_b = {10}
			local sounds_r = {11}
			if SERVER then
				if ply:Team() == 2 then
					ply:EmitSound("voice/" .. Config["Team1Name"] .. "/objective/" .. Config["Team1Name"] .. "-objectivespecific-"..table.Random(sounds_r)..".wav")
				elseif ply:Team() == 3 then
					ply:EmitSound("voice/" .. Config["Team2Name"] .. "/objective/" .. Config["Team2Name"] .. "-objective_specific-"..table.Random(sounds_b)..".wav")
				end
			end
		elseif GetGlobalString("GameTypeSelected") == GameType[3].name then
			local sounds_b = {5,6}
			local sounds_r = {3,6}
			if SERVER then
				if ply:Team() == 2 then
					ply:EmitSound("voice/" .. Config["Team1Name"] .. "/objective/" .. Config["Team1Name"] .. "-objectivespecific-"..table.Random(sounds_r)..".wav")
				elseif ply:Team() == 3 then
					ply:EmitSound("voice/" .. Config["Team2Name"] .. "/objective/" .. Config["Team2Name"] .. "-objective_specific-"..table.Random(sounds_b)..".wav")
				end
			end
		elseif GetGlobalString("GameTypeSelected") == GameType[4].name then
			local sounds_b = {3,4}
			local sounds_r = {1,4,8}
			if SERVER then
				if ply:Team() == 2 then
					ply:EmitSound("voice/" .. Config["Team1Name"] .. "/objective/" .. Config["Team1Name"] .. "-objectivespecific-"..table.Random(sounds_r)..".wav")
				elseif ply:Team() == 3 then
					ply:EmitSound("voice/" .. Config["Team2Name"] .. "/objective/" .. Config["Team2Name"] .. "-objective_specific-"..table.Random(sounds_b)..".wav")
				end
			end
		elseif GetGlobalString("GameTypeSelected") == GameType[5].name then
			local sounds_b = {9}
			local sounds_r = {12}
			if SERVER then
				if ply:Team() == 2 then
					ply:EmitSound("voice/" .. Config["Team1Name"] .. "/objective/" .. Config["Team1Name"] .. "-objectivespecific-"..table.Random(sounds_r)..".wav")
				elseif ply:Team() == 3 then
					ply:EmitSound("voice/" .. Config["Team2Name"] .. "/objective/" .. Config["Team2Name"] .. "-objective_specific-"..table.Random(sounds_b)..".wav")
				end
			end
		end
		ply.is_voicechat = false
		ply.cooldown = true
		timer.Simple( 3, function() ply.cooldown = false end )
		return
	end
end

local meta = FindMetaTable("Player")

function meta:GetRank()
	local level = tonumber(self:GetNetworkedInt("Level"))
	if level >= 0 && level <= 9 then
		return "Private"
	elseif level >= 10 && level <= 14 then
		return "Corporal"
	elseif level >= 15 && level <= 29 then
		return "Sergeant"
	elseif level >= 30 && level <= 39 then
		return "SergeantMajor"
	elseif level >= 40 && level <= 59 then
		return "Lieutenant"
	elseif level >= 60 && level <= 89 then
		return "Captain"
	elseif level >= 90 then
		return "Major"
	end
	
end
