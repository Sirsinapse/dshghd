local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))() --Booting Lib

local Window = OrionLib:MakeWindow({Name = "Nihon Hub | Driving Innovation", HidePremium = false, SaveConfig = true, ConfigFolder = "NihonHub"})
--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

OrionLib:MakeNotification({
	Name = "Welcome!",
	Content = "Nihon Hub has loaded now have fun!",
	Image = "rbxassetid://4483345998",
	Time = 5
})
--[[
Title = <string> - The title of the notification.
Content = <string> - The content of the notification.
Image = <string> - The icon of the notification.
Time = <number> - The duration of the notfication.
]]

local Tab = Window:MakeTab({
	Name = "Hubs",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Games = Window:MakeTab({
	Name = "Games",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Uni = Window:MakeTab({
	Name = "Universal/Fe",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

Tab:AddButton({
	Name = "Solara Hub",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/samuraa1/Solara-Hub/refs/heads/main/Solara%20Hub.lua"))()
  	end    
})
Tab:AddButton({
	Name = "Forge Hub",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua"))()
  	end    
})
Games:AddButton({
	Name = "Arsenal *OP*",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/YesMrSkiv/ayvee/refs/heads/main/main.lua"))()
  	end    
})
Games:AddButton({
	Name = "Centaura *OP*",
	Callback = function()
      		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/509eeeb9181f964f10613ce257174482.lua"))()
  	end    
})
Games:AddButton({
	Name = "Rivals",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/zenzon23/ONYX-HUB23/refs/heads/main/onyx%20hub"))() 
  	end    
})
Games:AddButton({
	Name = "Murder Mystery 2",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/vertex-peak/vertex/refs/heads/main/loadstring"))()
  	end    
})
Games:AddButton({
	Name = "Murderers Vs Sheriffs",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/alan11ago/Hub/refs/heads/main/ImpHub.lua'))()
  	end    
})
Games:AddButton({
	Name = "Dahood *Zinc*",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/lukee5644/lukee5644/refs/heads/main/Lascko's%20SB%20gui",true))()
  	end    
})
Games:AddButton({
	Name = "Slap Battle",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/Zinzs/luascripting/main/canyoutellitsadahoodscriptornot.lua'))()
  	end    
})
Games:AddButton({
	Name = "Infectious Smile",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/cyhysobad/cyhyhub/main/loader.lua"))()
  	end    
})
--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

-- Local Player Fe Logic and UI
local speeded = 16 -- Initialize default speed
local player = game.Players.LocalPlayer -- Define player
Uni:AddToggle({
	Name = "Enable Speed",
	Default = false,
	Callback = function(Value)
		if player.Character and player.Character:FindFirstChild("Humanoid") then
			if Value then
				player.Character.Humanoid.WalkSpeed = speeded
			else
				player.Character.Humanoid.WalkSpeed = 16 -- Reset to default speed
			end
		end
	end    
})
Uni:AddSlider({
	Name = "Speed",
	Min = 10,
	Max = 200,
	Default = 16,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "Speed Value",
	Callback = function(Value)
		speeded = Value -- Update the speed value
		print("Speed set to:", Value)
		if player.Character and player.Character:FindFirstChild("Humanoid") then
			player.Character.Humanoid.WalkSpeed = Value
		end
	end    
})
local player = game.Players.LocalPlayer
local flying = false -- Keeps track of flight status
local flySpeed = 50 -- Set flight speed
local function startFlying()
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		local hrp = player.Character.HumanoidRootPart

		-- Create BodyVelocity for flight
		local bodyVelocity = Instance.new("BodyVelocity")
		bodyVelocity.Velocity = Vector3.new(0, 0, 0)
		bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
		bodyVelocity.Parent = hrp

		-- Update the velocity for flight controls
		game:GetService("RunService").RenderStepped:Connect(function()
			if flying then
				local camera = workspace.CurrentCamera
				local direction = Vector3.zero

				if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
					direction += camera.CFrame.LookVector
				end
				if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
					direction -= camera.CFrame.LookVector
				end
				if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
					direction -= camera.CFrame.RightVector
				end
				if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
					direction += camera.CFrame.RightVector
				end
				if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
					direction += Vector3.new(0, 1, 0)
				end
				if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
					direction -= Vector3.new(0, 1, 0)
				end

				bodyVelocity.Velocity = direction.Unit * flySpeed
			end
		end)
	end
end
local function stopFlying()
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		local hrp = player.Character.HumanoidRootPart
		if hrp:FindFirstChildOfClass("BodyVelocity") then
			hrp:FindFirstChildOfClass("BodyVelocity"):Destroy()
		end
	end
end
Uni:AddToggle({
	Name = "Flight",
	Default = false,
	Callback = function(Value)
		flying = Value
		if flying then
			startFlying()
		else
			stopFlying()
		end
	end
})
local player = game.Players.LocalPlayer
local godmode = false
local function enableGodmode()
	if player.Character and player.Character:FindFirstChild("Humanoid") then
		local humanoid = player.Character.Humanoid

		-- Prevent health from decreasing
		humanoid:GetPropertyChangedSignal("Health"):Connect(function()
			if godmode then
				humanoid.Health = humanoid.MaxHealth
			end
		end)

		-- Ensure health is fully restored
		humanoid.Health = humanoid.MaxHealth
	end
end
local function disableGodmode()
	if player.Character and player.Character:FindFirstChild("Humanoid") then
		local humanoid = player.Character.Humanoid
		-- No need to reset signals; just stop preventing health changes
		print("Godmode Disabled")
	end
end
Uni:AddToggle({
	Name = "Godmode",
	Default = false,
	Callback = function(Value)
		godmode = Value
		if godmode then
			enableGodmode()
		else
			disableGodmode()
		end
	end
})




OrionLib:Init() -- End of code
