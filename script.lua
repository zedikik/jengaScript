if not _G.autoTp then
	_G.autoTp = false
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = "Blocks & Props Script",
	Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
	LoadingTitle = "Interface",
	LoadingSubtitle = "by skuff",
	Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "Big Hub"
	},

	Discord = {
		Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
		Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
		RememberJoins = false -- Set this to false to make them join the discord every time they load it up
	},

	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
		Title = "Untitled",
		Subtitle = "Key System",
		Note = "Key is skuff", -- Use this to tell the user how to get a key
		FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = {"SKUFF", "skuff", "Skuff", "SKUF", "Skuf", "skuf"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
	}
})

local Tab = Window:CreateTab("Main", "rewind")

local Section = Tab:CreateSection("Main")

local Button = Tab:CreateButton({
	Name = "Delete KillBrick",
	Callback = function()
		if workspace.Map.Classic:FindFirstChild("KillBrick") then
			workspace.Map.Classic:FindFirstChild("KillBrick"):Destroy()
		end
	end,
})
local Button = Tab:CreateButton({
	Name = "Delete SpectatorArea",
	Callback = function()
		if workspace.Map.Classic.SpectatorArea:FindFirstChild("Area") then
			workspace.Map.Classic.SpectatorArea:FindFirstChild("Area"):Destroy()
		end
	end,
})
local Button = Tab:CreateButton({
	Name = "Delete all Jenga Parts",
	Callback = function()
		for i, v in pairs(workspace.Map.Classic.Tower:GetChildren()) do
			v:Destroy()
		end
	end,
})
local Button = Tab:CreateButton({
	Name = "Prop Spawn Area retech",
	Callback = function()
		if workspace.Map.Classic.Shooter:FindFirstChild("PARTSPAWNAREA") then
			workspace.Map.Classic.Shooter:FindFirstChild("PARTSPAWNAREA").Transparency = 0.45
			workspace.Map.Classic.Shooter:FindFirstChild("PARTSPAWNAREA").CanCollide = false
			workspace.Map.Classic.Shooter:FindFirstChild("PARTSPAWNAREA").Size = Vector3.new(2048, 2, 2048)
			workspace.Map.Classic.Shooter:FindFirstChild("PARTSPAWNAREA").CFrame = CFrame.new(9, 225, -16)
		end
	end,
})
local Toggle = Tab:CreateToggle({
	Name = "Auto Teleport To Button",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		_G.autoTp = Value
	end,
})

local Keybind = Tab:CreateKeybind({
	Name = "Teleport To Button Bind",
	CurrentKeybind = "Z",
	HoldToInteract = false,
	Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Keybind)
		if game.Players.LocalPlayer.Team.Name == "Towers" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.Classic.Button.CFrame  
		end
	end,
})

game["Run Service"].Heartbeat:Connect(function()
	if _G.autoTp == true then
		if game.Players.LocalPlayer.Team.Name == "Towers" then
			if not game.Teams.Destroyer:GetPlayers()[1]:IsFriendsWith(game.Players.LocalPlayer) then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.Classic.Button.CFrame  
			end
		end
	end
end)
