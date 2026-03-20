-- ================================================================
-- DECOMPILED GAME SCRIPTS
-- Game:    Ugc
-- PlaceId: 124473577469410
-- Scripts: 191
-- ================================================================


-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.initClient
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Packages.Knit)
local v_u_4 = require(v2.Shared.LoadingStatus)
v_u_3.PlayerGui = v1.LocalPlayer:WaitForChild("PlayerGui")
v_u_3.Components = script.Parent.Components
v_u_3.UIComponents = v_u_3.Components.UIComponents
v_u_3.AddControllersDeep(script.Parent.Controllers)
v_u_3.Start({
	["ServicePromises"] = false
}):andThen(function()
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v_u_5 = v_u_3.GetService("AnalyticsService")
	task.spawn(function()
		-- upvalues: (ref) v_u_4, (copy) v_u_5
		v_u_4:WhenFinished(function()
			-- upvalues: (ref) v_u_5
			v_u_5:OnFinishLoading()
		end)
	end)
end):catch(warn)
for _, v6 in ipairs(script.Parent.Components:GetDescendants()) do
	if v6:IsA("ModuleScript") then
		require(v6)
	end
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.InitCMDR
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = require(v1.Configs.PermissionsConfig)
local v4 = require(v1:WaitForChild("CmdrClient"))
v4:SetActivationKeys({ Enum.KeyCode.F2 })
local v5 = v2.LocalPlayer
if not (v3.ADMINS[v5.UserId] or v3.CREATORS[v5.UserId]) then
	v4:SetEnabled(false)
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.LuckyBlockHPAnimtion
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
game:GetService("ReplicatedStorage"):WaitForChild("BlockAnimtion").OnClientEvent:Connect(function(p_u_2)
	-- upvalues: (copy) v_u_1
	if p_u_2 and (p_u_2:FindFirstChild("OverheadUI") and (p_u_2.OverheadUI:FindFirstChild("HP") and p_u_2.OverheadUI.HP:FindFirstChild("HpFillBackground"))) then
		pcall(function()
			-- upvalues: (ref) v_u_1, (copy) p_u_2
			v_u_1:Create(p_u_2.OverheadUI.HP.HpFillBackground, TweenInfo.new(0.18, Enum.EasingStyle.Linear), {
				["BackgroundColor3"] = Color3.fromRGB(255, 47, 50)
			}):Play()
		end)
		task.spawn(function()
			-- upvalues: (copy) p_u_2, (ref) v_u_1
			task.wait(0.1)
			if p_u_2:FindFirstChild("OverheadUI") and (p_u_2.OverheadUI:FindFirstChild("HP") and p_u_2.OverheadUI.HP:FindFirstChild("HpFillBackground")) then
				pcall(function()
					-- upvalues: (ref) v_u_1, (ref) p_u_2
					v_u_1:Create(p_u_2.OverheadUI.HP.HpFillBackground, TweenInfo.new(0.18, Enum.EasingStyle.Linear), {
						["BackgroundColor3"] = Color3.fromRGB(67, 255, 105)
					}):Play()
				end)
			end
		end)
	end
end)
local v3 = game.ReplicatedStorage.BrainrotModels:GetChildren()
for _, v4 in pairs(v3) do
	if v4:FindFirstChild("Floor") and v4:FindFirstChild("HumanoidRootPart") then
		for _, v5 in pairs(v4:GetChildren()) do
			if v5.Name == "Floor" then
				local v6 = false
				local v7 = v5:FindFirstChild("Attachment")
				v7.Parent = v4:FindFirstChild("HumanoidRootPart")
				if v7 then
					for _, v8 in pairs(v5:GetDescendants()) do
						if v8.ClassName == "Attachment" or v8.ClassName == "ParticleEmitter" then
							v6 = true
							if v8.Name == "ParticleEmitter" then
								v8.Parent = v7
							else
								v8.Parent = v4.HumanoidRootPart
							end
						end
					end
					if v6 then
						v5:Destroy()
					end
				end
			end
		end
	end
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.ContainerPlacementComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("MarketplaceService")
local v4 = require(v1.Packages.Component)
local v_u_5 = require(v1.Packages.Knit)
require(v1.Entities.ContainerEntity)
require(v1.Entities.BrainrotEntity)
require(v1.Configs.BrainrotsConfig)
require(v1.Configs.MonetizationConfig)
require(v1.Shared.RobloxUtils)
local v_u_6 = require(v1.GameShared.ContainerUtils)
require(v1.Modifiers)
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = nil
v_u_5.OnStart():andThen(function()
	-- upvalues: (ref) v_u_7, (copy) v_u_5, (ref) v_u_8, (ref) v_u_9, (ref) v_u_10, (ref) v_u_11
	v_u_7 = v_u_5.GetService("ContainerService")
	v_u_8 = v_u_5.GetController("NotificationController")
	v_u_9 = v_u_5.GetController("ReplicaController")
	v_u_10 = v_u_5.GetController("MonetizationController")
	v_u_11 = v_u_5.GetController("EquipController")
end)
local v12 = v4.new({
	["Tag"] = "Container"
})
function v12.Swap(p13)
	-- upvalues: (copy) v_u_2, (ref) v_u_7
	local v14 = v_u_2.LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
	if v14 and v14:GetAttribute("EntityId") then
		v_u_7:SwapBrainrot(v14:GetAttribute("EntityId"), p13.Instance.Name)
	else
		v_u_7:PickupBrainrot(p13.Instance.Name)
	end
end
function v12.Pickup(p15, _)
	-- upvalues: (ref) v_u_7
	v_u_7:PickupBrainrot(p15.Instance.Name)
end
function v12.Place(p16)
	-- upvalues: (copy) v_u_2, (ref) v_u_8, (ref) v_u_7
	local v17 = v_u_2.LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
	if v17 and v17:GetAttribute("EntityId") then
		v_u_7:Place(v17:GetAttribute("EntityId"), p16.Instance.Name)
	else
		v_u_8:DisplayNotification("Error", "You must hold a brainrot first")
	end
end
function v12.PlaceEntity(p18, p19)
	-- upvalues: (ref) v_u_7
	v_u_7:Place(p19.id, p18.Instance.Name)
end
function v12.HasBrainrot(p20)
	return p20.hasBrainrot
end
function v12._UpdatePrompt(p21)
	-- upvalues: (copy) v_u_6
	if p21.holdingBrainrot then
		if p21.hasBrainrot then
			p21.prompt.Enabled = true
			p21.prompt.ActionText = "Swap"
			return
		elseif v_u_6.ContainerHasModel(p21.Instance) then
			p21.prompt.Enabled = false
		else
			p21.prompt.Enabled = true
			p21.prompt.ActionText = "Place"
		end
	elseif p21.holdingLuckyBlock then
		if p21.hasBrainrot then
			p21.prompt.Enabled = true
			p21.prompt.ActionText = "Swap"
			return
		elseif v_u_6.ContainerHasModel(p21.Instance) then
			p21.prompt.Enabled = false
		else
			p21.prompt.Enabled = true
			p21.prompt.ActionText = "Place"
		end
	elseif p21.hasBrainrot then
		p21.prompt.Enabled = true
		p21.prompt.ActionText = "Pickup"
	else
		p21.prompt.Enabled = false
	end
end
function v12.Start(p_u_22)
	-- upvalues: (copy) v_u_2, (ref) v_u_10, (copy) v_u_3, (ref) v_u_11
	if p_u_22.Instance:GetAttribute("OwnerId") == v_u_2.LocalPlayer.UserId then
		p_u_22.prompt = Instance.new("ProximityPrompt")
		p_u_22.prompt.HoldDuration = 0.25
		p_u_22.prompt.MaxActivationDistance = 10
		p_u_22.prompt.RequiresLineOfSight = false
		p_u_22.prompt.Parent = p_u_22.Instance:WaitForChild("Holder"):WaitForChild("HolderBase")
		p_u_22.hasBrainrot = false
		p_u_22.holdingBrainrot = false
		p_u_22.holdingLuckyBlock = false
		p_u_22.promptTriggeredConnection = p_u_22.prompt.Triggered:Connect(function()
			-- upvalues: (copy) p_u_22, (ref) v_u_10, (ref) v_u_3
			if p_u_22.requiresPurchase then
				v_u_10:ShowPendingPurchase()
				v_u_3:PromptProductPurchase(game.Players.LocalPlayer, p_u_22.purchaseId)
				return
			elseif p_u_22.hasBrainrot and p_u_22.holdingBrainrot then
				p_u_22:Swap()
				return
			elseif p_u_22.hasBrainrot and p_u_22.holdingLuckyBlock then
				p_u_22:Swap()
				return
			elseif p_u_22.hasBrainrot then
				p_u_22:Pickup()
			else
				p_u_22:Place()
			end
		end)
		local v23 = p_u_22.Instance:WaitForChild("InnerModel"):GetChildren()
		if #v23 > 0 and v23[1]:HasTag("Brainrot") then
			p_u_22.hasBrainrot = true
		end
		p_u_22.childAddedConnection = p_u_22.Instance:WaitForChild("InnerModel").ChildAdded:Connect(function(p24)
			-- upvalues: (copy) p_u_22
			if p24:HasTag("Brainrot") then
				p_u_22.hasBrainrot = true
				p_u_22:_UpdatePrompt()
			end
		end)
		p_u_22.childRemovedConnection = p_u_22.Instance:WaitForChild("InnerModel").ChildRemoved:Connect(function(p25)
			-- upvalues: (copy) p_u_22
			if p25:HasTag("Brainrot") then
				p_u_22.hasBrainrot = false
				p_u_22:_UpdatePrompt()
			end
		end)
		local v26 = v_u_11:GetTool()
		if v26 and v26:HasTag("BrainrotTool") then
			p_u_22.holdingBrainrot = true
		elseif v26 and v26:HasTag("LuckyBlockTool") then
			p_u_22.holdingLuckyBlock = true
		end
		v_u_11.ToolAdded:Connect(function(p27)
			-- upvalues: (copy) p_u_22
			if p27:HasTag("BrainrotTool") then
				p_u_22.holdingBrainrot = true
				p_u_22:_UpdatePrompt()
			elseif p27:HasTag("LuckyBlockTool") then
				p_u_22.holdingLuckyBlock = true
				p_u_22:_UpdatePrompt()
			end
		end)
		v_u_11.ToolRemoved:Connect(function(p28)
			-- upvalues: (copy) p_u_22
			if p28:HasTag("BrainrotTool") then
				p_u_22.holdingBrainrot = false
				p_u_22:_UpdatePrompt()
			elseif p28:HasTag("LuckyBlockTool") then
				p_u_22.holdingLuckyBlock = false
				p_u_22:_UpdatePrompt()
			end
		end)
		p_u_22:_UpdatePrompt()
	end
end
function v12.Stop(p29)
	if p29.childAddedConnection then
		p29.childAddedConnection:Disconnect()
	end
	if p29.childRemovedConnection then
		p29.childRemovedConnection:Disconnect()
	end
	if p29.promptTriggeredConnection then
		p29.promptTriggeredConnection:Disconnect()
	end
	if p29.replicaConnection then
		p29.replicaConnection:Disconnect()
	end
end
return v12

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.BrainrotAnimationComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
local v2 = require(v1.Packages.Component)
local v_u_3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.Configs.BrainrotsConfig)
require(v1.Shared.AnimationUtils)
local v_u_5 = {}
local v_u_6 = nil
local v_u_7 = nil
v_u_3.OnStart():andThen(function()
	-- upvalues: (ref) v_u_6, (copy) v_u_3, (ref) v_u_7
	v_u_6 = v_u_3.GetController("ReplicaController")
	v_u_7 = v_u_3.GetController("SettingsController")
end)
local v8 = v2.new({
	["Tag"] = "BrainrotAnimation"
})
function v8._InitAnimation(p9)
	-- upvalues: (copy) v_u_5
	local v10 = v_u_5[p9.brainrotType]
	if not v10 then
		v10 = Instance.new("Animation")
		v10.AnimationId = ("rbxassetid://%*"):format(p9.animationId)
		v_u_5[p9.brainrotType] = v10
	end
	p9.animationTrack = p9.Instance:WaitForChild("AnimationController"):WaitForChild("Animator"):LoadAnimation(v10)
	p9.animationTrack:Play()
end
function v8.Start(p_u_11)
	-- upvalues: (copy) v_u_4
	p_u_11.brainrotType = p_u_11.Instance:GetAttribute("BrainrotType")
	local v12 = v_u_4[p_u_11.brainrotType]
	if v12 then
		p_u_11.animationId = v12.idleAnimation
		if p_u_11.animationId then
			if p_u_11.Instance:IsA("Tool") then
				p_u_11.equipConnection = p_u_11.Instance.Equipped:Connect(function()
					-- upvalues: (copy) p_u_11
					if p_u_11.animationTrack and p_u_11.animationTrack.IsPlaying then
						return
					else
						p_u_11:_InitAnimation()
						if p_u_11.animationTrack and not p_u_11.animationTrack.IsPlaying then
							p_u_11.animationTrack:Play()
						end
					end
				end)
				p_u_11.unequipConnection = p_u_11.Instance.Unequipped:Connect(function()
					-- upvalues: (copy) p_u_11
					if p_u_11.animationTrack and p_u_11.animationTrack.IsPlaying then
						if p_u_11.animationTrack then
							p_u_11.animationTrack:Destroy()
							p_u_11.animationTrack = nil
						end
					end
				end)
			else
				p_u_11:_InitAnimation()
			end
		else
			return
		end
	else
		warn((("Could not find brainrot config for %*"):format(p_u_11.brainrotType)))
		return
	end
end
function v8.Stop(p13)
	if p13.replicaConn then
		p13.replicaConn:Disconnect()
		p13.replicaConn = nil
	end
	if p13.equipConnection then
		p13.equipConnection:Disconnect()
		p13.equipConnection = nil
	end
	if p13.unequipConnection then
		p13.unequipConnection:Disconnect()
		p13.unequipConnection = nil
	end
end
return v8

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.LuckyBlockAnimationComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("SoundService")
local v4 = require(v1.Packages.Knit)
local v5 = require(v1.Packages.Component)
local v_u_6 = require(v1.Configs.LuckyBlockConfig)
local v_u_7 = require(v1.Shared.TableUtils)
local v_u_8 = require(v1.GameShared.BrainrotUtils)
require(v1.Shared.RandomUtils)
local v_u_9 = require(v1.Shared.VfxManager)
local v10 = v1:WaitForChild("Assets"):WaitForChild("LuckyBlock")
local v_u_11 = v10:WaitForChild("OpenEvent")
local v_u_12 = v10:WaitForChild("OpenPlaceholder")
local v_u_13 = v1:WaitForChild("BrainrotModels")
local v_u_14 = {}
v4.OnStart():andThen(function()
	-- upvalues: (copy) v_u_11, (copy) v_u_14
	v_u_11.OnClientEvent:Connect(function(p15, p16, p17)
		-- upvalues: (ref) v_u_14
		local v18 = v_u_14[p15]
		if v18 and not v18.isOpening then
			v18.isOpening = true
			v18:OnOpen(p16, p17)
		end
	end)
end)
local v19 = v5.new({
	["Tag"] = "LuckyBlock"
})
local function v_u_31(p20, p21)
	local v22 = p21:GetPivot()
	local v23
	if p21:IsA("Model") then
		local v24
		v24, v23 = p21:GetBoundingBox()
	else
		v23 = p21.Size
	end
	local v25 = v22.Position.Y - v23.Y / 2
	local v26 = p20:GetPivot()
	local v27 = p20:GetExtentsSize()
	local v28 = p20:GetPivot()
	local v29 = v26.Position.Y - v27.Y / 2
	local v30 = v25 + (v28.Position.Y - v29)
	p20:PivotTo(CFrame.new(v22.Position.X, v30, v22.Position.Z) * v22.Rotation)
end
function getTweenDuration(p32, p33)
	return 0.07 + 0.48000000000000004 * (p32 / p33) ^ 7
end
local function v_u_39(p34, p35)
	local v36 = p34:GetPivot()
	local v37 = p34.PrimaryPart.Size
	local v38 = v36.Position.Y - v37.Y / 2 + (p35:IsA("Model") and p35:GetExtentsSize() or p35.Size).Y / 2
	return CFrame.new(v36.Position.X, v38, v36.Position.Z) * v36.Rotation
end
local function v_u_51(p_u_40, p41, p42, p_u_43, p_u_44)
	-- upvalues: (copy) v_u_31, (copy) v_u_2
	local v_u_45 = Instance.new("NumberValue")
	v_u_45.Value = 0.001
	v_u_45.Parent = p_u_40
	local v_u_47 = v_u_45.Changed:Connect(function(p46)
		-- upvalues: (copy) p_u_40, (ref) v_u_31, (copy) p_u_43
		if p46 >= 0 then
			if p_u_40.PrimaryPart or p_u_40:IsA("BasePart") then
				p_u_40:ScaleTo(p46)
				v_u_31(p_u_40, p_u_43)
			end
		end
	end)
	local v48 = v_u_2:Create(v_u_45, p42, {
		["Value"] = p41
	})
	v48:Play()
	local function v_u_49()
		-- upvalues: (copy) v_u_47, (copy) v_u_45, (copy) p_u_40
		v_u_47:Disconnect()
		v_u_45:Destroy()
		if p_u_40 then
			p_u_40:Destroy()
		end
	end
	v48.Completed:Connect(function()
		-- upvalues: (copy) p_u_44, (ref) v_u_2, (copy) v_u_45, (copy) v_u_49, (copy) v_u_47, (copy) p_u_40
		if p_u_44 then
			local v50 = v_u_2:Create(v_u_45, p_u_44, {
				["Value"] = 0.001
			})
			v50:Play()
			v50.Completed:Connect(v_u_49)
		else
			task.wait(0.35)
			v_u_47:Disconnect()
			v_u_45:Destroy()
			if p_u_40 then
				p_u_40:Destroy()
			end
		end
	end)
end
local function v_u_56(p52, p_u_53)
	-- upvalues: (copy) v_u_7
	local v54
	if p_u_53 then
		v54 = v_u_7.Filter(p52, function(p55)
			-- upvalues: (copy) p_u_53
			return not table.find(p_u_53, p55.Name)
		end)
	else
		v54 = p52
	end
	if #v54 ~= 0 then
		p52 = v54
	end
	if #p52 ~= 0 then
		return p52[math.random(1, #p52)]
	end
	warn("No models left after exclusion!")
	return nil
end
function v19.OnOpen(p57, p58, p59)
	-- upvalues: (copy) v_u_39, (copy) v_u_12, (copy) v_u_9, (copy) v_u_13, (copy) v_u_3, (copy) v_u_56, (copy) v_u_8, (copy) v_u_31, (copy) v_u_51
	local v60 = v_u_39(p57.Instance, v_u_12)
	for _, v61 in pairs(p57.Instance:GetDescendants()) do
		if v61:IsA("BasePart") or v61:IsA("Decal") then
			v61.Transparency = 1
		end
	end
	if p57.billboard then
		p57.billboard:Destroy()
	end
	v_u_9.Emit(p57.openVFX, 5)
	v_u_9.Emit(p57.partVFX, 5)
	local v62 = v_u_12:Clone()
	v62.Parent = p57.Instance
	v62:PivotTo(v60)
	local v63 = {}
	if p57.luckyBlockInfo and p57.luckyBlockInfo.items then
		for _, v64 in p57.luckyBlockInfo.items do
			local v65 = v_u_13:FindFirstChild(v64.id)
			if v65 then
				table.insert(v63, v65)
			end
		end
	end
	local v66 = v_u_3.LuckyBlockSounds.Open:Clone()
	v66.Parent = p57.Instance.PrimaryPart
	v66.PlaybackSpeed = 1 + math.random(1, 3) / 10
	v66:Play()
	local v67 = v_u_3.LuckyBlockSounds.Roll:Clone()
	v67.Parent = p57.Instance.PrimaryPart
	local v68 = nil
	for v69 = 1, 10 do
		local v70 = v68 and { v68 } or nil
		if v69 == 10 then
			table.insert(v70, p58)
		end
		local v71 = v_u_56(v63, v70)
		local v72 = v_u_13:FindFirstChild((v_u_8.GetModelName(v71.Name, "NORMAL"))) or v71
		v68 = v71.Name
		local v73 = v72:Clone()
		for _, v74 in ipairs(v73:GetDescendants()) do
			if v74:IsA("SurfaceAppearance") then
				v74:Destroy()
			end
			if v74:IsA("MeshPart") then
				v74.Color = Color3.fromRGB(0, 0, 0)
				v74.TextureID = ""
				v74.Material = "Neon"
			end
		end
		v73:AddTag("BrainrotFakeAnimation")
		v73:SetAttribute("BrainrotType", v71.Name)
		for _, v75 in ipairs(v73:GetChildren()) do
			if v75:IsA("BasePart") then
				v75.Anchored = true
			end
		end
		v73.Parent = v62
		local v76 = v73:GetScale()
		v73:ScaleTo(0.001)
		v_u_31(v73, v62)
		if v67 then
			v67.PlaybackSpeed = 0.9 + math.random(1, 3) / 10
			v67:Play()
		end
		local v77 = getTweenDuration(v69, 10) * 1
		local v78 = v77 * 0.7
		local v79 = v77 * 0.3
		v_u_51(v73, v76, TweenInfo.new(v78, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), v62, (TweenInfo.new(v79, Enum.EasingStyle.Sine, Enum.EasingDirection.In)))
		task.wait(v77 * 0.42)
	end
	local v_u_80 = v_u_3.LuckyBlockSounds.Recive:Clone()
	v_u_80.Parent = p57.Instance.PrimaryPart
	local v81 = v_u_13:FindFirstChild((v_u_8.GetModelName(p58, p59)))
	if v81 then
		local v82 = v81:Clone()
		v82:AddTag("BrainrotFakeAnimation")
		v82:SetAttribute("BrainrotType", p58)
		v82.Parent = v62
		for _, v83 in ipairs(v82:GetDescendants()) do
			if v83:IsA("SurfaceAppearance") then
				v83:Destroy()
			end
			if v83:IsA("MeshPart") then
				v83.Color = Color3.fromRGB(0, 0, 0)
				v83.TextureID = ""
				v83.Material = "Neon"
			end
		end
		for _, v84 in ipairs(v82:GetChildren()) do
			if v84:IsA("BasePart") then
				v84.Anchored = true
			end
		end
		local v85 = v82:GetScale()
		v82:ScaleTo(0.001)
		v_u_31(v82, v62)
		task.delay(0.69, function()
			-- upvalues: (copy) v_u_80
			if v_u_80 then
				v_u_80.PlaybackSpeed = 1 + math.random(1, 4) / 10
				v_u_80:Play()
			end
		end)
		v_u_51(v82, v85, TweenInfo.new(getTweenDuration(1, 1) * 2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), v62)
	end
end
function v19.Construct(p86)
	-- upvalues: (copy) v_u_6, (copy) v_u_14
	p86.luckyBlockType = p86.Instance:GetAttribute("LuckyBlockType")
	p86.luckyBlockMutation = p86.Instance:GetAttribute("LuckyBlockMutation")
	p86.isOpening = false
	p86.hrp = p86.Instance:WaitForChild("HumanoidRootPart")
	p86.openVFX = p86.Instance.VFX:WaitForChild("OpenVFX")
	p86.partVFX = p86.Instance:WaitForChild("VFX")
	p86.luckyBlockInfo = v_u_6.LUCKY_BLOCKS[p86.luckyBlockType]
	p86.billboard = p86.Instance:WaitForChild("OverheadUI")
	p86.billboard:WaitForChild("NameLabel").Text = p86.luckyBlockInfo.name
	v_u_14[p86.Instance] = p86
end
function v19.Start(p87)
	if p87.Instance:GetAttribute("IsOpening") then
		p87.isOpening = true
		for _, v88 in pairs(p87.Instance:GetDescendants()) do
			if v88:IsA("BasePart") or v88:IsA("Decal") then
				v88.Transparency = 1
			end
		end
		if p87.billboard then
			p87.billboard:Destroy()
		end
	end
end
function v19.Stop(p89)
	-- upvalues: (copy) v_u_14
	v_u_14[p89.Instance] = nil
end
return v19

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.HpVisualComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v3 = require(v1.Packages.Component)
local v_u_4 = require(v1.Shared.Janitor)
require(v1.Configs.LuckyBlockConfig)
local v_u_5 = require(v1.Shared.AbbreviationUtils)
local v_u_6 = v1:WaitForChild("Assets"):WaitForChild("Hp"):WaitForChild("OverheadUI")
local v7 = v3.new({
	["Tag"] = "Hp"
})
function v7.SetEnalbled(p8, p9)
	p8.billboard:WaitForChild("HP").Visible = p9
end
function v7._UpdateBillboard(p_u_10, p11)
	-- upvalues: (copy) v_u_5, (copy) v_u_2
	local v12 = p_u_10.Instance:GetAttribute("Hp")
	local v13 = p_u_10.Instance:GetAttribute("MaxHp")
	if p_u_10.Instance:GetAttribute("HideIfFull") and v12 == v13 then
		p_u_10:SetEnalbled(false)
	else
		p_u_10:SetEnalbled(true)
	end
	local v14 = p_u_10.billboard:WaitForChild("HP")
	local v_u_15 = v14:WaitForChild("HpFillBackground")
	local v16 = v14:WaitForChild("HpLabel")
	v_u_15.Size = UDim2.fromScale(v12 / v13, 1)
	v16.Text = ("%*/%*"):format(v_u_5:AbbreviateNumber(v12, 2), (v_u_5:AbbreviateNumber(v13, 2)))
	if p11 then
		if not p_u_10.inTween then
			p_u_10.inTween = v_u_2:Create(v_u_15, TweenInfo.new(0.18, Enum.EasingStyle.Linear), {
				["BackgroundColor3"] = Color3.fromRGB(255, 47, 50)
			})
		end
		p_u_10.inTween.Completed:Connect(function()
			-- upvalues: (copy) p_u_10, (ref) v_u_2, (copy) v_u_15
			if not p_u_10.outTween then
				p_u_10.outTween = v_u_2:Create(v_u_15, TweenInfo.new(0.18, Enum.EasingStyle.Linear), {
					["BackgroundColor3"] = Color3.fromRGB(67, 255, 105)
				})
			end
			p_u_10.outTween:Play()
		end)
		p_u_10.inTween:Play()
	end
end
function v7.Construct(p17)
	-- upvalues: (copy) v_u_4, (copy) v_u_6
	p17._janitor = v_u_4.new()
	local v18 = p17.Instance
	p17.oldHp = tonumber(v18:GetAttribute("Hp")) or 0
	local v19 = v_u_6:Clone()
	v19.Parent = p17.Instance
	v19.Adornee = p17.Instance
	p17.billboard = v19
	p17._janitor:Add(v19, "Destroy")
end
function v7.Start(p_u_20)
	p_u_20.hpConn = p_u_20.Instance:GetAttributeChangedSignal("Hp"):Connect(function()
		-- upvalues: (copy) p_u_20
		local _ = p_u_20.oldHp
		local v21 = p_u_20.Instance:GetAttribute("Hp")
		p_u_20:_UpdateBillboard(v21 ~= p_u_20.Instance:GetAttribute("MaxHp"))
		p_u_20.oldHp = v21
	end)
	p_u_20:_UpdateBillboard()
end
function v7.Stop(p22)
	p22._janitor:Cleanup()
	if p22.inTween then
		p22.inTween:Cancel()
		p22.inTween:Destroy()
	end
	if p22.outTween then
		p22.outTween:Cancel()
		p22.outTween:Destroy()
	end
	if p22.hpConn then
		p22.hpConn:Disconnect()
		p22.hpConn = nil
	end
end
return v7

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.SignPlaceholderComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("TweenService")
local v4 = require(v1.Packages.Component)
local v_u_5 = require(v1.Packages.Knit)
local v_u_6 = require(v1.Configs.ContainersConfig)
local v_u_7 = require(v1.Shared.TableUtils)
local v_u_8 = require(v1.Shared.RobloxUtils)
local v_u_9 = require(v1.Shared.AbbreviationUtils)
local v_u_10 = v1.Assets.Plot.UpgradeSignTemplate
local v_u_11 = require(v1.Shared.VfxManager)
local v_u_12 = v1.Assets.BuyVFX
local v_u_13 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local v_u_14 = nil
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = nil
v_u_5.OnStart():andThen(function()
	-- upvalues: (ref) v_u_14, (copy) v_u_5, (ref) v_u_17, (ref) v_u_16, (ref) v_u_15
	v_u_14 = v_u_5.GetController("ReplicaController")
	v_u_17 = v_u_5.GetController("SoundController")
	v_u_16 = v_u_5.GetService("ContainerService")
	v_u_15 = require(v_u_5.UIComponents.Button)
end)
local v18 = v4.new({
	["Tag"] = "SignPlaceholder"
})
function v18.AnimateSign(p19)
	-- upvalues: (copy) v_u_3, (copy) v_u_13
	p19:StopAnimation()
	p19.finishIndicator.Transparency = 0
	p19.finishIndicator.Position = p19.originalFinishIndicatorPos
	local v20 = {
		["Position"] = p19.originalFinishIndicatorPos + Vector3.new(0, 1.2, 0)
	}
	p19.floatTween = v_u_3:Create(p19.finishIndicator, v_u_13, v20)
	p19.floatTween:Play()
end
function v18.StopAnimation(p21)
	if p21.floatTween then
		p21.floatTween:Cancel()
		p21.floatTween = nil
	end
	p21.finishIndicator.Transparency = 1
end
function v18.CanBuy(_)
	-- upvalues: (ref) v_u_14, (copy) v_u_6
	local v22 = v_u_14:GetPlayerData()
	local v23 = v22.ContainerUnlockIndex
	local v24 = v_u_6.containers[v23 + 1]
	if not v24 then
		return false
	end
	local v25 = v24.price
	return v22.Currencies.Cash - v25 >= 0
end
function v18.CheckAnimation(p26, p27)
	local v28 = p26:CanBuy()
	if v28 == p26.canBuy and not p27 then
		return
	else
		p26.canBuy = v28
		if v28 then
			p26:AnimateSign()
		else
			p26:StopAnimation()
		end
	end
end
function v18.InitGui(p_u_29)
	-- upvalues: (ref) v_u_14, (copy) v_u_6, (copy) v_u_7, (copy) v_u_9, (ref) v_u_15, (ref) v_u_16, (copy) v_u_11, (ref) v_u_17
	local v30 = p_u_29.gui:WaitForChild("BuyMax")
	local v_u_31 = v30:WaitForChild("OFF_UIGradient")
	local v_u_32 = v30:WaitForChild("ON_UIGradient")
	local v_u_33 = v30:WaitForChild("Base")
	local v_u_34 = v_u_33:WaitForChild("Base")
	local v_u_35 = v30:WaitForChild("Cash")
	local v_u_36 = v_u_35:WaitForChild("Cash")
	local function v_u_41()
		-- upvalues: (ref) v_u_14, (ref) v_u_7, (ref) v_u_6, (ref) v_u_9, (copy) v_u_33, (copy) v_u_34, (copy) v_u_35, (copy) v_u_36
		local v37 = v_u_14:GetPlayerData().ContainerUnlockIndex
		local v38 = ("%*/%*"):format(v37, (v_u_7.GetLength(v_u_6.containers)))
		local v39 = v_u_6.containers[v37 + 1]
		local v40 = not v39 and "Max" or ("$%*"):format((v_u_9:AbbreviateNumber(v39.price)))
		v_u_33.Text = v38
		v_u_34.Text = v38
		v_u_35.Text = v40
		v_u_36.Text = v40
	end
	local v42 = v_u_14:GetPlayerData()
	local v43 = v42.ContainerUnlockIndex
	local v44 = v_u_6.containers[v43 + 1]
	local v45
	if v44 then
		local v46 = v44.price
		v45 = v42.Currencies.Cash - v46 >= 0
	else
		v45 = false
	end
	if v45 then
		v_u_31.Enabled = false
		v_u_32.Enabled = true
	else
		v_u_31.Enabled = true
		v_u_32.Enabled = false
	end
	v_u_41()
	local v47 = v_u_14:GetReplica()
	v47:OnSet({ "ContainerUnlockIndex" }, function()
		-- upvalues: (ref) v_u_14, (ref) v_u_6, (copy) v_u_31, (copy) v_u_32, (copy) v_u_41
		local v48 = v_u_14:GetPlayerData()
		local v49 = v48.ContainerUnlockIndex
		local v50 = v_u_6.containers[v49 + 1]
		local v51
		if v50 then
			local v52 = v50.price
			v51 = v48.Currencies.Cash - v52 >= 0
		else
			v51 = false
		end
		if v51 then
			v_u_31.Enabled = false
			v_u_32.Enabled = true
		else
			v_u_31.Enabled = true
			v_u_32.Enabled = false
		end
		v_u_41()
	end)
	v47:OnSet({ "Currencies", "Cash" }, function()
		-- upvalues: (ref) v_u_14, (ref) v_u_6, (copy) v_u_31, (copy) v_u_32, (copy) v_u_41
		local v53 = v_u_14:GetPlayerData()
		local v54 = v53.ContainerUnlockIndex
		local v55 = v_u_6.containers[v54 + 1]
		local v56
		if v55 then
			local v57 = v55.price
			v56 = v53.Currencies.Cash - v57 >= 0
		else
			v56 = false
		end
		if v56 then
			v_u_31.Enabled = false
			v_u_32.Enabled = true
		else
			v_u_31.Enabled = true
			v_u_32.Enabled = false
		end
		v_u_41()
	end)
	v_u_15:WaitForInstance(v30):andThen(function(p58)
		-- upvalues: (ref) v_u_16, (ref) v_u_11, (copy) p_u_29, (ref) v_u_17
		p58:AddCallback(function()
			-- upvalues: (ref) v_u_16, (ref) v_u_11, (ref) p_u_29, (ref) v_u_17
			if v_u_16:BuyContainer() then
				v_u_11.Emit(p_u_29.buyVfx)
				v_u_17:PlaySound("CollectCash")
			end
		end)
	end)
end
function v18.Start(p_u_59)
	-- upvalues: (copy) v_u_10, (copy) v_u_12, (copy) v_u_8, (copy) v_u_2, (ref) v_u_14
	local v_u_60 = p_u_59.Instance.Parent.Parent
	local function v_u_63()
		-- upvalues: (ref) v_u_10, (copy) p_u_59, (ref) v_u_12, (ref) v_u_8, (ref) v_u_2, (ref) v_u_14
		local v61 = v_u_10:Clone()
		v61:PivotTo(p_u_59.Instance:GetPivot())
		p_u_59.buyVfx = v_u_12:Clone()
		v_u_8:PivotToPlaceholder(p_u_59.buyVfx, v61.Leaderboard)
		p_u_59.buyVfx.PrimaryPart.Transparency = 1
		p_u_59.buyVfx.Parent = v61
		v61.Parent = p_u_59.Instance
		p_u_59.gui = v61.Leaderboard.SurfaceGui
		p_u_59.gui.Parent = v_u_2.LocalPlayer.PlayerGui.Effects
		p_u_59.finishIndicator = v61:WaitForChild("FinishedCraftIndicator")
		p_u_59.originalFinishIndicatorPos = p_u_59.finishIndicator.Position
		p_u_59.canBuy = false
		p_u_59:CheckAnimation(true)
		local v62 = v_u_14:GetReplica()
		p_u_59.conn1 = v62:OnSet({ "ContainerUnlockIndex" }, function()
			-- upvalues: (ref) p_u_59
			p_u_59:CheckAnimation()
		end)
		p_u_59.conn2 = v62:OnSet({ "Currencies", "Cash" }, function()
			-- upvalues: (ref) p_u_59
			p_u_59:CheckAnimation()
		end)
		p_u_59:InitGui()
	end
	if v_u_60:GetAttribute("Owner") == v_u_2.LocalPlayer.UserId then
		v_u_63()
	else
		p_u_59.ownerConn = v_u_60:GetAttributeChangedSignal("Owner"):Connect(function()
			-- upvalues: (copy) v_u_60, (ref) v_u_2, (copy) p_u_59, (copy) v_u_63
			if v_u_60:GetAttribute("Owner") == v_u_2.LocalPlayer.UserId then
				if p_u_59.ownerConn then
					p_u_59.ownerConn:Disconnect()
					p_u_59.ownerConn = nil
				end
				v_u_63()
			end
		end)
	end
end
function v18.Stop(p64)
	if p64.conn1 then
		p64.conn1:Disconnect()
		p64.conn1 = nil
	end
	if p64.conn2 then
		p64.conn2:Disconnect()
		p64.conn2 = nil
	end
	if p64.floatTween then
		p64.floatTween:Cancel()
		p64.floatTween = nil
	end
end
return v18

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.FloatingPlotSignComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("Players")
local v2 = require(game.ReplicatedStorage.Packages.Knit)
local v3 = require(game.ReplicatedStorage.Packages.Component)
v2.OnStart():andThen(function() end)
local v4 = v3.new({
	["Tag"] = "FloatingPlotSign"
})
function v4.Construct(p5)
	p5.plotId = nil
	p5.owner = nil
end
function v4.Start(p6)
	-- upvalues: (copy) v_u_1
	local v7 = p6.Instance
	local v8 = p6.Instance.Parent
	local v9 = v8.Parent
	v7.Adornee = v9
	local v10 = v8.Name
	p6.plotId = tonumber(v10)
	p6.owner = v9:GetAttribute("Owner")
	local v11 = p6.owner
	if tonumber(v11) == v_u_1.LocalPlayer.UserId then
		v7.Title.Text = "Your base"
		v7.Name = ("%*_FloatingPlotSign"):format(v_u_1.LocalPlayer.Name)
	elseif p6.owner ~= nil then
		local v12 = v_u_1:GetPlayerByUserId(p6.owner)
		if v12 then
			v7.Title.Text = ("%*\'s Base"):format(v12.Name)
			v7.Name = ("%*_FloatingPlotSign"):format(v12.Name)
			return
		end
		v7.Title.Text = "Base"
	end
end
function v4.Stop(_) end
return v4

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.ZoneComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
game:GetService("TweenService")
require(v1.Shared.SavedDesigns)
local v2 = require(v1.Packages.Component)
local v_u_3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.Zone)
local v_u_5 = nil
local v_u_6 = nil
v_u_3.OnStart():andThen(function()
	-- upvalues: (ref) v_u_5, (copy) v_u_3, (ref) v_u_6
	v_u_5 = v_u_3.GetController("NotificationController")
	v_u_6 = v_u_3.GetController("ChaseController")
end)
local v7 = v2.new({
	["Tag"] = "Zone"
})
TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
UDim2.new(0.5, 0, 0.01, 0)
UDim2.new(0.5, 0, -0.5, 0)
function v7.Construct(p8)
	-- upvalues: (copy) v_u_3
	local _ = v_u_3.PlayerGui
	p8.currentTween = nil
end
function v7.Start(p_u_9)
	-- upvalues: (copy) v_u_4, (ref) v_u_6
	p_u_9.Instance:GetAttribute("ZoneName")
	local v10 = v_u_4.new(p_u_9.Instance)
	p_u_9.enterConn = v10.localPlayerEntered:Connect(function(_)
		-- upvalues: (ref) v_u_6, (copy) p_u_9
		v_u_6:ZoneEntered(p_u_9.Instance.Name)
	end)
	p_u_9.exitConn = v10.localPlayerExited:Connect(function()
		-- upvalues: (ref) v_u_6, (copy) p_u_9
		v_u_6:ZoneExited(p_u_9.Instance.Name)
	end)
end
function v7.Stop(p11)
	if p11.enterConn then
		p11.enterConn:Disconnect()
		p11.enterConn = nil
	end
	if p11.exitConn then
		p11.exitConn:Disconnect()
		p11.exitConn = nil
	end
	if p11.currentTween then
		p11.currentTween:Cancel()
		p11.currentTween = nil
	end
end
return v7

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.BrainrotPickupComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("HttpService")
local v_u_4 = require(v1.Configs.LuckyBlockConfig)
require(v1.Entities.BrainrotEntity)
require(v1.GameShared.BrainrotUtils)
local v_u_5 = require(v1.Packages.Knit)
local v6 = require(v1.Packages.Component)
local v_u_7 = require(v1.Configs.TraitsConfig)
local v_u_8 = require(v1.Configs.MutationConfig)
require(v1.Configs.BrainrotsConfig)
require(v1.Shared.AbbreviationUtils)
local v_u_9 = require(v1.Shared.SavedDesigns)
local v_u_10 = v1:WaitForChild("Assets"):WaitForChild("Brainrot"):WaitForChild("PickableLuckyBillboard")
v1:WaitForChild("Assets"):WaitForChild("Brainrot"):WaitForChild("TraitTemplate")
local v_u_11 = nil
local v_u_12 = nil
local v_u_13 = nil
v_u_5.OnStart():andThen(function()
	-- upvalues: (ref) v_u_11, (copy) v_u_5, (ref) v_u_12, (ref) v_u_13
	v_u_11 = v_u_5.GetService("PickupService")
	v_u_12 = v_u_5.GetController("SoundController")
	v_u_13 = v_u_5.GetController("NotificationController")
end)
local v14 = v6.new({
	["Tag"] = "PickableBrainrot"
})
function v14._OnDespawnTimeChange(p_u_15)
	-- upvalues: (copy) v_u_2
	if p_u_15._despawnRenderConn then
		p_u_15._despawnRenderConn:Disconnect()
		p_u_15._despawnRenderConn = nil
	end
	local v_u_16 = p_u_15.Instance:GetAttribute("DespawnTargetTime")
	if v_u_16 == nil then
		p_u_15.timeLabel.Visible = false
		p_u_15.timeImage.Visible = false
	else
		p_u_15.timeLabel.Visible = true
		p_u_15.timeImage.Visible = true
		p_u_15._despawnRenderConn = v_u_2.RenderStepped:Connect(function()
			-- upvalues: (copy) v_u_16, (copy) p_u_15
			local v17 = v_u_16 - workspace:GetServerTimeNow()
			local v18 = v17 < 0 and 0 or v17
			p_u_15.timeLabel.Text = string.format("%.1fs", v18)
		end)
	end
end
function v14._InitTraitsUI(p19)
	-- upvalues: (copy) v_u_7
	local v20 = p19.billboard:WaitForChild("Traits")
	local v21 = v20:WaitForChild("Template")
	for _, v22 in v20:GetChildren() do
		if v22:IsA("ImageLabel") and v22.Name ~= "Template" then
			v22:Destroy()
		end
	end
	if p19.traits then
		for _, v23 in p19.traits do
			local v24 = v_u_7.TRAITS[v23]
			if v24 then
				local v25 = v21:Clone()
				v25.Name = v23
				v25.Image = ("rbxassetid://%*"):format(v24.image)
				v25.Visible = true
				v25.Parent = v20
			else
				warn((("Could not find trait info for %*"):format(v23)))
			end
		end
	end
end
function v14.Construct(p26)
	-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_9, (copy) v_u_8, (copy) v_u_3
	p26.luckyBlockType = p26.Instance:GetAttribute("LuckyBlockType")
	p26.luckyBlockMutation = p26.Instance:GetAttribute("LuckyBlockMutation")
	p26.luckyBlockInfo = v_u_4.LUCKY_BLOCKS[p26.luckyBlockType]
	local v27 = p26.Instance:WaitForChild("PrimaryPart")
	local v28 = v_u_10:Clone()
	p26.billboard = v28
	v28.BrainrotName.Text = p26.luckyBlockInfo.name
	v28.RarityLabel.Text = p26.luckyBlockInfo.rarity or "Common"
	v_u_9:LoadDesign(p26.luckyBlockInfo.rarity or "Common", v28.RarityLabel)
	if p26.luckyBlockMutation == "NORMAL" then
		v28.Mutation.Visible = false
	else
		v28.Mutation.Text = v_u_8[p26.luckyBlockMutation].name
		v_u_9:LoadDesign(p26.luckyBlockMutation, v28.Mutation)
		v28.Mutation.Visible = true
	end
	p26.traits = {}
	if p26.Instance:GetAttribute("BrainrotTraits") then
		p26.traits = v_u_3:JSONDecode(p26.Instance:GetAttribute("BrainrotTraits") or {})
	end
	p26.timeLabel = v28:WaitForChild("Timer"):WaitForChild("DespawnTime")
	p26.timeImage = v28:WaitForChild("Timer"):WaitForChild("ImageLabel")
	local v29 = p26.Instance:GetExtentsSize().Y * 0.5 + (3 or 1)
	v28.StudsOffsetWorldSpace = Vector3.new(0, v29, 0)
	v28.Adornee = v27
	v28.Parent = v27
end
function v14.Start(p_u_30)
	-- upvalues: (ref) v_u_11, (ref) v_u_13, (copy) v_u_3
	p_u_30.prompt = Instance.new("ProximityPrompt")
	p_u_30.prompt.RequiresLineOfSight = false
	p_u_30.prompt.HoldDuration = 0.6
	p_u_30.prompt.ActionText = "Steal!"
	p_u_30.conn = p_u_30.prompt.Triggered:Connect(function()
		-- upvalues: (ref) v_u_11, (copy) p_u_30, (ref) v_u_13
		if v_u_11:Pickup(p_u_30.Instance) then
			v_u_13:DisplayNotification("Info", (("You are stealing %*"):format(p_u_30.luckyBlockInfo.name)))
		end
	end)
	p_u_30.prompt.Parent = p_u_30.Instance
	p_u_30:_InitTraitsUI()
	p_u_30.traitsChangeConn = p_u_30.Instance:GetAttributeChangedSignal("BrainrotTraits"):Connect(function()
		-- upvalues: (copy) p_u_30, (ref) v_u_3
		p_u_30.traits = v_u_3:JSONDecode(p_u_30.Instance:GetAttribute("BrainrotTraits") or {})
		p_u_30:_InitTraitsUI()
	end)
	p_u_30:_OnDespawnTimeChange()
	p_u_30.despawnTimeConn = p_u_30.Instance:GetAttributeChangedSignal("DespawnTargetTime"):Connect(function()
		-- upvalues: (copy) p_u_30
		p_u_30:_OnDespawnTimeChange()
	end)
	p_u_30.ownerIdConn = p_u_30.Instance:GetAttributeChangedSignal("OwnerId"):Connect(function()
		-- upvalues: (copy) p_u_30
		if p_u_30.Instance:GetAttribute("OwnerId") == nil then
			p_u_30.prompt.Enabled = true
		else
			p_u_30.prompt.Enabled = false
		end
	end)
end
function v14.Stop(p31)
	if p31.conn then
		p31.conn:Disconnect()
		p31.conn = nil
	end
	if p31.prompt then
		p31.prompt:Destroy()
		p31.prompt = nil
	end
	if p31._despawnRenderConn then
		p31._despawnRenderConn:Disconnect()
		p31._despawnRenderConn = nil
	end
	if p31.ownerIdConn then
		p31.ownerIdConn:Disconnect()
		p31.ownerIdConn = nil
	end
	if p31.despawnTimeConn then
		p31.despawnTimeConn:Disconnect()
		p31.despawnTimeConn = nil
	end
	if p31.billboard then
		p31.billboard:Destroy()
		p31.billboard = nil
	end
	if p31.traitsChangeConn then
		p31.traitsChangeConn:Disconnect()
		p31.traitsChangeConn = nil
	end
end
return v14

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.ContainerUpgradeComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v3 = require(v1.Packages.Component)
local v_u_4 = require(v1.Packages.Knit)
require(v1.Shared.RobloxUtils)
local v_u_5 = require(v1.Shared.AbbreviationUtils)
require(v1.Configs.BrainrotsConfig)
local v_u_6 = require(v1.GameShared.BrainrotUtils)
local v_u_7 = require(v1.GameShared.ContainerUtils)
local v_u_8 = require(v1.Configs.ContainersConfig)
require(v1.Entities.BrainrotEntity)
require(v1.Entities.ContainerEntity)
local v_u_9 = require(v1.Shared.VfxManager)
local v_u_10 = nil
local v_u_11 = nil
local v_u_12 = nil
local v_u_13 = nil
v_u_4.OnStart():andThen(function()
	-- upvalues: (ref) v_u_10, (copy) v_u_4, (ref) v_u_11, (ref) v_u_13, (ref) v_u_12
	v_u_10 = require(v_u_4.UIComponents.Button)
	v_u_11 = v_u_4.GetController("ReplicaController")
	v_u_13 = v_u_4.GetController("SoundController")
	v_u_12 = v_u_4.GetService("ContainerService")
end)
local v14 = v3.new({
	["Tag"] = "Container"
})
function v14._ToggleSign(p15, p16)
	if p15.upgradeGui.Enabled ~= p16 then
		p15.upgradeGui.Enabled = p16
		for _, v17 in p15.Instance:WaitForChild("Upgrade"):GetDescendants() do
			if v17:IsA("BasePart") then
				v17.Transparency = p16 and 0 or 1
			end
		end
	end
end
function v14._UpdateCanBuy(p18)
	-- upvalues: (copy) v_u_6, (ref) v_u_11, (copy) v_u_8
	if p18.upgradeGui and (p18.upgradeGui.Enabled and p18.brainrotEntity) then
		local v19 = p18.brainrotEntity.level
		local v20 = v19 + 1
		if v_u_6.GetLevelUpgradePrice(p18.brainrotEntity.brainrotType, v20) > v_u_11:GetPlayerData().Currencies.Cash or v_u_8.MAX_LEVEL <= v19 then
			p18.offGradient.Enabled = true
			p18.onGradient.Enabled = false
		else
			p18.offGradient.Enabled = false
			p18.onGradient.Enabled = true
		end
	else
		return
	end
end
function v14._UpdateUpgradeUi(p21)
	-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_5
	if p21.brainrotEntity then
		p21:_ToggleSign(true)
		p21.cash.Visible = true
		p21.title.Visible = true
		local v22 = p21.brainrotEntity.level
		local v23 = v22 + 1
		if v_u_8.MAX_LEVEL <= v22 then
			local v24 = ("Level %*"):format(v22)
			p21.title.Text = v24
			p21.title.Base.Text = v24
			p21.cash.Visible = false
			p21.max.Visible = true
		else
			p21.cash.Visible = true
			p21.max.Visible = false
			local v25 = ("$%*"):format((v_u_5:AbbreviateNumber((v_u_6.GetLevelUpgradePrice(p21.brainrotEntity.brainrotType, v23)))))
			p21.cash.Text = v25
			p21.cash.Cash.Text = v25
			local v26 = ("Level %* > Level %*"):format(v22, v23)
			p21.title.Text = v26
			p21.title.Base.Text = v26
		end
		p21:_UpdateCanBuy()
	else
		p21:_ToggleSign(false)
	end
end
function v14._SetupUpgradeGui(p_u_27)
	-- upvalues: (copy) v_u_2, (ref) v_u_10, (ref) v_u_12, (copy) v_u_9, (ref) v_u_13
	p_u_27.upgradeGui.Adornee = p_u_27.upgradeGui.Parent
	p_u_27.upgradeGui.Parent = v_u_2.LocalPlayer.PlayerGui.Effects
	p_u_27.button = p_u_27.upgradeGui:WaitForChild("BuyMax")
	p_u_27.offGradient = p_u_27.button:WaitForChild("OFF_UIGradient")
	p_u_27.onGradient = p_u_27.button:WaitForChild("ON_UIGradient")
	p_u_27.cash = p_u_27.button:WaitForChild("Cash")
	p_u_27.max = p_u_27.button:WaitForChild("MAX")
	p_u_27.title = p_u_27.button:WaitForChild("Base")
	p_u_27:_UpdateUpgradeUi()
	p_u_27:_UpdateCanBuy()
	v_u_10:WaitForInstance(p_u_27.button):andThen(function(p28)
		-- upvalues: (ref) v_u_12, (copy) p_u_27, (ref) v_u_9, (ref) v_u_13
		p28:AddCallback(function()
			-- upvalues: (ref) v_u_12, (ref) p_u_27, (ref) v_u_9, (ref) v_u_13
			if v_u_12:UpgradeBrainrot(p_u_27.containerId) then
				v_u_9.Emit(p_u_27.buyVfx)
				v_u_13:PlaySound("CollectCash")
			end
		end)
	end)
end
function v14.Start(p_u_29)
	-- upvalues: (copy) v_u_2, (ref) v_u_11, (copy) v_u_7
	p_u_29.player = v_u_2:GetPlayerByUserId(p_u_29.Instance:GetAttribute("OwnerId"))
	if p_u_29.player == v_u_2.LocalPlayer then
		p_u_29.buyVfx = p_u_29.Instance:WaitForChild("BuyVFX")
		p_u_29.containerId = p_u_29.Instance:GetAttribute("ContainerId")
		p_u_29.upgradeGui = p_u_29.Instance:WaitForChild("Upgrade"):WaitForChild("CollectionPad"):WaitForChild("SurfaceGui")
		local v30 = v_u_11:GetPlayerData().Containers[p_u_29.containerId]
		if v30 and v30.brainrot then
			if v_u_7.GetInnerType(v30.brainrot) == "brainrot" then
				p_u_29.brainrotEntity = v30.brainrot
			else
				p_u_29.brainrotEntity = nil
			end
		end
		p_u_29:_SetupUpgradeGui()
		local v31 = v_u_11:GetReplica()
		p_u_29.conn = v31:OnSet({ "Containers", p_u_29.containerId }, function(p32)
			-- upvalues: (ref) v_u_7, (copy) p_u_29
			if p32.brainrot and v_u_7.GetInnerType(p32.brainrot) == "brainrot" then
				p_u_29.brainrotEntity = p32.brainrot
			else
				p_u_29.brainrotEntity = nil
			end
			p_u_29:_UpdateUpgradeUi()
		end)
		p_u_29.cashConn = v31:OnSet({ "Currencies", "Cash" }, function()
			-- upvalues: (copy) p_u_29
			p_u_29:_UpdateCanBuy()
		end)
	else
		p_u_29.Instance:WaitForChild("Upgrade"):Destroy()
	end
end
function v14.Stop(p33)
	if p33.conn then
		p33.conn:Disconnect()
		p33.conn = nil
	end
	if p33.cashConn then
		p33.cashConn:Disconnect()
		p33.cashConn = nil
	end
end
return v14

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.BrainrotFakeAnimationComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
local v2 = require(v1.Packages.Component)
local v_u_3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.Configs.BrainrotsConfig)
require(v1.Shared.AnimationUtils)
local v_u_5 = {}
local v_u_6 = nil
v_u_3.OnStart():andThen(function()
	-- upvalues: (ref) v_u_6, (copy) v_u_3
	v_u_6 = v_u_3.GetController("SettingsController")
end)
local v7 = v2.new({
	["Tag"] = "BrainrotFakeAnimation"
})
function v7._InitVfx(p8)
	for _, v9 in p8.Instance:GetDescendants() do
		if v9:IsA("ParticleEmitter") and (not v9.Parent or v9.Parent.Name ~= "CollectVFX") then
			v9.Transparency = NumberSequence.new(1)
		end
	end
end
function v7._InitAnimation(p10)
	-- upvalues: (copy) v_u_5
	local v11 = v_u_5[p10.brainrotType]
	if not v11 then
		v11 = Instance.new("Animation")
		v11.AnimationId = ("rbxassetid://%*"):format(p10.animationId)
		v_u_5[p10.brainrotType] = v11
	end
	p10.animationTrack = p10.Instance:WaitForChild("AnimationController"):WaitForChild("Animator"):LoadAnimation(v11)
	p10.animationTrack:Play()
	p10.animationTrack:AdjustSpeed(0)
end
function v7.Start(p12)
	-- upvalues: (copy) v_u_4
	p12.brainrotType = p12.Instance:GetAttribute("BrainrotType")
	local v13 = v_u_4[p12.brainrotType]
	if v13 then
		p12.animationId = v13.idleAnimation
		if p12.animationId then
			p12:_InitAnimation()
			p12:_InitVfx()
		end
	else
		warn((("Could not find brainrot config for %*"):format(p12.brainrotType)))
		return
	end
end
function v7.Stop(_) end
return v7

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.ContainerAnimationComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("TweenService")
local v4 = require(v1.Packages.Component)
local v_u_5 = require(v1.Packages.Knit)
local v_u_6 = require(v1.Shared.VfxManager)
local v_u_7 = require(v1.Shared.AbbreviationUtils)
local v_u_8 = nil
local v_u_9 = nil
v_u_5.OnStart():andThen(function()
	-- upvalues: (ref) v_u_8, (copy) v_u_5, (ref) v_u_9
	v_u_8 = v_u_5.GetController("SoundController")
	v_u_9 = v_u_5.GetController("ReplicaController")
end)
local v10 = v4.new({
	["Tag"] = "Container"
})
function v10._PlayBounceEffect(p11)
	-- upvalues: (copy) v_u_3
	local v12 = p11.brainrot.PrimaryPart
	local v13 = v12.CFrame
	local v14 = v13 + Vector3.new(0, 3, 0)
	local v15 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local v16 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
	local v17 = v_u_3:Create(v12, v15, {
		["CFrame"] = v14
	})
	local v_u_18 = v_u_3:Create(v12, v16, {
		["CFrame"] = v13
	})
	v17:Play()
	v17.Completed:Connect(function()
		-- upvalues: (copy) v_u_18
		v_u_18:Play()
	end)
end
function v10._PlayCashEffect(p19)
	-- upvalues: (ref) v_u_8, (copy) v_u_6
	v_u_8:PlaySound("CollectCash")
	v_u_6.Emit(p19.collectVfx)
end
function v10._OnCollect(p_u_20, p21)
	-- upvalues: (copy) v_u_2
	if p_u_20.brainrot then
		if p_u_20.cash == 0 then
			return
		else
			local v22 = p_u_20.Instance
			local v23 = v_u_2:GetPlayerFromCharacter(p21.Parent)
			if v23 then
				if v22:GetAttribute("OwnerId") == v23.UserId then
					if not p_u_20.collectDebounce then
						p_u_20.collectDebounce = task.delay(1, function()
							-- upvalues: (copy) p_u_20
							if p_u_20.collectDebounce then
								p_u_20.collectDebounce = nil
							end
						end)
						p_u_20:_PlayBounceEffect()
						p_u_20:_PlayCashEffect()
						p_u_20.cash = 0
						p_u_20.cashLabel.Text = "$0"
					end
				else
					return
				end
			else
				return
			end
		end
	else
		return
	end
end
function v10.UpdateCash(p24, p25)
	-- upvalues: (copy) v_u_7
	p24.cash = p25
	p24.cashLabel.Text = ("$%*"):format((v_u_7:AbbreviateNumber(p25)))
end
function v10.Start(p_u_26)
	-- upvalues: (copy) v_u_2, (ref) v_u_9
	if p_u_26.Instance:GetAttribute("OwnerId") == v_u_2.LocalPlayer.UserId then
		p_u_26.collectionPad = p_u_26.Instance:WaitForChild("Collection"):WaitForChild("CollectionPad")
		p_u_26.cashLabel = p_u_26.collectionPad:WaitForChild("SurfaceGui"):WaitForChild("CashLabel")
		p_u_26.collectVfx = p_u_26.Instance:WaitForChild("CollectVFX")
		p_u_26.containerId = p_u_26.Instance.Name
		p_u_26.conn = p_u_26.collectionPad.Touched:Connect(function(p27)
			-- upvalues: (copy) p_u_26
			p_u_26:_OnCollect(p27)
		end)
		local v28 = p_u_26.Instance:WaitForChild("InnerModel"):GetChildren()
		if #v28 > 0 and v28[1]:HasTag("Brainrot") then
			p_u_26.brainrot = v28[1]
			p_u_26.cashLabel.Visible = true
			p_u_26.collectionPad.Color = Color3.fromRGB(64, 203, 0)
			local v29 = v_u_9:GetPlayerData().Containers[p_u_26.containerId]
			if v29 then
				p_u_26:UpdateCash(v29.cash)
			end
		end
		p_u_26.childAddedConn = p_u_26.Instance:WaitForChild("InnerModel").ChildAdded:Connect(function(p30)
			-- upvalues: (copy) p_u_26
			if p30:HasTag("Brainrot") then
				p_u_26.brainrot = p30
				p_u_26.cashLabel.Visible = true
				p_u_26.collectionPad.Color = Color3.fromRGB(64, 203, 0)
			end
		end)
		p_u_26.childRemovedConn = p_u_26.Instance:WaitForChild("InnerModel").ChildRemoved:Connect(function(p31)
			-- upvalues: (copy) p_u_26
			if p31:HasTag("Brainrot") then
				p_u_26.brainrot = nil
				p_u_26.cashLabel.Visible = false
				p_u_26.collectionPad.Color = Color3.fromRGB(115, 115, 115)
				p_u_26:_PlayCashEffect()
			end
		end)
	end
end
function v10.Stop(p32)
	if p32.conn then
		p32.conn:Disconnect()
		p32.conn = nil
	end
	if p32.childAddedConn then
		p32.childAddedConn:Disconnect()
		p32.childAddedConn = nil
	end
	if p32.childRemovedConn then
		p32.childRemovedConn:Disconnect()
		p32.childRemovedConn = nil
	end
	if p32.collectDebounce then
		task.cancel(p32.collectDebounce)
		p32.collectDebounce = nil
	end
end
return v10

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.GiftBrainrotComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Configs.PermissionsConfig)
require(v1.GameShared.BrainrotUtils)
local v_u_4 = require(v1.GameShared.GiftingUtils)
local v_u_5 = require(v1.Shared.CharacterUtil)
local v6 = require(v1.Packages.Component)
local v_u_7 = require(v1.Packages.Knit)
local v_u_8 = v1.Assets.GiftBrainrotPrompt
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = nil
v_u_7.OnStart():andThen(function()
	-- upvalues: (ref) v_u_9, (copy) v_u_7, (ref) v_u_10, (ref) v_u_11
	v_u_9 = v_u_7.GetController("GiftPopupController")
	v_u_10 = v_u_7.GetController("SettingsController")
	v_u_11 = v_u_7.GetController("NotificationController")
end)
local v12 = v6.new({
	["Tag"] = "Character"
})
function v12.OnChildAdded(p13, p14)
	-- upvalues: (copy) v_u_4
	if p13.prompt then
		if v_u_4.CanGiftTool(p14) then
			p13.prompt.Enabled = true
		else
			p13.prompt.Enabled = false
		end
	else
		return
	end
end
function v12.OnChildRemoved(p15, p16)
	if p15.prompt then
		if p16:IsA("Tool") then
			p15.prompt.Enabled = false
		end
	end
end
function v12.Start(p_u_17)
	-- upvalues: (copy) v_u_2, (copy) v_u_8, (copy) v_u_5, (copy) v_u_4, (copy) v_u_3, (ref) v_u_10, (ref) v_u_11, (ref) v_u_9
	if v_u_2:GetPlayerFromCharacter(p_u_17.Instance) ~= v_u_2.LocalPlayer then
		p_u_17.prompt = v_u_8:Clone()
		p_u_17.prompt.Enabled = false
		local v18 = v_u_5.GetEquippedTool(v_u_2.LocalPlayer)
		if v18 and v_u_4.CanGiftTool(v18) then
			p_u_17.prompt.Enabled = true
		end
		p_u_17.prompt.Parent = p_u_17.Instance
		p_u_17.prompt.Triggered:Connect(function()
			-- upvalues: (ref) v_u_2, (copy) p_u_17, (ref) v_u_3, (ref) v_u_10, (ref) v_u_11, (ref) v_u_9
			local v19 = v_u_2:GetPlayerFromCharacter(p_u_17.Instance)
			if v19 then
				local v20 = v_u_2.LocalPlayer.Character
				if v20 then
					local v21 = v20:FindFirstChildOfClass("Tool")
					if v21:GetAttribute("EntityId") then
						if v_u_3.CREATORS[v_u_2.LocalPlayer.UserId] then
							return
						elseif v_u_10:GetSetting("GiftsEnabled") then
							v_u_9:GiftBrainrot(v21:GetAttribute("EntityId"), v21:GetAttribute("BrainrotType"), v21:GetAttribute("BrainrotMutation"), v21:GetAttribute("BrainrotLevel"), v19)
						else
							v_u_11:DisplayNotification("Warning", "Please enable gifting in settings to gift!")
						end
					else
						return
					end
				else
					return
				end
			else
				return
			end
		end)
		local v22 = v_u_2.LocalPlayer.Character
		if v22 then
			p_u_17.childAddedConnection = v22.ChildAdded:Connect(function(p23)
				-- upvalues: (copy) p_u_17
				p_u_17:OnChildAdded(p23)
			end)
			p_u_17.childRemovedConnection = v22.ChildRemoved:Connect(function(p24)
				-- upvalues: (copy) p_u_17
				p_u_17:OnChildRemoved(p24)
			end)
		end
		v_u_2.LocalPlayer.CharacterAdded:Connect(function(p25)
			-- upvalues: (copy) p_u_17
			if p_u_17.childAddedConnection then
				p_u_17.childAddedConnection:Disconnect()
			end
			if p_u_17.childRemovedConnection then
				p_u_17.childRemovedConnection:Disconnect()
			end
			p_u_17.childAddedConnection = p25.ChildAdded:Connect(function(p26)
				-- upvalues: (ref) p_u_17
				p_u_17:OnChildAdded(p26)
			end)
			p_u_17.childRemovedConnection = p25.ChildRemoved:Connect(function(p27)
				-- upvalues: (ref) p_u_17
				p_u_17:OnChildRemoved(p27)
			end)
		end)
	end
end
function v12.Stop(p28)
	if p28.childAddedConnection then
		p28.childAddedConnection:Disconnect()
		p28.childAddedConnection = nil
	end
	if p28.childRemovedConnection then
		p28.childRemovedConnection:Disconnect()
		p28.childRemovedConnection = nil
	end
	if p28.prompt then
		p28.prompt:Destroy()
		p28.prompt = nil
	end
end
return v12

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.LuckyBlockHitAnimationComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v3 = require(v1.Packages.Component)
require(v1.Shared.Janitor)
require(v1.Shared.AbbreviationUtils)
local v4 = v3.new({
	["Tag"] = "LuckyBlock"
})
function v4.PlayAnimation(p_u_5)
	-- upvalues: (copy) v_u_2
	p_u_5.highlight.FillTransparency = 0.5
	p_u_5.highlight.OutlineTransparency = 1
	p_u_5.highlight.Enabled = true
	if p_u_5.changeConn then
		p_u_5.changeConn:Disconnect()
		p_u_5.changeConn = nil
	end
	if not p_u_5.SizeOBJ then
		p_u_5.SizeOBJ = Instance.new("NumberValue")
	end
	p_u_5.SizeOBJ.Value = p_u_5.Instance:GetScale()
	p_u_5.changeConn = p_u_5.SizeOBJ.Changed:connect(function()
		-- upvalues: (copy) p_u_5
		if p_u_5.SizeOBJ.Value > 0 then
			p_u_5.Instance:ScaleTo(p_u_5.SizeOBJ.Value)
		end
	end)
	if not p_u_5.shrinkTween then
		p_u_5.shrinkTween = v_u_2:Create(p_u_5.SizeOBJ, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["Value"] = p_u_5.Instance:GetScale() / 0.9
		})
	end
	if not p_u_5.expandTween then
		p_u_5.expandTween = v_u_2:Create(p_u_5.SizeOBJ, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			["Value"] = p_u_5.Instance:GetScale()
		})
	end
	if not p_u_5.highlightIn then
		p_u_5.highlightIn = v_u_2:Create(p_u_5.highlight, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
			["FillTransparency"] = 0.25,
			["OutlineTransparency"] = 0.2
		})
	end
	if not p_u_5.highlightOut then
		p_u_5.highlightOut = v_u_2:Create(p_u_5.highlight, TweenInfo.new(0.18, Enum.EasingStyle.Linear), {
			["FillTransparency"] = 1,
			["OutlineTransparency"] = 1
		})
	end
	p_u_5.shrinkTween:Play()
	p_u_5.highlightIn:Play()
	p_u_5.shrinkTween.Completed:Once(function()
		-- upvalues: (copy) p_u_5
		if p_u_5.expandTween then
			p_u_5.expandTween:Play()
		end
		if p_u_5.highlightOut then
			p_u_5.highlightOut:Play()
		end
	end)
	p_u_5.highlightOut.Completed:Once(function()
		-- upvalues: (copy) p_u_5
		if p_u_5.highlight then
			p_u_5.highlight.Enabled = false
		end
	end)
end
function v4.Start(p_u_6)
	p_u_6.highlight = script.Highlight:Clone()
	p_u_6.highlight.Parent = p_u_6.Instance
	p_u_6.highlight.Adornee = p_u_6.Instance
	p_u_6.highlight.Enabled = false
	p_u_6.hpConn = p_u_6.Instance:GetAttributeChangedSignal("Hp"):Connect(function()
		-- upvalues: (copy) p_u_6
		local v7 = p_u_6.Instance:GetAttribute("Hp")
		if v7 > 0 and v7 ~= p_u_6.Instance:GetAttribute("MaxHp") then
			p_u_6:PlayAnimation()
		end
	end)
end
function v4.Stop(p8)
	if p8.highlight then
		p8.highlight:Destroy()
		p8.highlight = nil
	end
	if p8.hpConn then
		p8.hpConn:Disconnect()
		p8.hpConn = nil
	end
	if p8.SizeOBJ then
		p8.SizeOBJ:Destroy()
		p8.SizeOBJ = nil
	end
	if p8.changeConn then
		p8.changeConn:Disconnect()
		p8.changeConn = nil
	end
	if p8.shrinkTween then
		p8.shrinkTween:Cancel()
		p8.shrinkTween:Destroy()
	end
	if p8.expandTween then
		p8.expandTween:Cancel()
		p8.expandTween:Destroy()
	end
	if p8.highlightIn then
		p8.highlightIn:Cancel()
		p8.highlightIn:Destroy()
	end
	if p8.highlightOut then
		p8.highlightOut:Cancel()
		p8.highlightOut:Destroy()
	end
end
return v4

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.LuckyBlockInteractionComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v3 = require(v1.Packages.Component)
local v_u_4 = require(v1.Packages.Knit)
local v_u_5 = require(v1.Shared.AnimationManager)
local v_u_6 = require(v1.Configs.LuckyBlockConfig)
local v_u_7 = v1:WaitForChild("Assets"):WaitForChild("LuckyBlock"):WaitForChild("Billboards")
local v_u_8 = nil
v_u_4.OnStart():andThen(function()
	-- upvalues: (ref) v_u_8, (copy) v_u_4
	v_u_8 = v_u_4.GetService("LuckyBlockService")
end)
local v9 = v3.new({
	["Tag"] = "ContainerLuckyBlock"
})
function v9._OnOpeningChange(p10)
	-- upvalues: (copy) v_u_2
	local v11 = p10.Instance:GetAttribute("IsOpening")
	if p10.player == v_u_2.LocalPlayer then
		p10._proximity.Enabled = not v11
	else
		p10._proximity.Enabled = false
	end
	p10._billboard.Enabled = not v11
end
function v9.Construct(p12)
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
	p12.ownerId = p12.Instance:GetAttribute("OwnerId")
	p12.player = v_u_2:GetPlayerByUserId(p12.ownerId)
	p12.luckyBlockType = p12.Instance:GetAttribute("LuckyBlockType")
	p12.entityId = p12.Instance:GetAttribute("EntityId")
	if p12.Instance:GetAttribute("IDLE") then
		p12._animatorManager = v_u_5.Get(p12.Instance)
	end
	local v13 = v_u_6.LUCKY_BLOCKS[p12.luckyBlockType]
	local v14 = Instance.new("ProximityPrompt")
	v14.ActionText = "Open"
	v14.HoldDuration = 1
	v14.RequiresLineOfSight = false
	v14.MaxActivationDistance = 10
	v14.Parent = p12.Instance
	p12._proximity = v14
	local v15 = v_u_7:WaitForChild(p12.luckyBlockType):Clone()
	v15.TextLabel.Text = v13.name
	v15.Adornee = p12.Instance.PrimaryPart
	v15.Parent = p12.Instance
	p12._billboard = v15
end
function v9.Start(p_u_16)
	-- upvalues: (copy) v_u_2, (ref) v_u_8
	if p_u_16.Instance:GetAttribute("IDLE") then
		p_u_16._animatorManager:Play(p_u_16.Instance:GetAttribute("IDLE"))
	end
	p_u_16._proximity.Triggered:Connect(function()
		-- upvalues: (copy) p_u_16, (ref) v_u_2, (ref) v_u_8
		if p_u_16.player == v_u_2.LocalPlayer then
			v_u_8:Open(p_u_16.entityId)
		end
	end)
	p_u_16:_OnOpeningChange()
	p_u_16._isOpeningConn = p_u_16.Instance:GetAttributeChangedSignal("IsOpening"):Connect(function()
		-- upvalues: (copy) p_u_16
		p_u_16:_OnOpeningChange()
	end)
end
function v9.Stop(p17)
	if p17._proximity then
		p17._proximity:Destroy()
		p17._proximity = nil
	end
	if p17._isOpeningConn then
		p17._isOpeningConn:Disconnect()
		p17._isOpeningConn = nil
	end
	if p17._billboard then
		p17._billboard:Destroy()
		p17._billboard = nil
	end
	if p17._animatorManager then
		p17._animatorManager:Destroy()
	end
end
return v9

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.LuckyBlockContainerAnimationComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("SoundService")
local v4 = require(v1.Packages.Knit)
local v5 = require(v1.Packages.Component)
local v_u_6 = require(v1.Shared.VfxManager)
local v_u_7 = require(v1.Configs.BrainrotsConfig)
local v_u_8 = require(v1.Configs.MutationConfig)
local v_u_9 = require(v1.Configs.LuckyBlockConfig)
local v_u_10 = require(v1.Shared.WeatherUtils)
local v_u_11 = require(v1.Shared.TableUtils)
local v_u_12 = require(v1.GameShared.BrainrotUtils)
local v_u_13 = require(v1.Shared.RandomUtils)
local v14 = v1:WaitForChild("Assets"):WaitForChild("LuckyBlock")
local v_u_15 = v14:WaitForChild("OpenContainerEvent")
local v_u_16 = v14:WaitForChild("OpenPlaceholder")
local v_u_17 = v1:WaitForChild("BrainrotModels")
local v_u_18 = {}
v4.OnStart():andThen(function()
	-- upvalues: (copy) v_u_15, (copy) v_u_18
	v_u_15.OnClientEvent:Connect(function(p19, p20, p21)
		-- upvalues: (ref) v_u_18
		local v22 = v_u_18[p19]
		if v22 and not v22.isOpening then
			v22.isOpening = true
			v22:OnOpen(p20, p21)
		end
	end)
end)
local v23 = v5.new({
	["Tag"] = "ContainerLuckyBlock"
})
local function v_u_35(p24, p25)
	local v26 = p25:GetPivot()
	local v27
	if p25:IsA("Model") then
		local v28
		v28, v27 = p25:GetBoundingBox()
	else
		v27 = p25.Size
	end
	local v29 = v26.Position.Y - v27.Y / 2
	local v30 = p24:GetPivot()
	local v31 = p24:GetExtentsSize()
	local v32 = p24:GetPivot()
	local v33 = v30.Position.Y - v31.Y / 2
	local v34 = v29 + (v32.Position.Y - v33)
	p24:PivotTo(CFrame.new(v26.Position.X, v34, v26.Position.Z) * v26.Rotation)
end
function getTweenDuration(p36, p37)
	return 0.07 + 0.48000000000000004 * (p36 / p37) ^ 7
end
local function v_u_43(p38, p39)
	local v40 = p38:GetPivot()
	local v41 = p38.PrimaryPart.Size
	local v42 = v40.Position.Y - v41.Y / 2 + (p39:IsA("Model") and p39:GetExtentsSize() or p39.Size).Y / 2
	return CFrame.new(v40.Position.X, v42, v40.Position.Z) * v40.Rotation
end
local function v_u_55(p_u_44, p45, p46, p_u_47, p_u_48)
	-- upvalues: (copy) v_u_35, (copy) v_u_2
	local v_u_49 = Instance.new("NumberValue")
	v_u_49.Value = 0.001
	v_u_49.Parent = p_u_44
	local v_u_51 = v_u_49.Changed:Connect(function(p50)
		-- upvalues: (copy) p_u_44, (ref) v_u_35, (copy) p_u_47
		if p50 >= 0 then
			if p_u_44.PrimaryPart or p_u_44:IsA("BasePart") then
				p_u_44:ScaleTo(p50)
				v_u_35(p_u_44, p_u_47)
			end
		end
	end)
	local v52 = v_u_2:Create(v_u_49, p46, {
		["Value"] = p45
	})
	v52:Play()
	local function v_u_53()
		-- upvalues: (copy) v_u_51, (copy) v_u_49, (copy) p_u_44
		v_u_51:Disconnect()
		v_u_49:Destroy()
		if p_u_44 then
			p_u_44:Destroy()
		end
	end
	v52.Completed:Connect(function()
		-- upvalues: (copy) p_u_48, (ref) v_u_2, (copy) v_u_49, (copy) v_u_53, (copy) v_u_51, (copy) p_u_44
		if p_u_48 then
			local v54 = v_u_2:Create(v_u_49, p_u_48, {
				["Value"] = 0.001
			})
			v54:Play()
			v54.Completed:Connect(v_u_53)
		else
			task.wait(0.35)
			v_u_51:Disconnect()
			v_u_49:Destroy()
			if p_u_44 then
				p_u_44:Destroy()
			end
		end
	end)
end
local function v_u_61()
	-- upvalues: (copy) v_u_10, (copy) v_u_8
	local v56 = v_u_10.GetActiveWeathers()
	local v57 = #v56 > 0 and v56[1] or "base"
	local v58 = {}
	for v59, v60 in v_u_8 do
		if v60.chances then
			v58[v59] = v60.chances[v57] or 0
		else
			v58[v59] = 0
		end
	end
	return v58
end
local function v_u_66(p62, p_u_63)
	-- upvalues: (copy) v_u_11
	local v64
	if p_u_63 then
		v64 = v_u_11.Filter(p62, function(p65)
			-- upvalues: (copy) p_u_63
			return not table.find(p_u_63, p65.Name)
		end)
	else
		v64 = p62
	end
	if #v64 ~= 0 then
		p62 = v64
	end
	if #p62 ~= 0 then
		return p62[math.random(1, #p62)]
	end
	warn("No models left after exclusion!")
	return nil
end
function v23.OnOpen(p67, p_u_68, p69)
	-- upvalues: (copy) v_u_43, (copy) v_u_16, (copy) v_u_6, (copy) v_u_17, (copy) v_u_61, (copy) v_u_3, (copy) v_u_66, (copy) v_u_13, (copy) v_u_12, (copy) v_u_35, (copy) v_u_55, (copy) v_u_7
	local v70 = v_u_43(p67.Instance, v_u_16)
	for _, v71 in pairs(p67.Instance:GetDescendants()) do
		if v71:IsA("BasePart") or v71:IsA("Decal") then
			v71.Transparency = 1
		end
	end
	if p67.billboard then
		p67.billboard:Destroy()
	end
	if p67.openVFX then
		v_u_6.Emit(p67.openVFX, 5)
	end
	if p67.partVFX then
		v_u_6.Emit(p67.partVFX, 5)
	end
	local v72 = v_u_16:Clone()
	v72.Parent = p67.Instance
	v72:PivotTo(v70)
	local v73 = {}
	if p67.luckyBlockInfo and p67.luckyBlockInfo.items then
		for _, v74 in p67.luckyBlockInfo.items do
			local v75 = v_u_17:FindFirstChild(v74.id)
			if v75 then
				table.insert(v73, v75)
			end
		end
	end
	local v76 = v_u_61()
	local v77 = v_u_3.LuckyBlockSounds.Open:Clone()
	v77.Parent = p67.Instance.PrimaryPart
	v77.PlaybackSpeed = 1 + math.random(1, 3) / 10
	v77:Play()
	local v78 = v_u_3.LuckyBlockSounds.Roll:Clone()
	v78.Parent = p67.Instance.PrimaryPart
	local v79 = nil
	for v80 = 1, 45 do
		local v81 = v79 and { v79 } or nil
		if v80 == 45 then
			table.insert(v81, p_u_68)
		end
		local v82 = v_u_66(v73, v81)
		local v83 = v_u_13:GetWeightedChoice(v76)
		local v84 = v_u_17:FindFirstChild((v_u_12.GetModelName(v82.Name, v83))) or v82
		v79 = v82.Name
		local v85 = v84:Clone()
		v85:AddTag("BrainrotFakeAnimation")
		v85:SetAttribute("BrainrotType", v82.Name)
		for _, v86 in ipairs(v85:GetChildren()) do
			if v86:IsA("BasePart") then
				v86.Anchored = true
			end
		end
		v85.Parent = v72
		local v87 = v85:GetScale()
		v85:ScaleTo(0.001)
		v_u_35(v85, v72)
		if v78 then
			v78.PlaybackSpeed = 0.9 + math.random(1, 3) / 10
			v78:Play()
		end
		local v88 = getTweenDuration(v80, 45) * 1
		local v89 = v88 * 0.7
		local v90 = v88 * 0.3
		v_u_55(v85, v87, TweenInfo.new(v89, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), v72, (TweenInfo.new(v90, Enum.EasingStyle.Sine, Enum.EasingDirection.In)))
		task.wait(v88 * 0.42)
	end
	local v_u_91 = v_u_3.LuckyBlockSounds.Recive:Clone()
	v_u_91.Parent = p67.Instance.PrimaryPart
	local v92 = v_u_17:FindFirstChild((v_u_12.GetModelName(p_u_68, p69)))
	if v92 then
		local v93 = v92:Clone()
		v93:AddTag("BrainrotFakeAnimation")
		v93:SetAttribute("BrainrotType", p_u_68)
		v93.Parent = v72
		for _, v94 in ipairs(v93:GetChildren()) do
			if v94:IsA("BasePart") then
				v94.Anchored = true
			end
		end
		local v95 = v93:GetScale()
		v93:ScaleTo(0.001)
		v_u_35(v93, v72)
		local v96 = p67.Instance.Parent
		local v_u_97
		if v96 then
			v_u_97 = v96.Parent
		else
			v_u_97 = nil
		end
		task.delay(0.69, function()
			-- upvalues: (copy) v_u_91, (ref) v_u_7, (copy) p_u_68, (ref) v_u_3, (ref) v_u_97
			if v_u_91 then
				v_u_91.PlaybackSpeed = 1 + math.random(1, 4) / 10
				v_u_91:Play()
			end
			local v98 = v_u_7[p_u_68]
			local v99 = v_u_3:FindFirstChild("Levelup Sounds"):FindFirstChild(v98.name)
			if v99 and v_u_97 then
				local v_u_100 = v99:Clone()
				v_u_100.RollOffMode = Enum.RollOffMode.Linear
				v_u_100.RollOffMinDistance = 20
				v_u_100.RollOffMaxDistance = 60
				v_u_100.Parent = v_u_97.PrimaryPart
				v_u_100:Play()
				v_u_100.Ended:Connect(function()
					-- upvalues: (copy) v_u_100
					v_u_100:Destroy()
				end)
			end
		end)
		v_u_55(v93, v95, TweenInfo.new(getTweenDuration(1, 1) * 2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), v72)
	end
end
function v23.Construct(p101)
	-- upvalues: (copy) v_u_9, (copy) v_u_18
	p101.luckyBlockType = p101.Instance:GetAttribute("LuckyBlockType")
	p101.luckyBlockMutation = p101.Instance:GetAttribute("LuckyBlockMutation")
	p101.isOpening = false
	p101.hrp = p101.Instance:WaitForChild("HumanoidRootPart")
	p101.openVFX = p101.Instance:WaitForChild("VFX"):WaitForChild("OpenVFX")
	p101.partVFX = p101.Instance:WaitForChild("VFX")
	p101.luckyBlockInfo = v_u_9.LUCKY_BLOCKS[p101.luckyBlockType]
	v_u_18[p101.Instance] = p101
end
function v23.Start(p102)
	if p102.Instance:GetAttribute("IsOpening") then
		p102.isOpening = true
		for _, v103 in pairs(p102.Instance:GetDescendants()) do
			if v103:IsA("BasePart") or v103:IsA("Decal") then
				v103.Transparency = 1
			end
		end
		if p102.billboard then
			p102.billboard:Destroy()
		end
	end
end
function v23.Stop(p104)
	-- upvalues: (copy) v_u_18
	v_u_18[p104.Instance] = nil
end
return v23

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.BossComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("ContentProvider")
local v5 = require(v_u_1.Packages.Component)
local v_u_6 = require(v_u_1.Packages.Knit)
local v_u_7 = require(v_u_1.Configs.BossConfig)
local v_u_8 = require(v_u_1.Configs.PlayerSkinConfig)
local v_u_9 = require(v_u_1.Shared.RobloxUtils)
local v_u_10 = require(v_u_1.GameShared.RunningUtils)
local v11 = game:GetService("SoundService")
local v_u_12 = workspace:WaitForChild("BossSpawns")
local v_u_13 = game:GetService("TweenService")
local v14 = game:GetService("Lighting")
require(v_u_1.Zone)
local v_u_15 = v_u_2.LocalPlayer.PlayerGui:WaitForChild("HUD"):WaitForChild("TopBar")
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = nil
local v_u_22 = nil
v_u_6.OnStart():andThen(function()
	-- upvalues: (ref) v_u_16, (copy) v_u_6, (ref) v_u_17, (ref) v_u_18, (ref) v_u_19, (ref) v_u_20, (ref) v_u_22, (ref) v_u_21
	v_u_16 = v_u_6.GetService("PickupService")
	v_u_17 = v_u_6.GetService("RunningService")
	v_u_18 = v_u_6.GetService("PlayerService")
	v_u_19 = v_u_6.GetController("RunningController")
	v_u_20 = v_u_6.GetController("ReplicaController")
	v_u_22 = v_u_6.GetController("WindowController")
	v_u_21 = require(v_u_6.Components.FakeBlockAnimationComponent)
end)
local v23 = v5.new({
	["Tag"] = "Boss"
})
local v_u_24 = v11:WaitForChild("MagiaSounds")
v11:WaitForChild("TaTaTaSounds")
v11:WaitForChild("Bombounds")
v11:WaitForChild("Gorilaounds")
v11:WaitForChild("Assasinoaounds")
v11:WaitForChild("Fishaounds")
v11:WaitForChild("HourseSounds")
v11:WaitForChild("Toiletaounds")
v11:WaitForChild("DragonSounds")
v11:WaitForChild("Eleounds")
local v_u_25 = v11:WaitForChild("MagiaHits")
local v_u_26 = v11:WaitForChild("Alert")
local v_u_27 = true
local function v_u_29(p28)
	-- upvalues: (ref) v_u_27
	if v_u_27 then
		v_u_27 = false
		p28:GetChildren()[math.random(1, #p28:GetChildren())]:Play()
		task.wait(0.5)
		v_u_27 = true
	end
end
local v_u_30 = game.Players.LocalPlayer.PlayerGui:WaitForChild("Effects"):WaitForChild("Caseing")
function v23.ScreenGreenReward(p_u_31)
	-- upvalues: (copy) v_u_30, (copy) v_u_13
	task.spawn(function()
		-- upvalues: (copy) p_u_31, (ref) v_u_30, (ref) v_u_13
		while p_u_31.chasing do
			v_u_30.Visible = true
			local v32 = {
				["ImageTransparency"] = 0.9
			}
			v_u_13:Create(v_u_30, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), v32):Play()
			task.wait(0.3)
			local v33 = {
				["ImageTransparency"] = 0.6
			}
			v_u_13:Create(v_u_30, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), v33):Play()
			task.wait(0.3)
		end
		local v34 = {
			["ImageTransparency"] = 1
		}
		v_u_13:Create(v_u_30, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), v34):Play()
		task.wait(0.1)
		v_u_30.Visible = false
	end)
end
local v_u_35 = v14:WaitForChild("ColorBase")
function ScreenRednReward()
	-- upvalues: (copy) v_u_35, (copy) v_u_13
	task.spawn(function()
		-- upvalues: (ref) v_u_35, (ref) v_u_13
		v_u_35.TintColor = Color3.fromRGB(255, 255, 255)
		v_u_35.Brightness = 0
		v_u_13:Create(v_u_35, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			["TintColor"] = Color3.fromRGB(255, 85, 88),
			["Brightness"] = 0.2
		}):Play()
		task.wait(0.25)
		v_u_13:Create(v_u_35, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			["TintColor"] = Color3.fromRGB(255, 255, 255),
			["Brightness"] = 0
		}):Play()
		task.wait(0.25)
	end)
end
function v23.EnteredZone(p36)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if not (p36.goal or p36.returnTween) then
		local v37 = v_u_2.LocalPlayer.Character
		if not v37 then
			return
		end
		local v38 = v37:GetPivot().Position
		local v39 = p36.Instance:GetPivot().Position
		local v40 = CFrame.lookAt
		local v41 = v38.X
		local v42 = v39.Y
		local v43 = v38.Z
		local v44 = v40(v39, (Vector3.new(v41, v42, v43)))
		local v45 = TweenInfo.new(0.1, Enum.EasingStyle.Linear)
		p36.tween = v_u_3:Create(p36.Instance.PrimaryPart, v45, {
			["CFrame"] = v44
		})
		p36.tween:Play()
	end
	p36.inZone = true
end
function v23._LookAtSpawn(p46)
	-- upvalues: (copy) v_u_3
	local v47 = workspace:WaitForChild("BossBenchmarks"):WaitForChild(p46.id):GetPivot().Position
	local v48 = p46.Instance:GetPivot().Position
	local v49 = CFrame.lookAt
	local v50 = v47.X
	local v51 = v48.Y
	local v52 = v47.Z
	local v53 = v49(v48, (Vector3.new(v50, v51, v52)))
	local v54 = TweenInfo.new(0.2, Enum.EasingStyle.Linear)
	p46.tween = v_u_3:Create(p46.Instance.PrimaryPart, v54, {
		["CFrame"] = v53
	})
	p46.tween:Play()
end
function v23.ExitedZone(p55)
	p55.inZone = false
	if not (p55.goal or p55.returnTween) then
		p55:_LookAtSpawn()
	end
end
function v23.HeartbeatUpdate(p56)
	-- upvalues: (copy) v_u_2
	if p56.inZone then
		if p56.goal or p56.returnTween then
			return
		else
			local v57 = v_u_2.LocalPlayer.Character
			if v57 then
				local v58 = v57:GetPivot().Position
				local v59 = p56.Instance:GetPivot().Position
				local v60 = CFrame.lookAt
				local v61 = v58.X
				local v62 = v59.Y
				local v63 = v58.Z
				local v64 = v60(v59, (Vector3.new(v61, v62, v63)))
				p56.Instance:PivotTo(v64)
			end
		end
	else
		return
	end
end
function v23.ReturnToSpawn(p_u_65, p66, p67)
	-- upvalues: (copy) v_u_12, (copy) v_u_9, (copy) v_u_3
	if not p_u_65.chasing then
		return
	end
	local v68 = v_u_12:WaitForChild(p_u_65.id)
	if not v68 then
		warn((("Could not find spawn for boss %*"):format(p_u_65.id)))
		return
	end
	p_u_65.chasing = false
	p_u_65.walkTrack:Stop()
	if p_u_65.goal then
		p_u_65.goal = nil
		p_u_65.Instance.Humanoid.WalkSpeed = 0
	end
	if p_u_65.returnTween then
		p_u_65.returnTween:Cancel()
		p_u_65.returnTween:Destroy()
		p_u_65.returnTween = nil
	end
	if p_u_65.returnCompletedConnection then
		p_u_65.returnCompletedConnection:Disconnect()
		p_u_65.returnCompletedConnection = nil
	end
	if p_u_65.task then
		task.cancel(p_u_65.task)
		p_u_65.task = nil
	end
	if p66 then
		return
	end
	local v69 = v_u_9:GetDistance(p_u_65.Instance, v68)
	if p67 then
		local v70 = p_u_65.config.speed
		v71 = math.min(v70, 30)
		if v71 then
			goto l17
		end
	end
	local v71 = p_u_65.config.speed * 5
	::l17::
	local v72 = v69 / v71
	local v73 = TweenInfo.new(v72, Enum.EasingStyle.Linear)
	if not (v68 and (p_u_65.Instance and p_u_65.Instance.PrimaryPart)) then
		print(v68)
		print(p_u_65.Instance)
		print(p_u_65.Instance.PrimaryPart)
	end
	local v74 = v68.Position.X
	local v75 = p_u_65.Instance.PrimaryPart.Position.Y
	local v76 = v68.Position.Z
	local v77 = Vector3.new(v74, v75, v76)
	local v78 = CFrame.lookAt(p_u_65.Instance.PrimaryPart.Position, v77)
	local v79 = CFrame.new(v77) * v78.Rotation
	p_u_65.Instance.PrimaryPart.CFrame = v78
	p_u_65.returnTween = v_u_3:Create(p_u_65.Instance.PrimaryPart, v73, {
		["CFrame"] = v79
	})
	p_u_65.Instance:WaitForChild("Highlight").Enabled = false
	p_u_65.walkTrack:Play()
	p_u_65.returnTween:Play()
	p_u_65.returnCompletedConnection = p_u_65.returnTween.Completed:Connect(function()
		-- upvalues: (copy) p_u_65
		if p_u_65.returnTween then
			p_u_65.returnTween:Destroy()
			p_u_65.returnTween = nil
		end
		if p_u_65.Instance and p_u_65.Instance.PrimaryPart then
			p_u_65.Instance.PrimaryPart.Anchored = true
		end
		p_u_65:_LookAtSpawn()
		p_u_65.walkTrack:Stop()
	end)
end
function v23.ChaseLuckyBlock(p80)
	-- upvalues: (ref) v_u_19
	if p80.chasing then
		return
	else
		if p80.returnTween then
			p80.returnTween:Cancel()
			p80.returnTween:Destroy()
			p80.returnTween = nil
		end
		if p80.returnCompletedConnection then
			p80.returnCompletedConnection:Disconnect()
			p80.returnCompletedConnection = nil
		end
		if p80.id ~= "base13" then
			p80.Instance:WaitForChild("Highlight").Enabled = true
		end
		if p80.Instance and p80.Instance.PrimaryPart then
			p80.Instance.PrimaryPart.Anchored = false
		end
		p80.Instance.Humanoid.WalkSpeed = p80.config.pickupChaseSpeed
		local v81 = v_u_19:GetSkinModel()
		if v81 then
			p80.walkTrack:Play()
			p80.chasing = true
			p80.goal = v81.PrimaryPart
			p80.Instance.Humanoid:MoveTo(p80.goal:GetPivot().Position, p80.goal)
		else
			warn("Cannot chase lucky block because could not find player skin model")
		end
	end
end
function v23.Chase(p_u_82)
	-- upvalues: (copy) v_u_2, (copy) v_u_26, (copy) v_u_29, (copy) v_u_24
	if p_u_82.returnTween then
		p_u_82.returnTween:Cancel()
		p_u_82.returnTween:Destroy()
		p_u_82.returnTween = nil
	end
	if p_u_82.returnCompletedConnection then
		p_u_82.returnCompletedConnection:Disconnect()
		p_u_82.returnCompletedConnection = nil
	end
	if p_u_82.Instance and p_u_82.Instance.PrimaryPart then
		p_u_82.Instance.PrimaryPart.Anchored = false
		local v83 = p_u_82.Instance:GetAttribute("END_CFRAME")
		if v83 then
			p_u_82.Instance:PivotTo(v83)
		end
	end
	p_u_82.Instance.Humanoid.WalkSpeed = p_u_82.config.speed
	local v84 = v_u_2.LocalPlayer
	local v85 = v84.Character or v84.CharacterAdded:Wait()
	if v85 then
		if p_u_82.id == "base13" then
			print("david take")
		end
		if p_u_82.conn then
			p_u_82.conn:Disconnect()
			p_u_82.conn = nil
		end
		if p_u_82.config.BossWait and p_u_82.config.BossWait > 0 then
			task.spawn(function()
				-- upvalues: (copy) p_u_82
				p_u_82.Instance.Humanoid.WalkSpeed = p_u_82.config.speed / 7
				if p_u_82.Instance.Humanoid.WalkSpeed > 25 then
					p_u_82.Instance.Humanoid.WalkSpeed = 25
				end
				if p_u_82.Instance.Humanoid.WalkSpeed < 10 then
					p_u_82.Instance.Humanoid.WalkSpeed = 10
				end
				task.wait(p_u_82.config.BossWait)
				if p_u_82.goal or p_u_82.returnTween then
					p_u_82.Instance.Humanoid.WalkSpeed = p_u_82.config.speed
				end
			end)
		end
		p_u_82.chasing = true
		v_u_26.PlaybackSpeed = math.random(0, 5) / 10 + 0.7
		v_u_26:Play()
		task.spawn(function()
			-- upvalues: (ref) v_u_26
			task.wait(v_u_26.TimeLength)
			v_u_26:Play()
		end)
		if not p_u_82.walkTrack.IsPlaying then
			p_u_82.walkTrack:Play()
		end
		if p_u_82.id ~= "base13" then
			p_u_82.Instance:WaitForChild("Highlight").Enabled = true
		end
		p_u_82.goal = v85:WaitForChild("HumanoidRootPart")
		p_u_82.Instance.Humanoid:MoveTo(p_u_82.goal:GetPivot().Position, p_u_82.goal)
		if p_u_82.Instance.Name == "base1" then
			v_u_29(v_u_24)
		end
		p_u_82:ScreenGreenReward()
	else
		warn((("Could not find character for player %*"):format(v84.Name)))
	end
end
function v23._InitAnimations(p86)
	local v87 = p86.Instance:WaitForChild("Humanoid"):WaitForChild("Animator")
	local v88 = Instance.new("Animation")
	v88.AnimationId = ("rbxassetid://%*"):format(p86.config.idleAnimation)
	local v89 = Instance.new("Animation")
	v89.AnimationId = ("rbxassetid://%*"):format(p86.config.chaseAnimation)
	local v90 = Instance.new("Animation")
	v90.AnimationId = ("rbxassetid://%*"):format(p86.config.attackAnimation)
	local v91 = v87:LoadAnimation(v88)
	v91.Name = "Idle"
	v91.Priority = Enum.AnimationPriority.Idle
	local v92 = v87:LoadAnimation(v89)
	v92.Name = "Walk"
	v92.Priority = Enum.AnimationPriority.Movement
	local v93 = v87:LoadAnimation(v90)
	v93.Name = "Attack"
	v93.Priority = Enum.AnimationPriority.Action3
	p86.idleTrack = v91
	p86.walkTrack = v92
	p86.attackTrack = v93
end
function v23._RunTask(p94)
	while p94.active do
		local v95 = p94.goal and p94.Instance.Humanoid
		if v95 then
			v95:MoveTo(p94.goal:GetPivot().Position, p94.goal)
		end
		task.wait(0.2)
	end
end
function v23._CheckTouch(p_u_96, p97)
	-- upvalues: (copy) v_u_2, (ref) v_u_20, (copy) v_u_8, (ref) v_u_19, (copy) v_u_1, (copy) v_u_3, (copy) v_u_10, (ref) v_u_21, (copy) v_u_4, (copy) v_u_9, (ref) v_u_17, (ref) v_u_22, (copy) v_u_15
	if not p_u_96.chasing then
		return
	end
	if not (p97.Parent and p97.Parent:HasTag("PlayerSkin")) then
		return
	end
	local v98 = p97.Parent
	if v98:GetAttribute("OwnerId") ~= v_u_2.LocalPlayer.UserId then
		return
	end
	if v98:GetAttribute("Caught") then
		return
	end
	local v99 = v_u_20:GetPlayerData()
	local v100 = v_u_8[v99.EquippedPlayerSkin]
	if not v100 then
		warn((("Could not find skin info for %*"):format(v99.EquippedPlayerSkin)))
		return
	end
	local v101 = workspace:WaitForChild("CollectZones"):FindFirstChild(p_u_96.id)
	local v102 = false
	for _, v103 in workspace:GetPartsInPart(v101) do
		if v103 == p97 then
			v102 = true
			break
		end
	end
	if v102 then
		if p_u_96.id == "base13" then
			print("david CHASE")
		end
		p_u_96.Instance:WaitForChild("Highlight").Enabled = false
		v98:SetAttribute("Caught", true)
		v_u_2.LocalPlayer.PlayerGui:WaitForChild("HUD"):WaitForChild("BottomBar"):WaitForChild("SpeedFrame").Visible = false
		local v_u_104 = v98:Clone()
		local v_u_105 = v_u_104.PrimaryPart
		local v106 = Instance.new("Motor6D")
		v106.Part0 = p_u_96.Instance.PrimaryPart
		v106.Part1 = v_u_105
		v106.C0 = CFrame.new(0, -0.5, -5)
		v106.Parent = v_u_105
		for _, v107 in pairs(v_u_104:GetDescendants()) do
			if v107:IsA("BasePart") or v107:IsA("MeshPart") then
				v107.CanCollide = false
				v107.Massless = true
			end
		end
		v_u_105.Anchored = false
		v_u_104.Parent = p_u_96.Instance
		task.wait()
		for _, v108 in ipairs(v_u_104:GetChildren()) do
			if v108:IsA("Accessory") and v108:FindFirstChild("Handle") then
				local v109 = v108.Handle.Size.X
				local v110 = v108.Handle.Size.Y
				local v111 = v108.Handle.Size.Z
				local v112 = v108.Handle.Size.X > 2.5 and 2.5 or v109
				local v113 = v108.Handle.Size.Y > 2.5 and 2.5 or v110
				local v114 = v108.Handle.Size.Z > 2.5 and 2.5 or v111
				v108.Handle.Size = Vector3.new(v112, v113, v114)
			end
		end
		v_u_104.VFX.Size = Vector3.new(4.922, 4.922, 4.922)
		local v115 = Instance.new("Animation")
		v115.AnimationId = ("rbxassetid://%*"):format(v100.idleAnimation)
		local v116 = v_u_104.Humanoid.Animator:LoadAnimation(v115)
		v116:Play()
		v116.Looped = true
		local v_u_117 = workspace:WaitForChild("Camera")
		v_u_117.CameraSubject = v_u_105
		v_u_19:DisconnectRunningModel(v98)
		local v_u_118 = v_u_1:WaitForChild("Assets"):WaitForChild("CUTSENE_FOLD"):Clone()
		if workspace:WaitForChild("Bases"):FindFirstChild(p_u_96.Instance.Name) then
			v_u_118:PivotTo(workspace:WaitForChild("Bases"):FindFirstChild(p_u_96.Instance.Name).PrimaryPart.CFrame)
			v_u_118.Parent = workspace
		end
		local v_u_119
		if v_u_20:GetPlayerData().FirstCollect then
			p_u_96.Instance.PrimaryPart.CFrame = CFrame.lookAt(p_u_96.Instance.PrimaryPart.Position, v_u_118:WaitForChild("HumanoidRootPart_SHORT").Position)
			v_u_119 = v_u_3:Create(p_u_96.Instance.PrimaryPart, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
				["CFrame"] = v_u_118:WaitForChild("HumanoidRootPart_SHORT").CFrame
			})
		else
			p_u_96.Instance.PrimaryPart.CFrame = CFrame.lookAt(p_u_96.Instance.PrimaryPart.Position, v_u_118:WaitForChild("HumanoidRootPart").Position)
			v_u_119 = v_u_3:Create(p_u_96.Instance.PrimaryPart, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
				["CFrame"] = v_u_118:WaitForChild("HumanoidRootPart").CFrame * CFrame.Angles(0, 3.141592653589793, 0)
			})
		end
		v_u_119:Play()
		p_u_96.walkTrack:Play()
		task.delay(1.1, function()
			-- upvalues: (ref) v_u_20, (ref) v_u_10, (ref) v_u_2, (copy) p_u_96, (ref) v_u_21, (copy) v_u_118, (ref) v_u_4, (ref) v_u_9, (ref) v_u_17, (ref) v_u_3, (copy) v_u_104, (copy) v_u_105, (ref) v_u_119, (copy) v_u_117, (ref) v_u_22, (ref) v_u_15
			local v_u_120 = v_u_20:GetPlayerData()
			local v_u_121 = v_u_10.CreateSkinModel(v_u_2.LocalPlayer, v_u_120.EquippedPlayerSkin)
			v_u_121:SetAttribute("Caught", true)
			v_u_121:SetAttribute("BossId", p_u_96.id)
			v_u_121.Name = "PLAYER_SKIN"
			v_u_121:AddTag("FakeBlock")
			v_u_121.PrimaryPart.Anchored = true
			v_u_121.Parent = workspace
			task.wait()
			for _, v122 in ipairs(v_u_121:GetChildren()) do
				if v122:IsA("Accessory") and v122:FindFirstChild("Handle") then
					local v123 = v122.Handle.Size.X
					local v124 = v122.Handle.Size.Y
					local v125 = v122.Handle.Size.Z
					local v126 = v122.Handle.Size.X > 2.5 and 2.5 or v123
					local v127 = v122.Handle.Size.Y > 2.5 and 2.5 or v124
					local v128 = v122.Handle.Size.Z > 2.5 and 2.5 or v125
					v122.Handle.Size = Vector3.new(v126, v127, v128)
				end
			end
			v_u_121.VFX.Size = Vector3.new(4.922, 4.922, 4.922)
			local v_u_129 = workspace.CurrentCamera
			v_u_21:WaitForInstance(v_u_121):andThen(function(p_u_130)
				-- upvalues: (copy) v_u_120, (ref) p_u_96, (ref) v_u_118, (ref) v_u_4, (copy) v_u_121, (ref) v_u_9, (ref) v_u_10, (ref) v_u_17, (ref) v_u_3, (ref) v_u_104, (ref) v_u_105, (ref) v_u_119, (ref) v_u_117, (ref) v_u_129, (ref) v_u_22, (ref) v_u_15
				if v_u_120.FirstCollect then
					p_u_96.Instance:SetAttribute("END_CFRAME", v_u_118:WaitForChild("HumanoidRootPart_END").CFrame)
					local _ = v_u_118.CamRigWithLetterBox
					local _ = v_u_118.FairyBlock
					p_u_96.Instance.PrimaryPart.Anchored = true
					local v131 = Instance.new("Animation")
					v131.AnimationId = "rbxassetid://77307213551917"
					local v_u_132 = p_u_96.Instance.Humanoid.Animator:LoadAnimation(v131)
					v_u_132.Looped = false
					v_u_4:PreloadAsync({ v131 })
					local v133 = v_u_121:GetAttribute("HeightOffset")
					local v134
					if v133 then
						v134 = Vector3.new(0, v133, 0)
					else
						v134 = nil
					end
					v_u_9:PivotToPlaceholder(v_u_121, v_u_10.GetBlockPlaceholder(p_u_96.id), true, v134)
					v_u_132:GetMarkerReachedSignal("ROLL"):Connect(function()
						-- upvalues: (ref) v_u_17, (ref) p_u_96, (copy) p_u_130, (ref) v_u_121
						task.spawn(function()
							-- upvalues: (ref) v_u_17
							task.wait(4.1000000000000005)
							v_u_17:UpdateCFrame(workspace.CurrentCamera.CFrame)
						end)
						local v135, v136 = v_u_17:OpenLuckyBlock(p_u_96.id)
						p_u_130:Open(v135, v136)
						task.delay(4.3, function()
							-- upvalues: (ref) v_u_121
							v_u_121:Destroy()
						end)
					end)
					v_u_132:GetMarkerReachedSignal("STARTER"):Connect(function()
						-- upvalues: (ref) v_u_121, (ref) v_u_3
						local v137 = Instance.new("Highlight")
						v137.OutlineTransparency = 1
						v137.FillColor = Color3.fromRGB(255, 255, 255)
						v137.FillTransparency = 1
						v137.Parent = v_u_121
						v_u_3:Create(v137, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							["FillTransparency"] = 0
						}):Play()
						task.wait(2)
						v_u_3:Create(v137, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
							["FillTransparency"] = 1
						}):Play()
					end)
					v_u_104:Destroy()
					v_u_105:Destroy()
					p_u_96.Instance:PivotTo(v_u_118:WaitForChild("HumanoidRootPart").CFrame)
					v_u_119:Cancel()
					p_u_96:ReturnToSpawn(true)
					v_u_132:Play()
					p_u_96.walkTrack:Stop()
					v_u_117.CameraSubject = v_u_121.PrimaryPart
					v_u_129 = workspace.CurrentCamera
					v_u_129.CameraType = Enum.CameraType.Custom
					task.spawn(function()
						-- upvalues: (ref) v_u_118, (ref) v_u_117, (ref) v_u_121, (ref) v_u_129, (copy) v_u_132, (ref) p_u_96
						task.wait(5.5)
						v_u_118:Destroy()
						v_u_117.CameraSubject = v_u_121.PrimaryPart
						v_u_129 = workspace.CurrentCamera
						v_u_129.CameraType = Enum.CameraType.Custom
						v_u_132:Stop()
						p_u_96.Instance:PivotTo(p_u_96.Instance:GetAttribute("END_CFRAME"))
					end)
				else
					v_u_22:HideHUD()
					v_u_15.Visible = false
					task.delay(20, function()
						-- upvalues: (ref) v_u_22
						v_u_22:ShowHUD()
					end)
					p_u_96.Instance:SetAttribute("END_CFRAME", v_u_118:WaitForChild("HumanoidRootPart_END").CFrame)
					local v_u_138 = v_u_118.CamRigWithLetterBox
					local v139 = v_u_118.FairyBlock
					p_u_96.Instance.PrimaryPart.Anchored = true
					local v140 = Instance.new("Animation")
					local v141 = Instance.new("Animation")
					local v142 = Instance.new("Animation")
					v140.AnimationId = "rbxassetid://87104241461420"
					v141.AnimationId = "rbxassetid://76264098346323"
					v142.AnimationId = "rbxassetid://119734463706571"
					local v143 = v_u_138.AnimationController.Animator:LoadAnimation(v140)
					local v_u_144 = p_u_96.Instance.Humanoid.Animator:LoadAnimation(v141)
					local v145 = v139.AnimationController.Animator:LoadAnimation(v142)
					v143.Looped = false
					v_u_144.Looped = false
					v145.Looped = false
					v_u_4:PreloadAsync({ v140 })
					v_u_4:PreloadAsync({ v141 })
					v_u_4:PreloadAsync({ v142 })
					local v_u_146 = v_u_121:Clone()
					local v147 = Instance.new("Weld", v139.box)
					v_u_146:PivotTo(v139.box.CFrame)
					v_u_146.PrimaryPart.Anchored = false
					v147.Part0 = v139.box
					v147.Part1 = v_u_146.PrimaryPart
					v147.C0 = CFrame.new(-0.00048828125, -5.32271576, 0, 0.999999762, 3.72528985e-9, 2.38418522e-7, 3.72530762e-9, 0.999999762, -7.6516514e-8, -2.38418522e-7, 7.44792459e-8, 0.999999762)
					v147.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
					v_u_146.Parent = v139
					v145:GetMarkerReachedSignal("POS"):Connect(function()
						-- upvalues: (ref) v_u_121, (ref) v_u_9, (ref) v_u_10, (ref) p_u_96, (copy) v_u_146
						local v148 = v_u_121:GetAttribute("HeightOffset")
						local v149
						if v148 then
							v149 = Vector3.new(0, v148, 0)
						else
							v149 = nil
						end
						v_u_9:PivotToPlaceholder(v_u_121, v_u_10.GetBlockPlaceholder(p_u_96.id), true, v149)
						v_u_146:Destroy()
					end)
					v_u_144:GetMarkerReachedSignal("STARTER"):Connect(function()
						-- upvalues: (ref) v_u_121, (ref) v_u_3
						local v150 = Instance.new("Highlight")
						v150.OutlineTransparency = 1
						v150.FillColor = Color3.fromRGB(255, 255, 255)
						v150.FillTransparency = 1
						v150.Parent = v_u_121
						v_u_3:Create(v150, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							["FillTransparency"] = 0
						}):Play()
						task.wait(2)
						v_u_3:Create(v150, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
							["FillTransparency"] = 1
						}):Play()
					end)
					v_u_144:GetMarkerReachedSignal("ROLL"):Connect(function()
						-- upvalues: (ref) v_u_17, (ref) p_u_96, (copy) p_u_130, (ref) v_u_121
						task.spawn(function()
							-- upvalues: (ref) v_u_17
							task.wait(4.1000000000000005)
							v_u_17:UpdateCFrame(workspace.CurrentCamera.CFrame)
						end)
						local v151, v152 = v_u_17:OpenLuckyBlock(p_u_96.id)
						p_u_130:Open(v151, v152)
						task.delay(4.3, function()
							-- upvalues: (ref) v_u_121
							v_u_121:Destroy()
						end)
					end)
					v_u_104:Destroy()
					v_u_105:Destroy()
					p_u_96.Instance:PivotTo(v_u_118:WaitForChild("HumanoidRootPart").CFrame)
					local v_u_153 = game:GetService("RunService").Heartbeat:Connect(function()
						-- upvalues: (ref) v_u_129, (copy) v_u_138
						v_u_129.CameraType = Enum.CameraType.Scriptable
						v_u_129.CFrame = v_u_138.camera.CFrame
					end)
					v143:Play()
					v_u_119:Cancel()
					p_u_96:ReturnToSpawn(true)
					v_u_144:Play()
					p_u_96.walkTrack:Stop()
					v145:Play()
					task.spawn(function()
						-- upvalues: (ref) v_u_22, (copy) v_u_153, (ref) v_u_118, (ref) v_u_117, (ref) v_u_121, (ref) v_u_129, (copy) v_u_144, (ref) p_u_96
						task.wait(8.4)
						v_u_22:ShowHUD()
						v_u_153:Disconnect()
						v_u_118:Destroy()
						v_u_117.CameraSubject = v_u_121.PrimaryPart
						v_u_129 = workspace.CurrentCamera
						v_u_129.CameraType = Enum.CameraType.Custom
						v_u_144:Stop()
						p_u_96.Instance:PivotTo(p_u_96.Instance:GetAttribute("END_CFRAME"))
					end)
				end
			end)
		end)
	else
		if p_u_96.id == "base13" then
			print("not found david")
		end
		p_u_96:ReturnToSpawn()
	end
end
function v23.Start(p_u_154)
	-- upvalues: (copy) v_u_7, (copy) v_u_12, (copy) v_u_2, (copy) v_u_29, (copy) v_u_25, (ref) v_u_17
	if p_u_154.Instance and p_u_154.Instance.PrimaryPart then
		p_u_154.Instance.PrimaryPart.Anchored = false
	end
	p_u_154.id = p_u_154.Instance:GetAttribute("BossId")
	p_u_154.config = v_u_7[p_u_154.id]
	p_u_154.spawn = v_u_12:WaitForChild(p_u_154.id)
	p_u_154.active = true
	p_u_154:_InitAnimations()
	p_u_154.idleTrack:Play()
	local v155 = workspace.BossTouchDetectors:WaitForChild(p_u_154.id)
	if v155 then
		p_u_154.touchConn = v155.Touched:Connect(function(p156)
			-- upvalues: (copy) p_u_154, (ref) v_u_2, (ref) v_u_29, (ref) v_u_25, (ref) v_u_17
			p_u_154:_CheckTouch(p156)
			local v157 = v_u_2:GetPlayerFromCharacter(p156.Parent)
			if v157 then
				if v157 == v_u_2.LocalPlayer then
					if p_u_154.chasing then
						if v157.Character:FindFirstChild("Humanoid").Health > 0 then
							p_u_154.attackTrack:Play()
							p_u_154:ReturnToSpawn()
							if p_u_154.Instance.Name == "base1" then
								v_u_29(v_u_25)
							end
							ScreenRednReward()
							v_u_17:Caught()
							v157.Character.PrimaryPart.Anchored = true
							v157.Character.Humanoid.Health = 0
						end
					else
						return
					end
				else
					return
				end
			else
				return
			end
		end)
		task.spawn(function()
			-- upvalues: (copy) p_u_154
			p_u_154:_RunTask()
		end)
		task.delay(1, function()
			-- upvalues: (copy) p_u_154
			if not p_u_154.chasing then
				p_u_154.Instance:WaitForChild("HumanoidRootPart").Anchored = true
			end
		end)
	else
		warn((("Could not find detector for boss %*"):format(p_u_154.id)))
	end
end
function v23.Stop(p158)
	if p158.touchConn then
		p158.touchConn:Disconnect()
		p158.touchConn = nil
	end
end
return v23

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.FakeBlockAnimationComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("SoundService")
local v_u_4 = require(v1.Configs.BossConfig)
local v5 = require(v1.Packages.Knit)
local v6 = require(v1.Packages.Component)
local v_u_7 = require(v1.Shared.VfxManager)
require(v1.Configs.BrainrotsConfig)
local v_u_8 = require(v1.Configs.MutationConfig)
require(v1.Configs.LuckyBlockConfig)
local v_u_9 = require(v1.Shared.WeatherUtils)
local v_u_10 = require(v1.Shared.TableUtils)
local v_u_11 = require(v1.GameShared.BrainrotUtils)
local v_u_12 = require(v1.Shared.RandomUtils)
local v_u_13 = v1:WaitForChild("Assets"):WaitForChild("LuckyBlock"):WaitForChild("OpenPlaceholder")
local v_u_14 = v1:WaitForChild("BrainrotModels")
v5.OnStart():andThen(function() end)
local v15 = v6.new({
	["Tag"] = "FakeBlock"
})
local function v_u_27(p16, p17)
	local v18 = p17:GetPivot()
	local v19
	if p17:IsA("Model") then
		local v20
		v20, v19 = p17:GetBoundingBox()
	else
		v19 = p17.Size
	end
	local v21 = v18.Position.Y - v19.Y / 2
	local v22 = p16:GetPivot()
	local v23 = p16:GetExtentsSize()
	local v24 = p16:GetPivot()
	local v25 = v22.Position.Y - v23.Y / 2
	local v26 = v21 + (v24.Position.Y - v25)
	p16:PivotTo(CFrame.new(v18.Position.X, v26, v18.Position.Z) * v18.Rotation)
end
function getTweenDuration(p28, p29)
	return 0.07 + 0.48000000000000004 * (p28 / p29) ^ 7
end
local function v_u_35(p30, p31)
	local v32 = p30:GetPivot()
	local v33 = p30.PrimaryPart.Size
	local v34 = v32.Position.Y - v33.Y / 2 + (p31:IsA("Model") and p31:GetExtentsSize() or p31.Size).Y / 2
	return CFrame.new(v32.Position.X, v34, v32.Position.Z) * v32.Rotation
end
local function v_u_47(p_u_36, p37, p38, p_u_39, p_u_40)
	-- upvalues: (copy) v_u_27, (copy) v_u_2
	local v_u_41 = Instance.new("NumberValue")
	v_u_41.Value = 0.001
	v_u_41.Parent = p_u_36
	local v_u_43 = v_u_41.Changed:Connect(function(p42)
		-- upvalues: (copy) p_u_36, (ref) v_u_27, (copy) p_u_39
		if p42 >= 0 then
			if p_u_36.PrimaryPart or p_u_36:IsA("BasePart") then
				p_u_36:ScaleTo(p42)
				v_u_27(p_u_36, p_u_39)
			end
		end
	end)
	local v44 = v_u_2:Create(v_u_41, p38, {
		["Value"] = p37
	})
	v44:Play()
	local function v_u_45()
		-- upvalues: (copy) v_u_43, (copy) v_u_41, (copy) p_u_36
		v_u_43:Disconnect()
		v_u_41:Destroy()
		if p_u_36 then
			p_u_36:Destroy()
		end
	end
	v44.Completed:Connect(function()
		-- upvalues: (copy) p_u_40, (ref) v_u_2, (copy) v_u_41, (copy) v_u_45, (copy) v_u_43, (copy) p_u_36
		if p_u_40 then
			local v46 = v_u_2:Create(v_u_41, p_u_40, {
				["Value"] = 0.001
			})
			v46:Play()
			v46.Completed:Connect(v_u_45)
		else
			task.wait(0.35)
			v_u_43:Disconnect()
			v_u_41:Destroy()
			if p_u_36 then
				p_u_36:Destroy()
			end
		end
	end)
end
local function v_u_53()
	-- upvalues: (copy) v_u_9, (copy) v_u_8
	local v48 = v_u_9.GetActiveWeathers()
	local v49 = #v48 > 0 and v48[1] or "base"
	local v50 = {}
	for v51, v52 in v_u_8 do
		if v52.chances then
			v50[v51] = v52.chances[v49] or 0
		else
			v50[v51] = 0
		end
	end
	return v50
end
local function v_u_58(p54, p_u_55)
	-- upvalues: (copy) v_u_10
	local v56
	if p_u_55 then
		v56 = v_u_10.Filter(p54, function(p57)
			-- upvalues: (copy) p_u_55
			return not table.find(p_u_55, p57.Name)
		end)
	else
		v56 = p54
	end
	if #v56 ~= 0 then
		p54 = v56
	end
	if #p54 ~= 0 then
		return p54[math.random(1, #p54)]
	end
	warn("No models left after exclusion!")
	return nil
end
function v15.Open(p59, p60, p61)
	-- upvalues: (copy) v_u_35, (copy) v_u_13, (copy) v_u_7, (copy) v_u_14, (copy) v_u_53, (copy) v_u_3, (copy) v_u_58, (copy) v_u_12, (copy) v_u_11, (copy) v_u_27, (copy) v_u_47
	local v62 = v_u_35(p59.Instance, v_u_13)
	for _, v63 in pairs(p59.Instance:GetDescendants()) do
		if v63:IsA("BasePart") or v63:IsA("Decal") then
			v63.Transparency = 1
		end
	end
	if p59.billboard then
		p59.billboard:Destroy()
	end
	v_u_7.Emit(p59.openVFX, 5)
	v_u_7.Emit(p59.partVFX, 5)
	local v64 = v_u_13:Clone()
	v64.Parent = p59.Instance
	v64:PivotTo(v62)
	local v65 = {}
	if p59.bossInfo and p59.bossInfo.pool then
		for _, v66 in p59.bossInfo.pool do
			local v67 = v_u_14:FindFirstChild(v66.id)
			if v67 then
				table.insert(v65, v67)
			end
		end
	end
	local v68 = v_u_53()
	local v69 = v_u_3.LuckyBlockSounds.Open:Clone()
	v69.Parent = p59.Instance.PrimaryPart
	v69.PlaybackSpeed = 1 + math.random(1, 3) / 10
	v69:Play()
	local v70 = v_u_3.LuckyBlockSounds.Roll:Clone()
	v70.Parent = p59.Instance.PrimaryPart
	local v71 = nil
	for v72 = 1, 45 do
		local v73 = v71 and { v71 } or nil
		if v72 == 45 then
			table.insert(v73, p60)
		end
		local v74 = v_u_58(v65, v73)
		local v75 = v_u_12:GetWeightedChoice(v68)
		local v76 = v_u_14:FindFirstChild((v_u_11.GetModelName(v74.Name, v75))) or v74
		v71 = v74.Name
		local v77 = v76:Clone()
		v77:AddTag("BrainrotFakeAnimation")
		v77:SetAttribute("BrainrotType", v74.Name)
		for _, v78 in ipairs(v77:GetChildren()) do
			if v78:IsA("BasePart") then
				v78.Anchored = true
			end
		end
		v77.Parent = v64
		local v79 = v77:GetScale()
		v77:ScaleTo(0.001)
		v_u_27(v77, v64)
		if v70 then
			v70.PlaybackSpeed = 0.9 + math.random(1, 3) / 10
			v70:Play()
		end
		local v80 = getTweenDuration(v72, 45) * 1
		local v81 = v80 * 0.7
		local v82 = v80 * 0.3
		v_u_47(v77, v79, TweenInfo.new(v81, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), v64, (TweenInfo.new(v82, Enum.EasingStyle.Sine, Enum.EasingDirection.In)))
		task.wait(v80 * 0.42)
	end
	local v_u_83 = v_u_3.LuckyBlockSounds.Recive:Clone()
	v_u_83.Parent = p59.Instance.PrimaryPart
	local v84 = v_u_14:FindFirstChild((v_u_11.GetModelName(p60, p61)))
	if v84 then
		local v85 = v84:Clone()
		v85:AddTag("BrainrotFakeAnimation")
		v85:SetAttribute("BrainrotType", p60)
		v85.Parent = v64
		for _, v86 in ipairs(v85:GetChildren()) do
			if v86:IsA("BasePart") then
				v86.Anchored = true
			end
		end
		local v87 = v85:GetScale()
		v85:ScaleTo(0.001)
		v_u_27(v85, v64)
		task.delay(0.69, function()
			-- upvalues: (copy) v_u_83
			if v_u_83 then
				v_u_83.PlaybackSpeed = 1 + math.random(1, 4) / 10
				v_u_83:Play()
			end
		end)
		v_u_47(v85, v87, TweenInfo.new(getTweenDuration(1, 1) * 2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), v64)
	end
end
function v15.Construct(p88)
	-- upvalues: (copy) v_u_4
	p88.bossId = p88.Instance:GetAttribute("BossId")
	p88.isOpening = false
	p88.hrp = p88.Instance:WaitForChild("HumanoidRootPart")
	p88.openVFX = p88.Instance.VFX:WaitForChild("OpenVFX")
	p88.partVFX = p88.Instance:WaitForChild("VFX")
	p88.bossInfo = v_u_4[p88.bossId]
end
function v15.Start(p89)
	if p89.Instance:GetAttribute("IsOpening") then
		p89.isOpening = true
		for _, v90 in pairs(p89.Instance:GetDescendants()) do
			if v90:IsA("BasePart") or v90:IsA("Decal") then
				v90.Transparency = 1
			end
		end
	end
end
return v15

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.PlayerSkinAnimationComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
local v2 = require(v1.Packages.Component)
local v3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.Shared.AnimationManager)
local v_u_5 = require(v1.Configs.PlayerSkinConfig)
v3.OnStart():andThen(function() end)
local v6 = v2.new({
	["Tag"] = "PlayerSkin"
})
function v6.Start(p7)
	-- upvalues: (copy) v_u_5, (copy) v_u_4
	local v8 = p7.Instance:GetAttribute("SkinType")
	local v9 = v_u_5[v8]
	if v9 then
		v_u_4.Get(p7.Instance):Play(v9.idleAnimation)
	else
		warn((("Could not find skin info for %*"):format(v8)))
	end
end
function v6.Stop(_) end
return v6

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.PlaytimeMissionComponent
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("TweenService")
local v4 = require(v1.Packages.Component)
local v_u_5 = require(v1.Packages.Knit)
local v_u_6 = v1.Assets.PlaytimeMissionTemplate
local v_u_7 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
v_u_5.OnStart():andThen(function()
	-- upvalues: (ref) v_u_8, (copy) v_u_5, (ref) v_u_9, (ref) v_u_10
	v_u_8 = v_u_5.GetController("WindowController")
	v_u_9 = v_u_5.GetController("ReplicaController")
	v_u_10 = v_u_5.GetService("RewardService")
end)
local v11 = v4.new({
	["Tag"] = "PlaytimeMissionPlaceholder"
})
function v11.AnimateSign(p12)
	-- upvalues: (copy) v_u_3, (copy) v_u_7
	p12:StopAnimation()
	p12.finishIndicator.Transparency = 0
	p12.finishIndicator.Position = p12.originalFinishIndicatorPos
	local v13 = {
		["Position"] = p12.originalFinishIndicatorPos + Vector3.new(0, 1.2, 0)
	}
	p12.floatTween = v_u_3:Create(p12.finishIndicator, v_u_7, v13)
	p12.floatTween:Play()
end
function v11.StopAnimation(p14)
	if p14.floatTween then
		p14.floatTween:Cancel()
		p14.floatTween = nil
	end
	p14.finishIndicator.Transparency = 1
end
function v11.Start(p_u_15)
	-- upvalues: (copy) v_u_6, (ref) v_u_8, (ref) v_u_10, (ref) v_u_9, (copy) v_u_2
	local v_u_16 = p_u_15.Instance.Parent.Parent
	local function v_u_19()
		-- upvalues: (copy) p_u_15, (ref) v_u_6, (ref) v_u_8, (ref) v_u_10, (ref) v_u_9
		if p_u_15.triggerConn then
			p_u_15.triggerConn:Disconnect()
			p_u_15.triggerConn = nil
		end
		if p_u_15.eligableConn then
			p_u_15.eligableConn:Disconnect()
			p_u_15.eligableConn = nil
		end
		if p_u_15.claimedConn then
			p_u_15.claimedConn:Disconnect()
			p_u_15.claimedConn = nil
		end
		local v17 = v_u_6:Clone()
		v17:PivotTo(p_u_15.Instance:GetPivot())
		p_u_15.finishIndicator = v17:FindFirstChild("FinishedCraftIndicator")
		p_u_15.originalFinishIndicatorPos = p_u_15.finishIndicator.Position
		p_u_15:StopAnimation()
		v17.Parent = p_u_15.Instance
		p_u_15.triggerConn = v17:FindFirstChild("Prox"):FindFirstChild("PROX"):FindFirstChild("ProximityPrompt").Triggered:Connect(function()
			-- upvalues: (ref) v_u_8
			if v_u_8.currentWindow ~= "FreeRewardPlayTime" then
				v_u_8:SetCurrentWindow("FreeRewardPlayTime")
			end
		end)
		p_u_15.eligableConn = v_u_10.OnLimitedFinished:Connect(function()
			-- upvalues: (ref) p_u_15
			p_u_15:AnimateSign()
		end)
		p_u_15.claimedConn = v_u_9:GetReplica():OnSet({ "LimitedTimeReward" }, function(p18)
			-- upvalues: (ref) p_u_15
			if p18.Claimed then
				p_u_15:StopAnimation()
			end
		end)
	end
	if v_u_16:GetAttribute("Owner") == v_u_2.LocalPlayer.UserId then
		v_u_19()
	else
		p_u_15.ownerConn = v_u_16:GetAttributeChangedSignal("Owner"):Connect(function()
			-- upvalues: (copy) v_u_16, (ref) v_u_2, (copy) p_u_15, (copy) v_u_19
			if v_u_16:GetAttribute("Owner") == v_u_2.LocalPlayer.UserId then
				if p_u_15.ownerConn then
					p_u_15.ownerConn:Disconnect()
					p_u_15.ownerConn = nil
				end
				v_u_19()
			end
		end)
	end
end
function v11.Stop(p20)
	if p20.ownerConn then
		p20.ownerConn:Disconnect()
		p20.ownerConn = nil
	end
	if p20.triggerConn then
		p20.triggerConn:Disconnect()
		p20.triggerConn = nil
	end
	if p20.eligableConn then
		p20.eligableConn:Disconnect()
		p20.eligableConn = nil
	end
	if p20.claimedConn then
		p20.claimedConn:Disconnect()
		p20.claimedConn = nil
	end
end
return v11

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.UIComponents.Button
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
game:GetService("CollectionService")
local v2 = game:GetService("UserInputService")
local v_u_3 = require(game.ReplicatedStorage.Packages.Knit)
local v4 = require(game.ReplicatedStorage.Packages.Component)
local v_u_5 = require(game.ReplicatedStorage.Shared.PlatformUtils)
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
v_u_3.OnStart():andThen(function()
	-- upvalues: (ref) v_u_6, (copy) v_u_3, (ref) v_u_7, (ref) v_u_8, (ref) v_u_9, (ref) v_u_10
	v_u_6 = v_u_3.GetController("WindowController")
	v_u_7 = v_u_3.GetController("SoundController")
	v_u_8 = v_u_3.GetController("ReplicaController")
	v_u_9 = v_u_3.GetController("NotificationController")
	v_u_10 = v_u_8:GetReplica()
end)
local v_u_11 = TweenInfo.new(0.05, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local v_u_12 = {}
local v13 = v4.new({
	["Tag"] = "Button",
	["Ancestors"] = { game.Players.LocalPlayer.PlayerGui }
})
function v13.Construct(p14)
	-- upvalues: (copy) v_u_5
	local v15 = p14.Instance:GetAttribute("FakeButton")
	if p14.Instance:IsA("TextButton") or (p14.Instance:IsA("ImageButton") or v15) then
		if v15 then
			p14.Button = nil
		else
			p14.Button = p14.Instance
		end
	else
		local v16 = Instance.new("ImageButton")
		v16.Name = "Button"
		v16.Image = ""
		v16.BackgroundTransparency = 1
		v16.AnchorPoint = Vector2.new(0.5, 0.5)
		v16.Position = UDim2.fromScale(0.5, 0.5)
		v16.Size = UDim2.fromScale(1, 1)
		v16.Parent = p14.Instance
		p14.Button = v16
	end
	p14.Locked = p14.Instance:GetAttribute("Locked")
	p14.OriginalSize = p14.Instance.Size
	p14.Hovering = false
	p14.SoundName = "Click"
	if p14.Instance:GetAttribute("ClickSound") then
		p14.SoundName = p14.Instance:GetAttribute("ClickSound")
	end
	local v17 = v_u_5:GetGamepadType()
	if v17 then
		local v18 = v17 == "Sony" and "SONI" or (v17 == "Xbox" and "XBOX" or v17)
		local v19 = p14.Instance:FindFirstChild(v18 .. "_CONTROL", true)
		if v19 then
			v19.Visible = true
		end
	end
	p14.UIScale = p14.Instance:FindFirstChild("UIScale")
	if not p14.UIScale then
		p14.UIScale = Instance.new("UIScale")
		p14.UIScale.Parent = p14.Instance
	end
end
function v13.Activate(p_u_20)
	-- upvalues: (ref) v_u_7, (copy) v_u_1, (copy) v_u_11, (ref) v_u_6
	v_u_7:PlaySound(p_u_20.SoundName)
	if p_u_20.Instance:GetAttribute("SpecialSound") then
		v_u_7:PlaySound(p_u_20.Instance:GetAttribute("SpecialSound"))
	end
	v_u_1:Create(p_u_20.UIScale, v_u_11, {
		["Scale"] = 1
	}):Play()
	task.delay(0.05, function()
		-- upvalues: (copy) p_u_20, (ref) v_u_1, (ref) v_u_11
		if p_u_20.Hovering then
			v_u_1:Create(p_u_20.UIScale, v_u_11, {
				["Scale"] = 1.05
			}):Play()
		end
	end)
	if p_u_20.Highlight then
		p_u_20.Highlight:Destroy()
		p_u_20.Highlight = nil
	end
	if p_u_20.Instance:GetAttribute("Window") then
		v_u_6:SetCurrentWindow(p_u_20.Instance:GetAttribute("Window"))
	end
	if p_u_20.Callbacks then
		for _, v21 in pairs(p_u_20.Callbacks) do
			v21()
		end
	end
end
function v13.MouseEnter(p22)
	-- upvalues: (copy) v_u_1, (copy) v_u_11, (ref) v_u_7
	local v23 = {
		["Scale"] = p22.Instance:GetAttribute("HoverScale") or 1.05
	}
	v_u_1:Create(p22.UIScale, v_u_11, v23):Play()
	if p22.Instance:GetAttribute("Hover") then
		for _, v24 in pairs(p22.Instance:GetDescendants()) do
			if v24:IsA("ImageLabel") or v24:IsA("ImageButton") then
				v24.ImageColor3 = Color3.new(0.8, 0.8, 0.8)
			end
		end
	end
	v_u_7:PlaySound("Hover")
	p22.Hovering = true
end
function v13.MouseLeave(p25)
	-- upvalues: (copy) v_u_1, (copy) v_u_11
	v_u_1:Create(p25.UIScale, v_u_11, {
		["Scale"] = 1
	}):Play()
	if p25.Instance:GetAttribute("Hover") then
		for _, v26 in pairs(p25.Instance:GetDescendants()) do
			if v26:IsA("ImageLabel") or v26:IsA("ImageButton") then
				v26.ImageColor3 = Color3.new(1, 1, 1)
			end
		end
	end
	p25.Hovering = false
end
function v13.MouseButton1Down(p27)
	-- upvalues: (copy) v_u_1, (copy) v_u_11
	v_u_1:Create(p27.UIScale, v_u_11, {
		["Scale"] = 0.95
	}):Play()
end
function v13.Start(p_u_28)
	-- upvalues: (ref) v_u_10, (copy) v_u_12
	if p_u_28.Locked and v_u_10.Data.Currencies.Rebirths < p_u_28.Locked then
		p_u_28.Instance.Visible = false
	end
	if p_u_28.Button then
		p_u_28.Button.MouseEnter:Connect(function()
			-- upvalues: (copy) p_u_28
			p_u_28:MouseEnter()
		end)
		p_u_28.Button.MouseLeave:Connect(function()
			-- upvalues: (copy) p_u_28
			p_u_28:MouseLeave()
		end)
		p_u_28.Button.MouseButton1Down:Connect(function()
			-- upvalues: (copy) p_u_28
			p_u_28:MouseButton1Down()
		end)
		p_u_28.Button.Activated:Connect(function()
			-- upvalues: (copy) p_u_28
			p_u_28:Activate()
		end)
	end
	local v29 = p_u_28.Instance:GetAttribute("ConsoleKey")
	if v29 then
		v_u_12[v29] = v_u_12[v29] or {}
		local v30 = v_u_12[v29]
		table.insert(v30, p_u_28)
	end
end
function v13.AddCallback(p31, p32)
	if p31.Callbacks then
		local v33 = p31.Callbacks
		table.insert(v33, p32)
	else
		p31.Callbacks = { p32 }
	end
end
function v13.RemoveCallback(p34, p35)
	if p34.Callbacks then
		local v36 = table.find(p34.Callbacks, p35)
		if v36 ~= -1 then
			table.remove(p34.Callbacks, v36)
		end
	else
		return
	end
end
function v13.OverrideSound(p37, p38)
	p37.SoundName = p38
end
function v13.HighlightButton(p39, p40, p41, p42)
	-- upvalues: (copy) v_u_1
	if not p39.Highlight then
		local v43 = Instance.new("ImageLabel")
		v43.Image = "rbxassetid://70860668777488"
		local v44 = p42 or 1
		v43.Size = UDim2.fromScale(1.8 * v44, 1.8 * v44)
		v43.BackgroundTransparency = 1
		v43.AnchorPoint = Vector2.new(0.5, 0.5)
		v43.Parent = p39.Instance
		v43.ZIndex = 10000
		Instance.new("UIAspectRatioConstraint").Parent = v43
		local v45 = p41 or Vector2.new(0, 0)
		local v46, v47
		if p40 == "Down" then
			v43.Rotation = 0
			v46 = UDim2.new(0.5 + v45.X, 0, -0.5 + v45.Y, 0)
			v47 = UDim2.new(0.5 + v45.X, 0, -0.7 + v45.Y, 0)
		elseif p40 == "Up" then
			v43.Rotation = 180
			v46 = UDim2.new(0.5 + v45.X, 0, 1.5 + v45.Y, 0)
			v47 = UDim2.new(0.5 + v45.X, 0, 1.7 + v45.Y, 0)
		elseif p40 == "Left" then
			v43.Rotation = 90
			v46 = UDim2.new(1.5 + v45.X, 0, 0.5 + v45.Y, 0)
			v47 = UDim2.new(1.7 + v45.X, 0, 0.5 + v45.Y, 0)
		else
			if p40 ~= "Right" then
				warn("Invalid pointing direction")
				return
			end
			v43.Rotation = -90
			v46 = UDim2.new(-0.5 + v45.X, 0, 0.5 + v45.Y, 0)
			v47 = UDim2.new(-0.7 + v45.X, 0, 0.5 + v45.Y, 0)
		end
		v43.Rotation = v43.Rotation + 180
		v43.Position = v46
		v_u_1:Create(v43, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
			["Position"] = v47
		}):Play()
		p39.Highlight = v43
	end
end
function v13.DestroyHighlight(p48)
	if p48.Highlight then
		p48.Highlight:Destroy()
		p48.Highlight = nil
	end
end
local function v_u_50(p49)
	while p49 do
		if p49:IsA("GuiObject") and not p49.Visible then
			return false
		end
		p49 = p49.Parent
	end
	return true
end
v2.InputBegan:Connect(function(p51, p52)
	-- upvalues: (copy) v_u_12, (copy) v_u_50
	if not p52 then
		local v53 = v_u_12[p51.KeyCode.Name]
		if v53 then
			for _, v54 in ipairs(v53) do
				if v54 and v54.Activate then
					print(v54.Instance)
					if not v_u_50(v54.Instance) then
						return
					end
					print("activate")
					v54:Activate()
				end
			end
		end
	end
end)
return v13

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.UIComponents.CloseButton
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("UserInputService")
local v2 = require(game.ReplicatedStorage.Packages.Knit)
local v3 = require(game.ReplicatedStorage.Packages.Component)
local v_u_4 = require(script.Parent.Button)
local v_u_5 = v2.GetController("WindowController")
local v6 = {
	["Tag"] = "CloseButton",
	["Ancestors"] = { v2.Player.PlayerGui }
}
local v7 = v3.new(v6)
function v7.Construct(p8)
	-- upvalues: (copy) v_u_1
	if p8.Instance.Parent then
		p8.Button = p8.Instance:FindFirstChild("Button") or p8.Instance
		if game:GetService("GuiService"):IsTenFootInterface() then
			local v9 = v_u_1:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonA" and "XBOX" or "SONI"
			local v10 = p8.Instance:FindFirstChild(v9 .. "_CONTROL", true)
			if v10 then
				v10.Visible = true
				local v11 = p8.Instance:FindFirstChild("ImageLabel")
				local v12 = v11 and v11:FindFirstChild("ImageLabel")
				if v12 then
					v12.Visible = true
				end
			end
		end
	end
end
function v7.Start(p13)
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	if p13.Instance.Parent then
		v_u_4:WaitForInstance(p13.Instance, 3):andThen(function(p14)
			-- upvalues: (ref) v_u_5
			p14:AddCallback(function()
				-- upvalues: (ref) v_u_5
				v_u_5:SetCurrentWindow()
			end)
		end):catch(warn)
	end
end
v_u_1.InputBegan:Connect(function(p15, p16)
	-- upvalues: (copy) v_u_1, (copy) v_u_5
	if v_u_1.GamepadEnabled then
		if not p16 and p15.KeyCode == Enum.KeyCode.ButtonB then
			v_u_5:SetCurrentWindow()
		end
	end
end)
return v7

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.UIComponents.Currency
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
game:GetService("CollectionService")
local v2 = require(game.ReplicatedStorage.Packages.Knit)
local v3 = require(game.ReplicatedStorage.Packages.Component)
local v_u_4 = require(game.ReplicatedStorage.Shared.AbbreviationUtils)
local v_u_5 = v2.GetController("ReplicaController"):GetReplica()
local v_u_6 = {
	["Cash"] = { "Currencies", "Cash" }
}
local v_u_7 = {
	["Cash"] = "$"
}
({}).Cash = false
local v_u_8 = 1000000000
local v9 = v3.new({
	["Tag"] = "Currency",
	["Ancestors"] = { game.Players.LocalPlayer.PlayerGui }
})
function v9.Construct(p_u_10)
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_7, (copy) v_u_6, (ref) v_u_8, (copy) v_u_1
	local v_u_11 = v_u_5.Data[p_u_10.Instance:GetAttribute("Alternative") or "Currencies"][p_u_10.Instance.Name]
	local v_u_12 = p_u_10.Instance
	local v_u_13 = p_u_10.Instance.Name
	if p_u_10.Instance:GetAttribute("DoubleText") then
		p_u_10.DoubleText = true
	end
	if p_u_10.Instance:GetAttribute("Plus") then
		p_u_10.Plus = true
	end
	if p_u_10.Instance:GetAttribute("AdditionSuffix") then
		v_u_12.Text = v_u_4:AbbreviateNumber(v_u_11) .. (v_u_7[v_u_13] or "")
	else
		v_u_12.Text = v_u_4:AbbreviateNumber(v_u_11) .. (v_u_7[v_u_13] or "")
	end
	if p_u_10.DoubleText then
		v_u_12[v_u_13].Text = v_u_12.Text
	end
	v_u_5:OnSet(v_u_6[v_u_13], function(p_u_14)
		-- upvalues: (ref) v_u_11, (copy) p_u_10, (ref) v_u_4, (ref) v_u_8, (copy) v_u_12, (ref) v_u_1, (ref) v_u_7, (copy) v_u_13
		task.spawn(function()
			-- upvalues: (copy) p_u_14, (ref) v_u_11, (ref) p_u_10, (ref) v_u_4, (ref) v_u_8, (ref) v_u_12, (ref) v_u_1, (ref) v_u_7, (ref) v_u_13
			local v15 = p_u_14 - v_u_11
			if p_u_10.Plus then
				if v15 > 0 then
					local v_u_16 = script.Plus:Clone()
					v_u_16.Cash.Text = "+" .. v_u_4:AbbreviateNumber(v15) .. "$"
					v_u_16.Cash.Cash.Text = v_u_16.Cash.Text
					v_u_16.LayoutOrder = -v_u_8
					v_u_16.Parent = v_u_12.Parent.Parent.Parent
					task.spawn(function()
						-- upvalues: (copy) v_u_16, (ref) v_u_1
						task.wait(3.23)
						game.Debris:AddItem(v_u_16, 0.72)
						v_u_1:Create(v_u_16.Cash, TweenInfo.new(0.72, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							["TextTransparency"] = 1
						}):Play()
						v_u_1:Create(v_u_16.Cash.UIStroke, TweenInfo.new(0.72, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							["Transparency"] = 1
						}):Play()
						v_u_1:Create(v_u_16.Cash.Cash, TweenInfo.new(0.72, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							["TextTransparency"] = 1
						}):Play()
						v_u_1:Create(v_u_16.Cash.Cash.UIStroke, TweenInfo.new(0.72, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							["Transparency"] = 1
						}):Play()
					end)
				else
					local v_u_17 = script.Minus:Clone()
					v_u_17.Cash.Text = v_u_4:AbbreviateNumber(v15) .. "$"
					v_u_17.Cash.Cash.Text = v_u_17.Cash.Text
					v_u_17.LayoutOrder = -v_u_8
					v_u_17.Parent = v_u_12.Parent.Parent.Parent
					task.spawn(function()
						-- upvalues: (copy) v_u_17, (ref) v_u_1
						task.wait(3.23)
						game.Debris:AddItem(v_u_17, 0.72)
						v_u_1:Create(v_u_17.Cash, TweenInfo.new(0.72, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							["TextTransparency"] = 1
						}):Play()
						v_u_1:Create(v_u_17.Cash.UIStroke, TweenInfo.new(0.72, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							["Transparency"] = 1
						}):Play()
						v_u_1:Create(v_u_17.Cash.Cash, TweenInfo.new(0.72, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							["TextTransparency"] = 1
						}):Play()
						v_u_1:Create(v_u_17.Cash.Cash.UIStroke, TweenInfo.new(0.72, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							["Transparency"] = 1
						}):Play()
					end)
				end
				v_u_8 = v_u_8 - 1
			end
			v_u_12.Text = v_u_4:AbbreviateNumber(p_u_14) .. (v_u_7[v_u_13] or "")
			if p_u_10.DoubleText then
				v_u_12[v_u_13].Text = v_u_12.Text
			end
			v_u_11 = p_u_14
		end)
	end)
end
return v9

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.UIComponents.MonetizationButton
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("MarketplaceService")
local v3 = game:GetService("UserInputService")
local v4 = require(game.ReplicatedStorage.Packages.Knit)
local v5 = require(game.ReplicatedStorage.Packages.Component)
local v_u_6 = v4.GetController("SoundController")
v4.GetService("MonetizationService")
local v_u_7 = require(script.Parent.Button)
local v_u_8 = require(game.ReplicatedStorage.Configs.MonetizationConfig)
local v9 = game.Players.LocalPlayer.PlayerGui
local v10 = v4.GetController("ReplicaController")
local v_u_11 = v4.GetController("MonetizationController")
local v_u_12 = v10:GetReplica()
local v_u_13 = {}
local v14 = v5.new({
	["Tag"] = "MonetizationButton",
	["Ancestors"] = { v9 }
})
function v14.TurnOwned(p15)
	p15.Owned = true
	local v16 = p15.Instance:FindFirstChild("Buttons")
	if v16 then
		local v17 = v16:FindFirstChild("Owned")
		if v17 then
			v17.Visible = true
			p15.Instance:FindFirstChild("Buttons"):FindFirstChild("NotOwned").Visible = false
		end
	else
		local v18 = p15.Instance.Parent:FindFirstChild("Owned")
		if v18 then
			v18.Visible = true
			p15.Instance.Visible = false
		end
	end
	if p15.Instance:GetAttribute("HideSuccess") then
		p15.Instance:FindFirstChildOfClass("TextLabel").Text = "Owned"
	end
end
function v14.UpdatePrice(p19)
	-- upvalues: (copy) v_u_11
	if not p19.Instance:GetAttribute("DisableUpdate") then
		local v20 = p19.Instance:FindFirstChild("Price", true)
		if v20 then
			v20.Text = v_u_11:GetMonetizationPrice(p19.ID) or (p19.info.items and p19.info.items[p19.Instance:GetAttribute("Name")].defaultPrice or p19.info.defaultPrice)
		end
	end
end
function v14.Construct(p_u_21)
	-- upvalues: (copy) v_u_1, (copy) v_u_7, (copy) v_u_8, (copy) v_u_12
	if p_u_21.Instance.Parent then
		if v_u_1:HasTag(p_u_21.Instance, "Button") then
			v_u_7:WaitForInstance(p_u_21.Instance):andThen(function(p22)
				p22:OverrideSound("PromotAnItem")
			end):await()
		end
		p_u_21.Button = p_u_21.Instance:FindFirstChild("Button") or p_u_21.Instance
		p_u_21.validationFunc = nil
		for v23, v24 in pairs(v_u_8) do
			if v23 == p_u_21.Instance.Name then
				if v24.id then
					p_u_21.ID = v24.id
				elseif v24.items then
					p_u_21.ID = v24.items[p_u_21.Instance:GetAttribute("Name")]
					if p_u_21.ID then
						p_u_21.ID = p_u_21.ID.id
					end
				end
				p_u_21.info = v24
			end
		end
		if p_u_21.ID then
			p_u_21:UpdatePrice()
			if p_u_21.info.fakeGamepass then
				local v25 = v_u_12.Data.PurchaseCounts
				local v26 = p_u_21.ID
				if v25[tostring(v26)] then
					p_u_21:TurnOwned()
				end
				local v27 = v_u_12
				local v28 = {}
				local v29 = p_u_21.ID
				__set_list(v28, 1, {"PurchaseCounts", (tostring(v29))})
				v27:OnSet(v28, function(_)
					-- upvalues: (copy) p_u_21
					p_u_21:TurnOwned()
				end)
			end
		end
	else
		return
	end
end
function v14.AddValidationFunction(p30, p31)
	p30.validationFunc = p31
end
function v14.Activate(p32)
	-- upvalues: (copy) v_u_11, (copy) v_u_6, (copy) v_u_2
	if p32.validationFunc and not p32.validationFunc() then
		return
	elseif p32.info.type == "Gamepass" then
		if game.Players.LocalPlayer:GetAttribute("GiftingTargetId") and p32.info.giftProductId then
			v_u_11:ShowPendingPurchase()
			v_u_6:PlaySound("PromotAnItem")
			v_u_2:PromptProductPurchase(game.Players.LocalPlayer, p32.info.giftProductId)
			return
		elseif not p32.Owned then
			v_u_11:ShowPendingPurchase()
			v_u_6:PlaySound("PromotAnItem")
			v_u_2:PromptGamePassPurchase(game.Players.LocalPlayer, p32.ID)
		end
	elseif p32.ID then
		v_u_11:ShowPendingPurchase()
		v_u_6:PlaySound("PromotAnItem")
		v_u_2:PromptProductPurchase(game.Players.LocalPlayer, p32.ID)
	end
end
function v14.Start(p_u_33)
	-- upvalues: (copy) v_u_13, (copy) v_u_12
	if p_u_33.Instance.Parent then
		local v34 = p_u_33.Instance:GetAttribute("ConsoleKey")
		if v34 then
			v_u_13[v34] = v_u_13[v34] or {}
			local v35 = v_u_13[v34]
			table.insert(v35, p_u_33)
		end
		p_u_33.Button.Activated:Connect(function()
			-- upvalues: (copy) p_u_33
			p_u_33:Activate()
		end)
		local v36 = v_u_12.Data.Gamepasses
		local v37 = p_u_33.ID
		if v36[tostring(v37)] then
			p_u_33:TurnOwned()
		else
			local v38 = v_u_12
			local v39 = {}
			local v40 = p_u_33.ID
			__set_list(v39, 1, {"Gamepasses", (tostring(v40))})
			v38:OnSet(v39, function(_)
				-- upvalues: (copy) p_u_33
				p_u_33:TurnOwned()
			end)
		end
	else
		return
	end
end
local function v_u_42(p41)
	while p41 do
		if p41:IsA("GuiObject") and not p41.Visible then
			return false
		end
		p41 = p41.Parent
	end
	return true
end
v3.InputBegan:Connect(function(p43, p44)
	-- upvalues: (copy) v_u_13, (copy) v_u_42
	if not p44 then
		local v45 = v_u_13[p43.KeyCode.Name]
		if v45 then
			for _, v46 in ipairs(v45) do
				if v46 and v46.Activate then
					if not v_u_42(v46.Instance) then
						return
					end
					v46:Activate()
				end
			end
		end
	end
end)
return v14

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Components.UIComponents.Tooltip
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Knit)
local v3 = require(v1.Packages.Component)
local v_u_4 = nil
v_u_2.OnStart():andThen(function()
	-- upvalues: (ref) v_u_4, (copy) v_u_2
	v_u_4 = v_u_2.GetController("WindowController")
end)
local v5 = v3.new({
	["Tag"] = "Tooltip",
	["Ancestors"] = { game.Players.LocalPlayer.PlayerGui }
})
function v5._OnHover(p6)
	-- upvalues: (ref) v_u_4
	if p6.hideIfWindowOpen and v_u_4:GetCurrentWindow() ~= nil then
		return
	elseif not p6.Instance:GetAttribute("TooltipDisabled") then
		local v7 = p6.Instance:FindFirstChild("Tooltip")
		if v7 then
			v7.Visible = true
		end
	end
end
function v5._OnHoverEnd(p8)
	local v9 = p8.Instance:FindFirstChild("Tooltip")
	if v9 then
		v9.Visible = false
	end
end
function v5.Construct(p10)
	p10.hideIfWindowOpen = p10.Instance:GetAttribute("HideTooltipIfWindowOpen")
end
function v5.Start(p_u_11)
	p_u_11.Instance.MouseEnter:Connect(function()
		-- upvalues: (copy) p_u_11
		p_u_11:_OnHover()
	end)
	p_u_11.Instance.MouseLeave:Connect(function()
		-- upvalues: (copy) p_u_11
		p_u_11:_OnHoverEnd()
	end)
end
return v5

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.DailyRewardController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Knit)
require(v1.Packages.topbarplus)
local v_u_3 = require(v1.Configs.DailyRewardConfig)
require(v1.Configs.CurrencyConfig)
local v_u_4 = require(v1.Shared.AbbreviationUtils)
local v_u_5 = script.DailyRewards
local v6 = v_u_2.CreateController({
	["Name"] = "DailyRewardController"
});
({}).Currency = require(game.ReplicatedStorage.Configs.CurrencyConfig)
function v6.KnitStart(_)
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	v_u_2.GetController("WindowController")
	local v7 = v_u_2.GetController("ReplicaController")
	local v_u_8 = v_u_2.GetService("DailyRewardService")
	local v9 = require(v_u_2.UIComponents.Button)
	local v10 = v7:GetReplica()
	local v_u_11 = v_u_2.PlayerGui:WaitForChild("HUD"):WaitForChild("Buffs"):WaitForChild("Daily")
	v_u_5.Parent = v_u_2.PlayerGui:WaitForChild("Windows")
	local function v19(p12)
		-- upvalues: (ref) v_u_3, (copy) v_u_11, (ref) v_u_5, (ref) v_u_4
		local v13 = p12.Week > 0 and v_u_3.REPEATING_WEEK or v_u_3.FIRST_WEEK
		for v14 = 1, 7 do
			local v15 = v13[v14]
			local v16 = v_u_5.DayHolder["Day" .. v14]
			if v14 ~= 7 then
				if v15.rewardHandler == "Currency" then
					local v17 = v15.rewardData.amount or 1
					v16.Frame.Background.Amount.Text = ("x%*"):format((v_u_4:AbbreviateNumber(v17)))
				else
					v16.Frame.Background.Amount.Visible = false
				end
			end
			v16.Frame.Background.Actions.Claim.Visible = true
			local v18
			if p12.LastClaimedDate and os.time() - p12.LastClaimedDate < 86400 then
				v18 = false
			else
				v_u_11.Frame.Visible = true
				v18 = true
			end
			if v18 and p12.LastClaimedDay + 1 == v14 then
				v16.Frame.Background.Actions.Claim.Visible = true
				v16.Frame.Background.Actions.Locked.Visible = false
				v16.Frame.Background.Actions.Claimed.Visible = false
			elseif v14 <= p12.LastClaimedDay then
				v16.Frame.Background.Actions.Claimed.Visible = true
				v16.Frame.Background.Actions.Locked.Visible = false
				v16.Frame.Background.Actions.Claim.Visible = false
			else
				v16.Frame.Background.Actions.Locked.Visible = true
				v16.Frame.Background.Actions.Claimed.Visible = false
				v16.Frame.Background.Actions.Claim.Visible = false
			end
		end
	end
	for v_u_20 = 1, 7 do
		v9:WaitForInstance(v_u_5.DayHolder["Day" .. v_u_20]):andThen(function(p21)
			-- upvalues: (copy) v_u_8, (copy) v_u_20, (copy) v_u_11
			p21:AddCallback(function()
				-- upvalues: (ref) v_u_8, (ref) v_u_20, (ref) v_u_11
				if v_u_8:ClaimReward(v_u_20) == true then
					v_u_11.Frame.Visible = false
				end
			end)
		end)
	end
	v19(v10.Data.DailyReward)
	v10:OnSet({ "DailyReward" }, v19)
end
return v6

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.MonetizationController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("ReplicatedFirst")
local v_u_3 = game:GetService("MarketplaceService")
local v_u_4 = game:GetService("TweenService")
local v5 = require(v1.Packages.Knit)
local v_u_6 = require(v2.MonetizationPrefetchClient.MonetizationPrefetch)
local v_u_7 = game.Players.LocalPlayer
local v8 = v5.CreateController({
	["Name"] = "MonetizationController"
})
local v_u_9 = v1:WaitForChild("Assets"):WaitForChild("PendingPurchase"):WaitForChild("PendingPurchaseUi")
local v_u_10 = {}
local v_u_11 = false
function v8.GetMonetizationPrice(_, p12)
	-- upvalues: (ref) v_u_10
	return v_u_10[p12]
end
function v8.IsPendingPurchase(_)
	-- upvalues: (ref) v_u_11
	return v_u_11
end
function v8.ShowPendingPurchase(_)
	-- upvalues: (ref) v_u_11, (copy) v_u_7, (copy) v_u_9, (copy) v_u_4
	if v_u_11 then
		return
	else
		v_u_11 = true
		local v13 = v_u_7.PlayerGui:FindFirstChild("PendingPurchaseUi")
		if v13 then
			v13:Destroy()
		end
		local v14 = v_u_9:Clone()
		v14.Parent = v_u_7.PlayerGui
		if v14 then
			local v15 = v14:WaitForChild("Frame"):WaitForChild("LoadingIndicator")
			if v15 then
				v_u_4:Create(v15, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
					["Rotation"] = 360
				}):Play()
			end
		else
			warn("Failed to clone PendingPurchaseUi")
		end
	end
end
local function v_u_22()
	-- upvalues: (copy) v_u_7, (ref) v_u_11
	local v_u_16 = v_u_7.PlayerGui:FindFirstChild("PendingPurchaseUi")
	if v_u_16 then
		local v17 = v_u_16:FindFirstChild("Frame")
		if v17 then
			local v18 = game:GetService("TweenService")
			local v19 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local v20 = v18:Create(v17, v19, {
				["BackgroundTransparency"] = 1
			})
			v20:Play()
			local v21 = v17:FindFirstChild("LoadingIndicator")
			if v21 and v21:IsA("ImageLabel") then
				v18:Create(v21, v19, {
					["ImageTransparency"] = 1
				}):Play()
			end
			v20.Completed:Connect(function()
				-- upvalues: (copy) v_u_16
				v_u_16:Destroy()
			end)
		else
			v_u_16:Destroy()
		end
	end
	v_u_11 = false
end
function v8.KnitStart(_)
	-- upvalues: (ref) v_u_10, (copy) v_u_6, (copy) v_u_3, (copy) v_u_22
	v_u_10 = v_u_6.Cache
	v_u_3.PromptGamePassPurchaseFinished:Connect(v_u_22)
	v_u_3.PromptProductPurchaseFinished:Connect(v_u_22)
end
return v8

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.NotificationController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("TextChatService")
local v_u_5 = require(v1.Packages.Knit)
local v_u_6 = require(v1.Shared.Chalk)
local v_u_7 = require(v1.Shared.AbbreviationUtils)
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = v_u_5.CreateController({
	["Name"] = "NotificationController"
})
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = {}
local v_u_16 = {}
local function v_u_24(p17, p18)
	-- upvalues: (ref) v_u_14, (ref) v_u_13, (ref) v_u_9, (copy) v_u_3
	local v19 = v_u_14:Clone()
	local v20 = v19.TextLabel
	local v21 = v20:FindFirstChild("UIStroke")
	local v22 = {
		["Info"] = Color3.fromRGB(73, 219, 252),
		["Warning"] = Color3.fromRGB(254, 212, 57),
		["Error"] = Color3.fromRGB(240, 73, 61),
		["Success"] = Color3.fromRGB(136, 252, 82)
	}
	local v23 = {
		["Info"] = Color3.fromRGB(40, 83, 112),
		["Warning"] = Color3.fromRGB(153, 109, 57),
		["Error"] = Color3.fromRGB(125, 24, 24),
		["Success"] = Color3.fromRGB(59, 134, 37)
	}
	v19.Parent = v_u_13
	v20.Text = p18
	v20.TextColor3 = v22[p17] or v22.Info
	v21.Color = v23[p17] or v23.Info
	v19.Visible = true
	if p17 == "Error" then
		v_u_9:PlaySound("Error")
	end
	v19.Size = UDim2.new(1, 0, 0, 0)
	v_u_3:Create(v19, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		["Size"] = v_u_14.Size
	}):Play()
	return v19, v20
end
local function v_u_27(p_u_25)
	-- upvalues: (copy) v_u_3
	local v26 = v_u_3:Create(p_u_25, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		["Size"] = UDim2.new(1, 0, 0, 0)
	})
	v26:Play()
	v26.Completed:Connect(function()
		-- upvalues: (copy) p_u_25
		p_u_25:Destroy()
	end)
end
function v_u_11.DisplayChatMessage(_, p28)
	-- upvalues: (copy) v_u_6, (copy) v_u_4
	local v29 = v_u_6.family("rbxasset://fonts/families/FredokaOne.json")(p28)
	v_u_4.TextChannels.RBXGeneral:DisplaySystemMessage(v29)
end
function v_u_11.DisplayNotification(_, p30, p_u_31, p32)
	-- upvalues: (copy) v_u_15, (copy) v_u_2, (copy) v_u_27, (copy) v_u_16, (copy) v_u_24
	local v33 = p32 or 3
	local v34 = v_u_15[p_u_31]
	if v34 then
		v34.count = v34.count + 1
		v34.textLabel.Text = ("%* (x%*)"):format(p_u_31, v34.count)
		v34.timeLeft = v33
		if v34.removalTask then
			v34.removalTask:Disconnect()
		end
		local v_u_35 = nil
		v_u_35 = v_u_2.Heartbeat:Connect(function(p36)
			-- upvalues: (ref) v_u_15, (copy) p_u_31, (ref) v_u_35, (ref) v_u_27, (ref) v_u_16
			local v37 = v_u_15[p_u_31]
			if not v37 then
				v_u_35:Disconnect()
				return
			end
			v37.timeLeft = v37.timeLeft - p36
			if v37.timeLeft <= 0 then
				v_u_27(v37.frame)
				v_u_15[p_u_31] = nil
				for v38, v39 in ipairs(v_u_16) do
					if v39 == p_u_31 then
						table.remove(v_u_16, v38)
						break
					end
				end
				v_u_35:Disconnect()
			end
		end)
		v34.removalTask = v_u_35
	else
		if #v_u_16 >= 4 then
			local v40 = table.remove(v_u_16, 1)
			local v41 = v_u_15[v40]
			if v41 then
				if v41.removalTask then
					v41.removalTask:Disconnect()
				end
				v_u_27(v41.frame)
				v_u_15[v40] = nil
			end
		end
		local v42, v43 = v_u_24(p30, p_u_31)
		v43.Text = p_u_31
		local v44 = v_u_15
		local v45 = {
			["count"] = 1,
			["textLabel"] = v43,
			["timeLeft"] = v33,
			["frame"] = v42
		}
		local v_u_46 = nil
		v_u_46 = v_u_2.Heartbeat:Connect(function(p47)
			-- upvalues: (ref) v_u_15, (copy) p_u_31, (ref) v_u_46, (ref) v_u_27, (ref) v_u_16
			local v48 = v_u_15[p_u_31]
			if not v48 then
				v_u_46:Disconnect()
				return
			end
			v48.timeLeft = v48.timeLeft - p47
			if v48.timeLeft <= 0 then
				v_u_27(v48.frame)
				v_u_15[p_u_31] = nil
				for v49, v50 in ipairs(v_u_16) do
					if v50 == p_u_31 then
						table.remove(v_u_16, v49)
						break
					end
				end
				v_u_46:Disconnect()
			end
		end)
		v45.removalTask = v_u_46
		v44[p_u_31] = v45
		local v51 = v_u_16
		table.insert(v51, p_u_31)
	end
end
function v_u_11.ImageNotification(_, p52)
	-- upvalues: (ref) v_u_9, (copy) v_u_7, (copy) v_u_5, (copy) v_u_3
	if not p52.amount then
		p52.amount = 1
	end
	p52.image = p52.image and ("rbxassetid://" .. p52.image or "") or ""
	v_u_9:PlaySound("Claim")
	local v_u_53 = script.RewardTemplate:Clone()
	v_u_53.Size = UDim2.fromScale(2.3, 2.3)
	v_u_53.ImageLabel.Image = p52.image
	v_u_53.ImageLabel.Quantity.Text = "x" .. v_u_7:AbbreviateNumber(p52.amount)
	v_u_53.Visible = true
	if p52.imageScale then
		v_u_53.ImageLabel.Size = UDim2.fromScale(p52.imageScale, p52.imageScale)
	end
	if p52.sizeOverride then
		v_u_53.ImageLabel.Size = p52.sizeOverride
	end
	if p52.positionOverride then
		v_u_53.ImageLabel.Position = p52.positionOverride
	end
	v_u_53.Parent = v_u_5.PlayerGui.Effects.RewardList
	spawn(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_53
		for v54 = 1, 4 do
			local v55 = Instance.new("ImageLabel")
			v55.Image = "rbxassetid://98844930478696"
			v55.BackgroundTransparency = 1
			v55.Position = UDim2.fromScale(0.5, 0.5)
			v55.AnchorPoint = Vector2.new(0.5, 0.5)
			v55.Size = UDim2.fromScale(1.1, 1.1)
			v55.ImageTransparency = 0.28
			v55.ImageColor3 = Color3.fromRGB(255, 255, 255)
			v_u_3:Create(v55, TweenInfo.new(v54 / 2.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				["Size"] = UDim2.fromScale(1.6, 1.6),
				["ImageTransparency"] = 1
			}):Play()
			v55.Parent = v_u_53
			game.Debris:AddItem(v55, v54 / 2.4)
			wait(v54 / 12)
		end
		wait(0.65)
		local v56 = Instance.new("ImageLabel")
		v56.Image = "rbxassetid://98844930478696"
		v56.BackgroundTransparency = 1
		v56.Position = UDim2.fromScale(0.5, 0.5)
		v56.AnchorPoint = Vector2.new(0.5, 0.5)
		v56.Size = UDim2.fromScale(1.1, 1.1)
		v56.ImageTransparency = 0.28
		v56.ImageColor3 = Color3.fromRGB(255, 255, 255)
		v_u_3:Create(v56, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			["Size"] = UDim2.fromScale(1.6, 1.6),
			["ImageTransparency"] = 1
		}):Play()
		v56.Parent = v_u_53
		game.Debris:AddItem(v56, 0.9)
	end)
	v_u_3:Create(v_u_53, TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		["Size"] = UDim2.fromScale(1.2, 1.2)
	}):Play()
	task.delay(3.2, function()
		-- upvalues: (ref) v_u_3, (copy) v_u_53
		v_u_3:Create(v_u_53, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
			["Size"] = UDim2.new(0, 0, 0, 0)
		}):Play()
		task.wait(0.4)
		v_u_53:Destroy()
	end)
end
function v_u_11.TypeWriter(_, p_u_57, p58, p59)
	-- upvalues: (copy) v_u_5, (copy) v_u_3
	local v_u_60 = v_u_5.PlayerGui.Effects.ServerShout:Clone()
	v_u_60.Name = "TextIO"
	for _, v61 in pairs(v_u_5.PlayerGui.Effects:GetChildren()) do
		if v61.Name == "TextIO" then
			v61:Destroy()
		end
	end
	v_u_60.Parent = v_u_5.PlayerGui.Effects
	v_u_60.TextTransparency = 0
	v_u_60.UIStroke.Transparency = 0
	v_u_60.Visible = true
	local v_u_62 = p59 or 0.05
	local v_u_63 = p58 or 6
	pcall(function()
		-- upvalues: (copy) p_u_57, (copy) v_u_60, (ref) v_u_62, (ref) v_u_63, (ref) v_u_3
		for v64 = 1, #p_u_57 do
			local v65 = p_u_57
			v_u_60.Text = string.sub(v65, 1, v64)
			task.wait(v_u_62)
		end
		task.wait(v_u_63)
		v_u_3:Create(v_u_60, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			["TextTransparency"] = 1
		}):Play()
		v_u_3:Create(v_u_60.UIStroke, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			["Transparency"] = 1
		}):Play()
		task.wait(1)
		v_u_60:Destroy()
	end)
end
local v_u_66 = {
	["magia"] = script.MagiaShout,
	["omer"] = script.OmerShout,
	["i2Perfect"] = script.i2PerfectShout,
	["Dojo"] = script.DojoShout,
	["Claimed"] = script.Claimed
}
local v_u_67 = 0
local v_u_68 = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
local v_u_69 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
function v_u_11.PlayerWriter(_, p70, p_u_71, p_u_72, p_u_73, p_u_74)
	-- upvalues: (copy) v_u_66, (copy) v_u_5, (copy) v_u_3, (copy) v_u_68, (ref) v_u_67, (copy) v_u_69
	local v_u_75 = (v_u_66[p70] or script.MagiaShout):Clone()
	for _, v76 in pairs(v_u_5.PlayerGui.Effects.ServerShoutNew:GetChildren()) do
		if v76.ClassName ~= "UIListLayout" and v76.ClassName ~= "UIAspectRatioConstraint" then
			v76:Destroy()
		end
	end
	pcall(function()
		-- upvalues: (copy) p_u_72, (copy) v_u_75, (ref) v_u_3, (ref) v_u_68, (copy) p_u_71, (ref) v_u_67, (ref) v_u_5, (ref) p_u_74, (ref) p_u_73, (ref) v_u_69
		if p_u_72 then
			v_u_75.Frame.ServerShout.Text = ""
			v_u_75.Frame.ImageLabel.UIStroke.Thickness = 1.3
			v_u_75.ImageTransparency = 1
			v_u_75.Frame.ServerShout.TextTransparency = 1
			v_u_75.Frame.ServerShout.UIStroke.Transparency = 1
			v_u_75.Frame.name.TextTransparency = 1
			v_u_75.Frame.name.UIStroke.Transparency = 1
			v_u_75.Frame.ImageLabel.ImageTransparency = 1
			v_u_75.Frame.ImageLabel.BackgroundTransparency = 1
			v_u_75.Frame.ImageLabel.UIStroke.Transparency = 1
			v_u_3:Create(v_u_75, v_u_68, {
				["ImageTransparency"] = 0.42
			}):Play()
			v_u_3:Create(v_u_75.Frame.ServerShout, v_u_68, {
				["TextTransparency"] = 0
			}):Play()
			v_u_3:Create(v_u_75.Frame.ServerShout.UIStroke, v_u_68, {
				["Transparency"] = 0
			}):Play()
			v_u_3:Create(v_u_75.Frame.name, v_u_68, {
				["TextTransparency"] = 0
			}):Play()
			v_u_3:Create(v_u_75.Frame.name.UIStroke, v_u_68, {
				["Transparency"] = 0
			}):Play()
			v_u_3:Create(v_u_75.Frame.ImageLabel, v_u_68, {
				["ImageTransparency"] = 0,
				["BackgroundTransparency"] = 0
			}):Play()
			v_u_3:Create(v_u_75.Frame.ImageLabel.UIStroke, v_u_68, {
				["Transparency"] = 0
			}):Play()
		else
			v_u_75.Frame.ServerShout.Text = p_u_71
		end
		v_u_75.LayoutOrder = v_u_67
		v_u_67 = v_u_67 - 1
		v_u_75.Parent = v_u_5.PlayerGui.Effects.ServerShoutNew
		v_u_75.Frame.ServerShout.TextTransparency = 0
		v_u_75.Frame.ServerShout.UIStroke.Transparency = 0
		v_u_75.Visible = true
		wait(0.3)
		p_u_74 = p_u_74 or 0.06
		p_u_73 = p_u_73 or 5.5
		pcall(function()
			-- upvalues: (ref) p_u_72, (ref) p_u_71, (ref) v_u_75, (ref) p_u_74, (ref) p_u_73, (ref) v_u_3, (ref) v_u_69
			if p_u_72 then
				for v77 = 1, #p_u_71 do
					local v78 = p_u_71
					v_u_75.Frame.ServerShout.Text = string.sub(v78, 1, v77)
					task.wait(p_u_74)
				end
			end
			task.wait(p_u_73)
			v_u_3:Create(v_u_75, v_u_69, {
				["ImageTransparency"] = 1
			}):Play()
			v_u_3:Create(v_u_75.Frame.ServerShout, v_u_69, {
				["TextTransparency"] = 1
			}):Play()
			v_u_3:Create(v_u_75.Frame.ServerShout.UIStroke, v_u_69, {
				["Transparency"] = 1
			}):Play()
			v_u_3:Create(v_u_75.Frame.name, v_u_69, {
				["TextTransparency"] = 1
			}):Play()
			v_u_3:Create(v_u_75.Frame.name.UIStroke, v_u_69, {
				["Transparency"] = 1
			}):Play()
			v_u_3:Create(v_u_75.Frame.ImageLabel, v_u_69, {
				["ImageTransparency"] = 1,
				["BackgroundTransparency"] = 1
			}):Play()
			v_u_3:Create(v_u_75.Frame.ImageLabel.UIStroke, v_u_69, {
				["Transparency"] = 1
			}):Play()
			wait(0.5)
			v_u_75:Destroy()
		end)
	end)
end
local function v_u_84()
	-- upvalues: (copy) v_u_5, (copy) v_u_3
	local v_u_79 = v_u_5.PlayerGui:WaitForChild("Effects"):WaitForChild("TopNotifications"):WaitForChild("RareBrainrotText")
	local v_u_80 = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local v_u_81 = v_u_79:WaitForChild("UIStroke")
	v_u_79.TextTransparency = 0
	v_u_81.Transparency = 0
	v_u_79.Visible = true
	task.delay(5, function()
		-- upvalues: (ref) v_u_3, (copy) v_u_79, (copy) v_u_80, (copy) v_u_81
		local v82 = v_u_3:Create(v_u_79, v_u_80, {
			["TextTransparency"] = 1
		})
		local v83 = v_u_3:Create(v_u_81, v_u_80, {
			["Transparency"] = 1
		})
		v82:Play()
		v83:Play()
		v82.Completed:Wait()
		v_u_79.Visible = false
	end)
end
function v_u_11.KnitStart(p_u_85)
	-- upvalues: (ref) v_u_8, (copy) v_u_5, (ref) v_u_9, (ref) v_u_10, (ref) v_u_12, (ref) v_u_13, (ref) v_u_14, (copy) v_u_11, (copy) v_u_84
	v_u_8 = v_u_5.GetService("NotificationService")
	v_u_9 = v_u_5.GetController("SoundController")
	v_u_10 = v_u_5.GetService("SpawnerService")
	v_u_12 = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("NotificationGui")
	v_u_13 = v_u_12:WaitForChild("NotificationList")
	v_u_14 = v_u_13:WaitForChild("NotificationTemplate")
	v_u_8.NotifyChatSignal:Connect(function(p86, p87)
		-- upvalues: (ref) v_u_11
		v_u_11:DisplayChatMessage(p86, p87)
	end)
	v_u_8.NotifySignal:Connect(function(p88, p89)
		-- upvalues: (ref) v_u_11
		v_u_11:DisplayNotification(p88, p89)
	end)
	v_u_8.ImageNotification:Connect(function(p90)
		-- upvalues: (ref) v_u_11
		v_u_11:ImageNotification(p90)
	end)
	v_u_8.TypeWriter:Connect(function(p91)
		-- upvalues: (copy) p_u_85
		p_u_85:TypeWriter(p91)
	end)
	v_u_8.PlayerWriter:Connect(function(p92, p93, p94)
		-- upvalues: (copy) p_u_85
		p_u_85:PlayerWriter(p92, p93, p94)
	end)
	v_u_10.OnRareBrainrotSpawned:Connect(function()
		-- upvalues: (ref) v_u_84
		v_u_84()
	end)
end
return v_u_11

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.PlaytimeRewardController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("MarketplaceService")
local v_u_3 = game:GetService("Players")
local v_u_4 = require(v1.Packages.Knit)
local v_u_5 = require(v1.Configs.PlaytimeRewardConfig)
local v_u_6 = require(v1.Configs.MonetizationConfig)
local v_u_7 = require(v1.Shared.TableUtils)
local v_u_8 = nil
local v_u_9 = nil
local v10 = v_u_4.CreateController({
	["Name"] = "PlaytimeRewardController"
})
local v_u_11 = {}
local v_u_12 = 0
local v_u_13 = 0
function v10.GetSessionTime(_)
	-- upvalues: (ref) v_u_13
	return v_u_13
end
function v10.GetClaimedGifts(_)
	-- upvalues: (copy) v_u_7, (copy) v_u_11
	return v_u_7.Copy(v_u_11)
end
function v10.GetNextClaimableGift(p14)
	-- upvalues: (copy) v_u_5
	for v15, v16 in v_u_5 do
		if not p14:IsGiftClaimed(v15) then
			return v15, v16
		end
	end
	return nil, nil
end
function v10.GetAvailableGiftsCount(p17)
	-- upvalues: (copy) v_u_5, (ref) v_u_13
	local v18 = 0
	for v19, v20 in pairs(v_u_5) do
		if not p17:IsGiftClaimed(v19) and v_u_13 >= v20.time then
			v18 = v18 + 1
		end
	end
	return v18
end
function v10.IsGiftClaimed(_, p21)
	-- upvalues: (copy) v_u_11
	return v_u_11[p21] or false
end
function v10.ClaimGift(p22, p23)
	-- upvalues: (ref) v_u_8, (ref) v_u_9, (copy) v_u_11, (copy) v_u_7, (copy) v_u_5, (ref) v_u_13
	if p22:IsGiftClaimed(p23) then
		v_u_8:DisplayNotification("Error", "You have already claimed this gift")
		return false
	end
	if not v_u_9:ClaimGift(p23) then
		return false
	end
	v_u_11[p23] = true
	if v_u_7.GetLength(v_u_11) == v_u_7.GetLength(v_u_5) and v_u_7.Every(v_u_11, function(p24)
		return p24
	end) then
		v_u_13 = 0
		for v25, _ in v_u_11 do
			v_u_11[v25] = false
		end
	end
	return true
end
function _InitTimer()
	-- upvalues: (copy) v_u_3, (ref) v_u_13
	while task.wait(1) do
		local v26 = v_u_3.LocalPlayer
		if not (v26 and v26:IsDescendantOf(v_u_3)) then
			break
		end
		v_u_13 = v_u_13 + 1
	end
end
function v10.KnitStart(_)
	-- upvalues: (ref) v_u_8, (copy) v_u_4, (ref) v_u_9, (copy) v_u_5, (copy) v_u_11, (ref) v_u_12, (ref) v_u_13, (copy) v_u_2, (copy) v_u_6
	v_u_8 = v_u_4.GetController("NotificationController")
	v_u_9 = v_u_4.GetService("PlaytimeRewardService")
	for v27, v28 in pairs(v_u_5) do
		v_u_11[v27] = false
		if v_u_12 < v28.time then
			v_u_12 = v28.time
		end
	end
	v_u_9.StartedCounting:Connect(function()
		-- upvalues: (ref) v_u_13
		v_u_13 = 0
		_InitTimer()
	end)
	v_u_2.PromptProductPurchaseFinished:Connect(function(_, p29, p30)
		-- upvalues: (ref) v_u_6, (ref) v_u_13, (ref) v_u_12
		if p29 == v_u_6.PLAYTIME_REWARD_SKIP.id and p30 then
			v_u_13 = v_u_12
		end
	end)
end
return v10

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.ReplicaController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Packages.Knit)
local v_u_3 = require(v1.ReplicaClient)
local v_u_4 = nil
local v_u_5 = false
local v_u_6 = Instance.new("BindableEvent")
local v7 = v2.CreateController({
	["Name"] = "ReplicaController"
})
function v7.IsReplicaReady(_)
	-- upvalues: (ref) v_u_5
	return v_u_5
end
function v7.GetPlayerData(p8)
	return p8:GetReplica().Data
end
function v7.GetReplica(_)
	-- upvalues: (ref) v_u_5, (ref) v_u_4, (copy) v_u_6
	if v_u_5 then
		return v_u_4
	end
	v_u_6.Event:Wait()
	return v_u_4
end
function v7.KnitStart(_)
	-- upvalues: (copy) v_u_3, (ref) v_u_4, (ref) v_u_5, (copy) v_u_6
	v_u_3.RequestData()
	v_u_3.OnNew("PlayerDataReplica", function(p9)
		-- upvalues: (ref) v_u_4, (ref) v_u_5, (ref) v_u_6
		v_u_4 = p9
		v_u_5 = true
		v_u_6:Fire()
	end)
end
return v7

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.SettingsController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
local v_u_2 = require(v1.Packages.Knit)
local v_u_3 = require(v1.Packages.topbarplus)
local v_u_4 = require(v1.Shared.TableUtils)
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = nil
local v8 = v_u_2.CreateController({
	["Name"] = "SettingsController"
})
local v_u_9 = {}
function v8.GetSettings(_)
	-- upvalues: (copy) v_u_4, (ref) v_u_9
	return v_u_4.Copy(v_u_9, true)
end
function v8.GetSetting(_, p10)
	-- upvalues: (ref) v_u_9
	return v_u_9[p10]
end
function v8.ChangeSetting(_, p_u_11, p_u_12)
	-- upvalues: (ref) v_u_9, (ref) v_u_6
	v_u_9[p_u_11] = p_u_12
	task.spawn(function()
		-- upvalues: (ref) v_u_6, (copy) p_u_11, (copy) p_u_12
		v_u_6:ChangeSetting(p_u_11, p_u_12)
	end)
end
function v8.KnitStart(_)
	-- upvalues: (ref) v_u_5, (copy) v_u_2, (ref) v_u_6, (ref) v_u_7, (ref) v_u_9, (copy) v_u_4, (copy) v_u_3
	v_u_5 = v_u_2.GetController("ReplicaController")
	v_u_6 = v_u_2.GetService("SettingsService")
	v_u_7 = v_u_2.GetController("MonetizationController")
	local v_u_13 = v_u_2.GetController("WindowController")
	local v14 = v_u_5:GetPlayerData().Settings or {}
	v_u_9 = v_u_4.Copy(v14, true)
	v_u_3.new():setOrder(1):setImage(129501742935886):setImageScale(0.7):align("right"):autoDeselect(false):oneClick():bindEvent("deselected", function()
		-- upvalues: (ref) v_u_7, (copy) v_u_13
		if not v_u_7:IsPendingPurchase() then
			v_u_13:SetCurrentWindow("Settings")
		end
	end)
end
return v8

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.SoundController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("SoundService")
game:GetService("Players")
local v_u_3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.Shared.TableUtils)
require(v1.Packages.topbarplus)
local v_u_5 = v1:WaitForChild("Music")
local v_u_6 = game:GetService("TweenService")
local v7 = game:GetService("Lighting")
local v_u_8 = {}
local v_u_9 = 1
local v_u_10 = nil
local v_u_11 = nil
local v_u_12 = nil
local v_u_13 = v_u_3.CreateController({
	["Name"] = "SoundController"
})
local v_u_14 = v7:WaitForChild("ColorBase")
local v_u_15 = game.Players.LocalPlayer.PlayerGui:WaitForChild("Effects"):WaitForChild("Caseing")
local v_u_16 = v_u_2:WaitForChild("Award1")
function ScreenGreenReward()
	-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_6, (copy) v_u_16
	v_u_14.TintColor = Color3.fromRGB(255, 255, 255)
	v_u_14.Brightness = 0
	v_u_15.Visible = false
	v_u_6:Create(v_u_14, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		["TintColor"] = Color3.fromRGB(177, 255, 176),
		["Brightness"] = 0.2
	}):Play()
	v_u_16.PlaybackSpeed = 0.9 + math.random(1, 5) / 10
	v_u_16:Play()
	task.wait(0.25)
	v_u_6:Create(v_u_14, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
		["TintColor"] = Color3.fromRGB(255, 255, 255),
		["Brightness"] = 0
	}):Play()
	task.wait(0.25)
end
local v_u_17 = nil
function v_u_13.PlaySoundBrainrot(_, p18, p19)
	-- upvalues: (ref) v_u_12, (copy) v_u_2, (ref) v_u_17
	if v_u_12:GetSetting("SfxEnabled") then
		local v20 = v_u_2:FindFirstChild("Levelup Sounds"):FindFirstChild(p18)
		if v20 then
			if v_u_17 then
				v_u_17:Stop()
				v_u_17:Destroy()
				v_u_17 = nil
			end
			local v_u_21 = v20:Clone()
			if v_u_21.Volume > 0.2 then
				v_u_21.Volume = 0.2
			end
			v_u_21.Parent = v_u_2
			if p19 then
				for v_u_22, v_u_23 in pairs(p19) do
					if v_u_21[v_u_22] ~= nil then
						pcall(function()
							-- upvalues: (copy) v_u_21, (copy) v_u_22, (copy) v_u_23
							v_u_21[v_u_22] = v_u_23
						end)
					end
				end
			end
			v_u_17 = v_u_21
			v_u_21:Play()
			ScreenGreenReward()
			v_u_21.Ended:Connect(function()
				-- upvalues: (copy) v_u_21, (ref) v_u_17
				v_u_21:Destroy()
				v_u_17 = nil
			end)
		else
			warn("Sound not found", p18)
		end
	else
		return
	end
end
function v_u_13.PlaySound(_, p24, p25)
	-- upvalues: (ref) v_u_12, (copy) v_u_2
	if v_u_12:GetSetting("SfxEnabled") then
		local v26 = v_u_2:FindFirstChild(p24)
		if v26 then
			local v_u_27 = v26:Clone()
			v_u_27.Parent = v_u_2
			if p25 then
				for v_u_28, v_u_29 in pairs(p25) do
					if v_u_27[v_u_28] ~= nil then
						pcall(function()
							-- upvalues: (copy) v_u_27, (copy) v_u_28, (copy) v_u_29
							v_u_27[v_u_28] = v_u_29
						end)
					end
				end
			end
			v_u_27:Play()
			v_u_27.Ended:Connect(function()
				-- upvalues: (copy) v_u_27
				v_u_27:Destroy()
			end)
		else
			warn("Sound not found", p24)
		end
	else
		return
	end
end
function v_u_13.PlayNextMusic(p_u_30)
	-- upvalues: (ref) v_u_10, (ref) v_u_11, (ref) v_u_12, (ref) v_u_8, (ref) v_u_9
	if v_u_10 then
		task.cancel(v_u_10)
	end
	v_u_10 = task.spawn(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_12, (ref) v_u_8, (ref) v_u_9, (copy) p_u_30
		if v_u_11:GetPlayerData().Settings and v_u_12:GetSetting("MusicEnabled") == false then
			return
		elseif #v_u_8 == 0 then
			return
		else
			local v31 = v_u_8[v_u_9]
			if v31 then
				local v32 = 0
				while not v31.IsLoaded and v32 < 30 do
					task.wait(0.1)
					v32 = v32 + 0.1
				end
				if v31.IsLoaded then
					v31:Play()
					v31.Ended:Once(function()
						-- upvalues: (ref) v_u_9, (ref) v_u_8, (ref) p_u_30
						v_u_9 = v_u_9 % #v_u_8 + 1
						p_u_30:PlayNextMusic()
					end)
				else
					v_u_9 = v_u_9 % #v_u_8 + 1
					task.defer(function()
						-- upvalues: (ref) p_u_30
						p_u_30:PlayNextMusic()
					end)
				end
			else
				return
			end
		end
	end)
end
function v_u_13.StopMusic(_)
	-- upvalues: (ref) v_u_8, (ref) v_u_9
	if v_u_8[v_u_9] then
		v_u_8[v_u_9]:Stop()
	end
end
function v_u_13.StartBackgroundMusic(p33)
	-- upvalues: (ref) v_u_8, (copy) v_u_5, (copy) v_u_4, (ref) v_u_9
	v_u_8 = {}
	for _, v34 in ipairs(v_u_5:GetChildren()) do
		if v34:IsA("Sound") then
			local v35 = v_u_8
			table.insert(v35, v34)
		end
	end
	if #v_u_8 > 0 then
		v_u_8 = v_u_4.Shuffle(v_u_8)
		v_u_9 = 1
		p33:PlayNextMusic()
	end
end
function _InitToggleMusicHandlers()
	-- upvalues: (ref) v_u_11, (copy) v_u_13
	local v36 = v_u_11:GetPlayerData().Settings
	if not v36 or v36.MusicEnabled then
		v_u_13:StartBackgroundMusic()
	end
end
function v_u_13.KnitStart(p_u_37)
	-- upvalues: (ref) v_u_11, (copy) v_u_3, (ref) v_u_12
	v_u_11 = v_u_3.GetController("ReplicaController")
	v_u_12 = v_u_3.GetController("SettingsController")
	local v38 = v_u_3.GetService("SoundService")
	v38.PlaySoundSignal:Connect(function(p39, p40)
		-- upvalues: (copy) p_u_37
		p_u_37:PlaySound(p39, p40)
	end)
	v38.PlayBrainrotSoundSignal:Connect(function(p41, p42)
		-- upvalues: (copy) p_u_37
		p_u_37:PlaySoundBrainrot(p41, p42)
	end)
	_InitToggleMusicHandlers()
end
return v_u_13

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.TimePlayedController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Knit)
local v_u_3 = nil
local v4 = v_u_2.CreateController({
	["Name"] = "TimePlayedController"
})
local v_u_5 = 0
local v_u_6 = 0
function v4.GetCurrentSessionTime(_)
	-- upvalues: (ref) v_u_6
	return os.time() - v_u_6
end
function v4.GetCurrentTimePlayed(_)
	-- upvalues: (ref) v_u_6, (ref) v_u_5
	return v_u_5 + (os.time() - v_u_6)
end
function v4.KnitStart(_)
	-- upvalues: (ref) v_u_3, (copy) v_u_2, (ref) v_u_5, (ref) v_u_6
	v_u_3 = v_u_2.GetController("ReplicaController")
	task.spawn(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_5, (ref) v_u_6
		while not v_u_3:IsReplicaReady() do
			task.wait(0.1)
		end
		v_u_5 = v_u_3:GetPlayerData().TimePlayed or 0
		v_u_6 = os.time()
	end)
end
return v4

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.WindowController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("GamepadService")
local v_u_4 = game:GetService("TweenService")
local v5 = game:GetService("Lighting")
local v_u_6 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_7 = game.Players.LocalPlayer.PlayerGui:WaitForChild("Windows")
local v_u_8 = {}
local v_u_9 = nil
local v_u_10 = {}
local v_u_11 = {}
local v_u_12 = {}
local v_u_13 = v5:FindFirstChild("MenuBlur") or Instance.new("BlurEffect")
v_u_13.Size = 0
v_u_13.Name = "MenuBlur"
v_u_13.Parent = v5
local v_u_14 = v_u_6.CreateController({
	["Name"] = "WindowController",
	["currentWindow"] = nil
})
function v_u_14.CloseCurrentWindow(p15)
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_13, (copy) v_u_14, (copy) v_u_2, (copy) v_u_3
	if p15.currentWindow then
		local v16 = v_u_8[p15.currentWindow]
		v16.Visible = false
		p15.currentWindow = nil
		v_u_4:Create(v_u_13, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			["Size"] = 0
		}):Play()
		v_u_4:Create(workspace.CurrentCamera, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			["FieldOfView"] = 70
		}):Play()
		if v16:GetAttribute("HideBottom") then
			v_u_14:ShowBottom()
		end
		if v16:GetAttribute("HideTop") and not game.Players.LocalPlayer:GetAttribute("InSpawn") then
			v_u_14:ShowTop()
		end
		if v16:GetAttribute("HideHUD") then
			v_u_14:ShowButtons()
		end
		if v_u_2:IsTenFootInterface() then
			v_u_3:DisableGamepadCursor()
		end
	end
end
function v_u_14.SetCurrentWindow(p17, p18)
	-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_4, (copy) v_u_13, (ref) v_u_9, (copy) v_u_14, (copy) v_u_2, (copy) v_u_3
	local v19 = v_u_8[p18]
	if v19 then
		if v19.Parent == v_u_7 then
			if p17.currentWindow == p18 then
				p17:CloseCurrentWindow()
			else
				p17:CloseCurrentWindow()
				p17.currentWindow = p18
				v19.Position = UDim2.fromScale(0.5, 0.55)
				v19.Visible = true
				v19:TweenPosition(v19:GetAttribute("PositionOverride") or UDim2.fromScale(0.5, 0.5), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.18, true)
				v_u_4:Create(v_u_13, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
					["Size"] = 24
				}):Play()
				v_u_4:Create(workspace.CurrentCamera, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
					["FieldOfView"] = 62
				}):Play()
				if v19:GetAttribute("OpenSound") then
					v_u_9:PlaySound(v19:GetAttribute("OpenSound"))
				end
				if v19:GetAttribute("HideBottom") then
					v_u_14:HideBottom()
				end
				if v19:GetAttribute("HideTop") then
					v_u_14:HideTop()
				end
				if v19:GetAttribute("HideHUD") then
					v_u_14:HideButtons()
				end
				if v_u_2:IsTenFootInterface() then
					v_u_3:EnableGamepadCursor(v19)
				end
			end
		else
			return
		end
	else
		p17:CloseCurrentWindow()
		return
	end
end
function v_u_14.GetCurrentWindow(p20)
	return p20.currentWindow
end
function v_u_14.ShowBottom(_)
	-- upvalues: (copy) v_u_10
	for _, v21 in pairs(v_u_10) do
		v21:TweenPosition(v21:GetAttribute("OriginalPosition"), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.17, true)
	end
end
function v_u_14.HideBottom(_)
	-- upvalues: (copy) v_u_10
	for _, v22 in pairs(v_u_10) do
		local v23 = v22:GetAttribute("OriginalPosition")
		v22:TweenPosition(UDim2.fromScale(v23.X.Scale, v23.Y.Scale + 1), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.15, true)
	end
end
function v_u_14.ShowTop(_)
	-- upvalues: (copy) v_u_11
	for _, v24 in pairs(v_u_11) do
		v24:TweenPosition(v24:GetAttribute("OriginalPosition"), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.17, true)
	end
end
function v_u_14.HideTop(_)
	-- upvalues: (copy) v_u_11
	for _, v25 in pairs(v_u_11) do
		local v26 = v25:GetAttribute("OriginalPosition")
		v25:TweenPosition(UDim2.fromScale(v26.X.Scale, v26.Y.Scale - 1), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.15, true)
	end
end
function v_u_14.ShowButtons(_)
	-- upvalues: (copy) v_u_12
	for _, v27 in pairs(v_u_12) do
		v27:TweenPosition(v27:GetAttribute("OriginalPosition"), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2, true)
	end
end
function v_u_14.HideButtons(_)
	-- upvalues: (copy) v_u_12
	for _, v28 in pairs(v_u_12) do
		local v29 = v28:GetAttribute("OriginalPosition")
		local v30 = v28:GetAttribute("Hide")
		if v30 == "Left" then
			v28:TweenPosition(UDim2.fromScale(v29.X.Scale - 1, v29.Y.Scale), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.23, true)
		elseif v30 == "Right" then
			v28:TweenPosition(UDim2.fromScale(v29.X.Scale + 1, v29.Y.Scale), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.23, true)
		elseif v30 == "Top" then
			v28:TweenPosition(UDim2.fromScale(v29.X.Scale, v29.Y.Scale - 1), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.23, true)
		elseif v30 == "Bottom" then
			v28:TweenPosition(UDim2.fromScale(v29.X.Scale, v29.Y.Scale + 1), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.23, true)
		end
	end
end
function v_u_14.ShowHUD(p31)
	p31:ShowButtons()
end
function v_u_14.HideHUD(p32)
	-- upvalues: (copy) v_u_8, (copy) v_u_2, (copy) v_u_3
	p32:HideButtons()
	if p32.currentWindow then
		v_u_8[p32.currentWindow].Visible = false
		p32.currentWindow = nil
		if v_u_2:IsTenFootInterface() then
			v_u_3:DisableGamepadCursor()
		end
	end
end
function v_u_14.KnitStart(_)
	-- upvalues: (ref) v_u_9, (copy) v_u_6, (copy) v_u_8, (copy) v_u_1, (copy) v_u_10, (copy) v_u_12, (copy) v_u_11
	v_u_9 = v_u_6.GetController("SoundController")
	local function v34(p33)
		-- upvalues: (ref) v_u_8
		if p33:IsDescendantOf(game.Players.LocalPlayer) then
			p33.Visible = false
			v_u_8[p33.Name] = p33
		end
	end
	v_u_1:GetInstanceAddedSignal("Window"):Connect(v34)
	for _, v35 in pairs(v_u_1:GetTagged("Window")) do
		if v35:IsDescendantOf(game.Players.LocalPlayer) then
			v35.Visible = false
			v_u_8[v35.Name] = v35
		end
	end
	task.wait(1.5)
	for _, v36 in pairs(game.Players.LocalPlayer.PlayerGui:WaitForChild("HUD"):GetChildren()) do
		local v37 = v36:GetAttribute("Hide")
		if v37 then
			v36:SetAttribute("OriginalPosition", v36.Position)
			if v37 == "Bottom" then
				local v38 = v_u_10
				table.insert(v38, v36)
				local v39 = v_u_12
				table.insert(v39, v36)
			elseif v37 == "Top" then
				local v40 = v_u_11
				table.insert(v40, v36)
			else
				local v41 = v_u_12
				table.insert(v41, v36)
			end
		end
	end
	for _, v42 in pairs(game.Players.LocalPlayer.PlayerGui:WaitForChild("BackpackGui"):GetChildren()) do
		v42:SetAttribute("OriginalPosition", v42.Position)
		v42:SetAttribute("Hide", "Bottom")
		local v43 = v_u_10
		table.insert(v43, v42)
	end
end
return v_u_14

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.BackpackController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.Knit)
require(v1.Shared.AbbreviationUtils)
require(v1.Shared.TableUtils)
local v_u_4 = require(v1.GameShared.BrainrotUtils)
require(v1.GameShared.PlotUtils)
local v_u_5 = require(v1.SatchelLoader.Satchel)
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = v_u_3.CreateController({
	["Name"] = "BackpackController"
})
function v_u_10._UpdateTools(_)
	-- upvalues: (ref) v_u_6, (copy) v_u_2, (copy) v_u_4
	local v11 = v_u_6:GetPlayerData().Inventory
	for _, v12 in v_u_2.LocalPlayer.Backpack:GetChildren() do
		if v12:IsA("Tool") and v12:GetAttribute("BrainrotType") then
			local v13 = v12:GetAttribute("EntityId")
			local v14 = v11[v13]
			if v14 then
				local v15 = v14.innerEntity
				local v16 = v_u_4.GetCashPerSec(v_u_2.LocalPlayer, v15)
				v12.ToolTip = v_u_4.GetTooltipText(v16)
			else
				warn((("Could not find brainrot entity in inventory %*"):format(v13)))
			end
		end
	end
end
function v_u_10.PlaceBestBrainrots(_)
	-- upvalues: (ref) v_u_9
	v_u_9:PlaceBest()
end
function v_u_10.KnitStart(_)
	-- upvalues: (ref) v_u_8, (copy) v_u_3, (ref) v_u_9, (ref) v_u_6, (ref) v_u_7, (copy) v_u_10, (copy) v_u_2, (copy) v_u_5
	v_u_8 = require(v_u_3.Components.ContainerPlacementComponent)
	v_u_9 = v_u_3.GetService("ContainerService")
	v_u_6 = v_u_3.GetController("ReplicaController")
	v_u_7 = v_u_3.GetController("NotificationController")
	v_u_6:GetReplica():OnSet({ "UnlockedBrainrotsCount" }, function()
		-- upvalues: (ref) v_u_10
		v_u_10:_UpdateTools()
	end)
	v_u_2.LocalPlayer.AttributeChanged:Connect(function(p17)
		-- upvalues: (ref) v_u_10
		if p17 == "FriendsOnline" then
			v_u_10:_UpdateTools()
		end
	end)
	v_u_2.PlayerMembershipChanged:Connect(function(p18)
		-- upvalues: (ref) v_u_2, (ref) v_u_10
		if p18 == v_u_2.LocalPlayer then
			v_u_10:_UpdateTools()
		end
	end)
	v_u_2.LocalPlayer:GetAttributeChangedSignal("InSpawn"):Connect(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_5
		if v_u_2.LocalPlayer:GetAttribute("InSpawn") then
			v_u_5:SetBackpackEnabled(true)
		else
			v_u_5:SetBackpackEnabled(false)
		end
	end)
end
return v_u_10

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.AttackLookController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("RunService")
local v4 = require(v1.Packages.Knit)
local v_u_5 = require(v1.Shared.RobloxUtils)
local v_u_6 = require(v1.Shared.TableUtils)
local v_u_7 = nil
local v_u_8 = 10
local v_u_9 = false
local v_u_10 = nil
local v_u_11 = nil
local v12 = v4.CreateController({
	["Name"] = "AttackLookController"
})
function v12._InitCharacter(_, p_u_13)
	-- upvalues: (ref) v_u_10, (ref) v_u_11, (ref) v_u_7, (ref) v_u_8, (copy) v_u_5, (ref) v_u_9
	if v_u_10 then
		v_u_10:Disconnect()
		v_u_10 = nil
	end
	if v_u_11 then
		v_u_11:Disconnect()
		v_u_11 = nil
	end
	local v14 = p_u_13:WaitForChild("HumanoidRootPart")
	if v14 then
		v_u_7 = v14
		v_u_8 = v_u_5:GetSize(p_u_13).Y
		v_u_10 = p_u_13.ChildAdded:Connect(function(p15)
			-- upvalues: (ref) v_u_9
			if p15:IsA("Tool") then
				if p15:HasTag("PickaxeTool") then
					v_u_9 = true
				end
			end
		end)
		v_u_11 = p_u_13.ChildRemoved:Connect(function(p16)
			-- upvalues: (ref) v_u_9, (copy) p_u_13
			if p16:IsA("Tool") then
				if p16:HasTag("PickaxeTool") then
					v_u_9 = false
					if p_u_13.Humanoid then
						p_u_13.Humanoid.AutoRotate = true
					end
				end
			end
		end)
	else
		warn("Could not get root part for character")
	end
end
function _OnHeartbeat(_)
	-- upvalues: (ref) v_u_9, (ref) v_u_7, (copy) v_u_2, (ref) v_u_8, (copy) v_u_6, (copy) v_u_5
	if v_u_9 then
		if v_u_7 then
			if v_u_2.LocalPlayer.Character then
				local v17 = OverlapParams.new()
				v17.FilterDescendantsInstances = { v_u_2.LocalPlayer.Character }
				local v18 = v_u_8
				local v19 = {}
				for _, v20 in workspace:GetPartBoundsInBox(v_u_7:GetPivot(), Vector3.new(10, v18, 10), v17) do
					if v20:HasTag("LuckyBlock") then
						v19[v20] = true
					end
					if v20.Parent and v20.Parent:HasTag("LuckyBlock") then
						v19[v20.Parent] = true
					end
				end
				local v21 = v_u_2.LocalPlayer.Character
				if v_u_6.GetLength(v19) == 0 then
					if v21.Humanoid then
						v21.Humanoid.AutoRotate = true
					end
					return
				else
					if v21.Humanoid then
						v21.Humanoid.AutoRotate = false
					end
					local v22 = 100000
					local v23 = nil
					for v24, _ in v19 do
						if not v24:GetAttribute("IsOpening") then
							local v25 = v_u_5:GetDistance(v21, v24)
							if v25 < v22 then
								v23 = v24
								v22 = v25
							end
						end
					end
					if v23 == nil then
						if v21.Humanoid then
							v21.Humanoid.AutoRotate = true
						end
					else
						local v26 = v23:GetPivot().Position
						local v27 = v21:GetPivot().Position
						local v28 = CFrame.lookAt
						local v29 = v26.X
						local v30 = v27.Y
						local v31 = v26.Z
						v21:PivotTo((v28(v27, (Vector3.new(v29, v30, v31)))))
					end
				end
			else
				return
			end
		else
			return
		end
	else
		return
	end
end
function v12.KnitStart(p_u_32)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if v_u_2.LocalPlayer.Character then
		p_u_32:_InitCharacter(v_u_2.LocalPlayer.Character)
	end
	v_u_2.LocalPlayer.CharacterAdded:Connect(function(p33)
		-- upvalues: (copy) p_u_32
		p_u_32:_InitCharacter(p33)
	end)
	v_u_3.Heartbeat:Connect(_OnHeartbeat)
end
return v12

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.WeatherController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("Lighting")
game:GetService("StarterPlayer")
local v4 = game:GetService("SoundService")
local v_u_5 = v4:WaitForChild("FadeInWhite")
local v_u_6 = v4:WaitForChild("FadeEnd")
v4:WaitForChild("FadeInWhite2")
local v_u_7 = require(v_u_1.Packages.Knit)
local v_u_8 = require(v_u_1.Configs.WeatherConfig)
local v_u_9 = require(v_u_1.Configs.EventConfig)
local v_u_10 = require(v_u_1.Configs.TraitsConfig)
local v_u_11 = require(v_u_1.Shared.AbbreviationUtils)
local v_u_12 = nil
local v13 = v_u_7.CreateController({
	["Name"] = "WeatherController"
})
local v_u_14 = {}
local v_u_15 = nil
v_u_7.PlayerGui:WaitForChild("HUD"):WaitForChild("Buffs")
local v_u_16 = v_u_7.PlayerGui:WaitForChild("HUD"):WaitForChild("RightBuffs")
local v_u_17 = v3:WaitForChild("WeatherColor")
local v_u_18 = game.ReplicatedStorage:WaitForChild("ActiveWeathers")
local v_u_19 = v_u_7.PlayerGui:WaitForChild("Effects"):WaitForChild("TopNotifications")
local v_u_20 = nil
local v_u_21 = game.ReplicatedStorage:WaitForChild("ActiveEvents")
local v_u_22 = {
	["candy"] = "#f0a6ff",
	["gold"] = "#ffe042",
	["diamond"] = "#2bfbff",
	["void"] = "#c743ff"
}
local v_u_23 = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
function FadeInWhiteScreen(p_u_24)
	-- upvalues: (copy) v_u_17, (copy) v_u_5, (copy) v_u_6, (copy) v_u_2
	task.spawn(function()
		-- upvalues: (ref) v_u_17, (copy) p_u_24, (ref) v_u_5, (ref) v_u_6, (ref) v_u_2
		v_u_17.Enabled = true
		if p_u_24 then
			v_u_5.TimePosition = 0
			v_u_5:Play()
		else
			v_u_6.TimePosition = 0
			v_u_6:Play()
		end
		v_u_2:Create(workspace.CurrentCamera, TweenInfo.new(2.7, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			["FieldOfView"] = 120
		}):Play()
		v_u_2:Create(v_u_17, TweenInfo.new(1.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			["Brightness"] = 1,
			["TintColor"] = Color3.fromRGB(232, 232, 232)
		}):Play()
		wait(1.4)
		v_u_2:Create(workspace.CurrentCamera, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			["FieldOfView"] = 70
		}):Play()
		v_u_2:Create(v_u_17, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			["Brightness"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		wait(1)
		v_u_17.Enabled = false
	end)
end
local function v_u_32(p_u_25)
	-- upvalues: (copy) v_u_14, (copy) v_u_8, (copy) v_u_16, (ref) v_u_20, (copy) v_u_22, (copy) v_u_2, (copy) v_u_23, (ref) v_u_15, (copy) v_u_18, (copy) v_u_11
	local v_u_26 = p_u_25.Name
	if v_u_14[v_u_26] then
		return
	else
		v_u_14[v_u_26] = true
		local v27 = v_u_8[p_u_25.Name]
		local v_u_28 = script.EVENT_TEMPLATE:Clone()
		v_u_28.Name = v_u_26
		v_u_28.IMG.Image = "rbxassetid://" .. v27.image
		v_u_28.Tooltip.TextLabel.Text = v27.name
		v_u_28.Tooltip.TextLabel.TextLabel.Text = v_u_28.Tooltip.TextLabel.Text
		v_u_28.LayoutOrder = -(#v_u_16:GetChildren() * 100)
		v_u_28.Parent = v_u_16
		local v_u_29 = v_u_20:WaitForChild("UIStroke")
		v_u_20.Text = ("<font color=\"%*\">%*</font> has started"):format(v_u_22[v_u_26], v27.name)
		v_u_20.TextTransparency = 0
		v_u_29.Transparency = 0
		v_u_20.Visible = true
		task.delay(5, function()
			-- upvalues: (ref) v_u_2, (ref) v_u_20, (ref) v_u_23, (copy) v_u_29
			local v30 = v_u_2:Create(v_u_20, v_u_23, {
				["TextTransparency"] = 1
			})
			local v31 = v_u_2:Create(v_u_29, v_u_23, {
				["Transparency"] = 1
			})
			v30:Play()
			v31:Play()
			v30.Completed:Wait()
			v_u_20.Visible = false
		end)
		if v_u_16:FindFirstChild("NextEvent") then
			v_u_16.NextEvent.Visible = false
		end
		v_u_15 = v_u_26
		FadeInWhiteScreen(true)
		if p_u_25 then
			p_u_25.Changed:Connect(function(_)
				-- upvalues: (copy) v_u_28, (ref) v_u_11, (copy) p_u_25
				v_u_28.Timer.Text = v_u_11:AbbreviateTime(p_u_25.Value)
			end)
			p_u_25.Destroying:Connect(function()
				-- upvalues: (copy) v_u_28, (ref) v_u_14, (copy) v_u_26, (ref) v_u_15, (ref) v_u_18
				v_u_28:Destroy()
				v_u_14[v_u_26] = nil
				local _ = v_u_26 == v_u_15
				if #v_u_18:GetChildren() <= 0 then
					FadeInWhiteScreen(false)
				end
			end)
		else
			v_u_28:Destroy()
			v_u_14[v_u_26] = nil
			local _ = v_u_26 == v_u_15
			if #v_u_18:GetChildren() <= 0 then
				FadeInWhiteScreen(false)
			end
		end
	end
end
local function v_u_41(p_u_33)
	-- upvalues: (copy) v_u_14, (copy) v_u_9, (copy) v_u_16, (ref) v_u_20, (copy) v_u_19, (copy) v_u_2, (copy) v_u_23, (copy) v_u_11
	local v_u_34 = p_u_33.Name
	if v_u_14[v_u_34] then
		return
	else
		v_u_14[v_u_34] = true
		local v35 = v_u_9[v_u_34]
		local v_u_36 = script.EVENT_TEMPLATE:Clone()
		v_u_36.Name = v_u_34
		v_u_36.IMG.Image = "rbxassetid://" .. v35.image
		v_u_36.Tooltip.TextLabel.Text = v35.name
		v_u_36.Tooltip.TextLabel.TextLabel.Text = v_u_36.Tooltip.TextLabel.Text
		v_u_36.LayoutOrder = -(#v_u_16:GetChildren() * 100)
		v_u_36.Parent = v_u_16
		local v_u_37 = v_u_20:Clone()
		local v_u_38 = v_u_37:WaitForChild("UIStroke")
		v_u_37.Text = ("%* Event has started"):format(v35.name)
		v_u_37.Visible = true
		v_u_37.Parent = v_u_19
		task.delay(5, function()
			-- upvalues: (ref) v_u_2, (copy) v_u_37, (ref) v_u_23, (copy) v_u_38
			local v39 = v_u_2:Create(v_u_37, v_u_23, {
				["TextTransparency"] = 1
			})
			local v40 = v_u_2:Create(v_u_38, v_u_23, {
				["Transparency"] = 1
			})
			v39:Play()
			v40:Play()
			v39.Completed:Wait()
			v_u_37:Destroy()
		end)
		if p_u_33 then
			v_u_36.Timer.Text = v_u_11:AbbreviateTime(p_u_33.Value)
			p_u_33.Changed:Connect(function(_)
				-- upvalues: (copy) v_u_36, (ref) v_u_11, (copy) p_u_33
				v_u_36.Timer.Text = v_u_11:AbbreviateTime(p_u_33.Value)
			end)
			p_u_33.Destroying:Connect(function()
				-- upvalues: (copy) v_u_36, (ref) v_u_14, (copy) v_u_34
				v_u_36:Destroy()
				v_u_14[v_u_34] = nil
			end)
		else
			v_u_36:Destroy()
			v_u_14[v_u_34] = nil
		end
	end
end
function v13.KnitStart(_)
	-- upvalues: (ref) v_u_12, (copy) v_u_7, (copy) v_u_1, (ref) v_u_20, (copy) v_u_10, (copy) v_u_32, (copy) v_u_21, (copy) v_u_41
	v_u_12 = v_u_7.GetService("TraitService")
	local v42 = v_u_1:WaitForChild("ActiveWeathers")
	v_u_20 = v_u_7.PlayerGui:WaitForChild("Effects"):WaitForChild("TopNotifications"):WaitForChild("WeatherText")
	v_u_12.OnTraitHit:Connect(function(p43, p44)
		-- upvalues: (ref) v_u_10
		local v45 = v_u_10.TRAITS[p43].hitFunction
		if v45 then
			v45(p44)
		end
	end)
	v42.ChildAdded:Connect(function(p46)
		-- upvalues: (ref) v_u_32
		v_u_32(p46)
	end)
	v_u_21.ChildAdded:Connect(function(p47)
		-- upvalues: (ref) v_u_41
		v_u_41(p47)
	end)
	task.wait(3)
	for _, v48 in pairs(v42:GetChildren()) do
		v_u_32(v48)
	end
	for _, v49 in v_u_21:GetChildren() do
		v_u_41(v49)
	end
end
return v13

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.EquipController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v3 = require(v1.Packages.Knit)
local v4 = require(v1.Packages.signal)
require(v1["Ragdoll Module"])
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = v3.CreateController({
	["Name"] = "EquipController"
})
v_u_8.ToolAdded = v4.new()
v_u_8.ToolRemoved = v4.new()
function v_u_8.GetTool(_)
	-- upvalues: (ref) v_u_7
	return v_u_7
end
function _OnToolRemoved(p9)
	-- upvalues: (ref) v_u_7, (copy) v_u_8
	v_u_7 = nil
	v_u_8.ToolRemoved:Fire(p9)
end
function _OnToolAdded(p10)
	-- upvalues: (ref) v_u_7, (copy) v_u_8
	v_u_7 = p10
	v_u_8.ToolAdded:Fire(p10)
end
function _InitCharacter(p11)
	-- upvalues: (ref) v_u_5, (ref) v_u_6
	local v12 = p11:FindFirstChildOfClass("Tool")
	if v12 then
		_OnToolAdded(v12)
	end
	v_u_5 = p11.ChildAdded:Connect(function(p13)
		if p13:IsA("Tool") then
			_OnToolAdded(p13)
		end
	end)
	v_u_6 = p11.ChildRemoved:Connect(function(p14)
		if p14:IsA("Tool") then
			_OnToolRemoved(p14)
		end
	end)
end
function v_u_8.KnitStart(_)
	-- upvalues: (copy) v_u_2
	if v_u_2.LocalPlayer.Character then
		_InitCharacter(v_u_2.LocalPlayer.Character)
	end
	v_u_2.LocalPlayer.CharacterAdded:Connect(function(p15)
		_InitCharacter(p15)
	end)
end
return v_u_8

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.ChaseController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.Configs.BossConfig)
local v_u_5 = require(v1.Shared.RobloxUtils)
require(v1.GameShared.PickupUtils)
require(v1.SimplePath)
local v_u_6 = require(v1.Shared.VfxManager)
local v_u_7 = v1:WaitForChild("BossModels")
local v_u_8 = workspace:WaitForChild("BossSpawns")
local v_u_9 = v1:WaitForChild("Assets"):WaitForChild("BossChaseHighlight")
local v_u_10 = v1:WaitForChild("Assets"):WaitForChild("PlayerChasedSign")
local v_u_11 = nil
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = {}
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = v_u_3.CreateController({
	["Name"] = "ChaseController"
})
function v_u_18.CollectZoneEntered(_, p19)
	-- upvalues: (copy) v_u_4, (ref) v_u_17, (ref) v_u_14
	local v20 = v_u_4[p19]
	if v20 then
		for _, v21 in workspace.BossSpawns:GetChildren() do
			local v22 = v21:FindFirstChild(v21.Name)
			if v22 then
				local v23 = v_u_17:FromInstance(v22)
				if v23 then
					if v21.Name == p19 then
						if not v_u_14 or v_u_14 < v20.level then
							v23:ChaseLuckyBlock()
						end
					else
						v23:ReturnToSpawn(nil, true)
					end
				else
					warn((("Could not find boss component for %*"):format(v22.Name)))
				end
			end
		end
		if not v_u_14 or v_u_14 <= v20.level then
			v_u_14 = v20.level
		end
	else
		warn((("Could not find boss config for %*"):format(p19)))
		return
	end
end
function v_u_18.ZoneEntered(_, p24)
	for _, v25 in workspace.BossSpawns:GetChildren() do
		if p24 == v25.Name then
			_Chase(v25.Name)
		end
	end
end
function v_u_18.ZoneExited(_, _) end
function _HideBoss(p26)
	-- upvalues: (copy) v_u_15, (copy) v_u_6
	if not v_u_15[p26] then
		v_u_15[p26] = {}
		for _, v27 in p26:GetDescendants() do
			if v27:IsA("BasePart") or v27:IsA("Decal") then
				v_u_15[p26][v27] = v27.Transparency
			end
		end
	end
	for _, v28 in p26:GetDescendants() do
		if v28:IsA("BasePart") or v28:IsA("Decal") then
			v28.Transparency = 1
		end
	end
	v_u_6.Enable(p26, false)
end
function _ShowBoss(p29)
	-- upvalues: (copy) v_u_15, (copy) v_u_6
	if v_u_15[p29] then
		for _, v30 in p29:GetDescendants() do
			if v30:IsA("BasePart") or v30:IsA("Decal") then
				v30.Transparency = v_u_15[p29][v30]
			end
		end
		v_u_6.Enable(p29, true)
	end
end
function _ReturnToSpawn(p31)
	-- upvalues: (copy) v_u_8, (ref) v_u_17
	local v32 = v_u_8:WaitForChild(p31)
	if v32 then
		local v33 = v32:WaitForChild(p31)
		if v33 then
			local v34 = v_u_17:FromInstance(v33)
			if v34 then
				v34:ReturnToSpawn()
				for _, v35 in v_u_8:GetChildren() do
					local v36 = v35:FindFirstChild(v35.Name)
					if v36 then
						_ShowBoss(v36)
					end
				end
			else
				warn((("Could not find boss component for %*"):format(p31)))
			end
		else
			warn((("Could not find boss %* at spawn"):format(p31)))
			return
		end
	else
		warn((("Could not find spawn for boss %*"):format(p31)))
		return
	end
end
function _Chase(p37)
	-- upvalues: (copy) v_u_2, (ref) v_u_11, (copy) v_u_8, (ref) v_u_17
	if v_u_2.LocalPlayer:GetAttribute("Chased") then
		return
	else
		v_u_2.LocalPlayer:SetAttribute("Chased", true)
		local v38 = v_u_11 and v_u_17:FromInstance((v_u_8:WaitForChild(v_u_11):WaitForChild(v_u_11)))
		if v38 then
			v38:ReturnToSpawn()
		end
		for _, v39 in v_u_8:GetChildren() do
			if v39.Name ~= p37 then
				local v40 = v39:FindFirstChild(v39.Name)
				if v40 then
					_HideBoss(v40)
				else
					warn((("Could not find boss %* at spawn"):format(p37)))
				end
			end
		end
		v_u_11 = p37
		local v41 = v_u_8:WaitForChild(p37):WaitForChild(p37)
		_ShowBoss(v41)
		local v42 = v_u_17:FromInstance(v41)
		if v42 then
			v42:Chase()
		end
	end
end
function _CreateBossModel(p43)
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_9
	local v44 = v_u_7:WaitForChild(p43)
	local v45 = v_u_4[p43]
	if v45 then
		local v46 = v44:Clone()
		v46.Humanoid.WalkSpeed = v45.speed
		v46.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
		v46:SetAttribute("BossId", p43)
		v46:AddTag("Boss")
		local v47 = v_u_9:Clone()
		v47.Name = "Highlight"
		v47.Enabled = false
		v47.Parent = v46
		local v48 = v46.TouchDetector
		v48.Name = p43
		v48.Parent = workspace.BossTouchDetectors
		for _, v49 in v46:GetDescendants() do
			if v49:IsA("BasePart") then
				v49.CanCollide = false
				v49.CollisionGroup = "BossCharacter"
			end
		end
		return v46
	end
	warn((("Could not find config for boss %*"):format(p43)))
end
function _InitCharacter(p50)
	-- upvalues: (ref) v_u_11, (ref) v_u_12, (ref) v_u_13, (copy) v_u_10
	if v_u_11 then
		_ReturnToSpawn(v_u_11)
		v_u_11 = nil
	end
	if v_u_12 then
		v_u_12:Disconnect()
		v_u_12 = nil
	end
	if v_u_13 then
		v_u_13:Disconnect()
		v_u_13 = nil
	end
	local v51 = v_u_10:Clone()
	v51.Adornee = p50:WaitForChild("Head")
	v51.Enabled = false
	v51.Parent = p50
end
function v_u_18.RespawnBossTask(_)
	-- upvalues: (copy) v_u_8, (copy) v_u_5
	while true do
		task.wait(10)
		for _, v52 in v_u_8:GetChildren() do
			local v53 = v52:FindFirstChild(v52.Name)
			if v53 then
				if not v53.PrimaryPart then
					local v54 = workspace.BossTouchDetectors:FindFirstChild(v52.Name)
					if v54 then
						v54:Destroy()
					end
					v53:Destroy()
					local v55 = _CreateBossModel(v52.Name)
					v_u_5:PivotToPlaceholder(v55, v52)
					v55.Parent = v52
				end
			else
				local v56 = workspace.BossTouchDetectors:FindFirstChild(v52.Name)
				if v56 then
					v56:Destroy()
				end
				local v57 = _CreateBossModel(v52.Name)
				v_u_5:PivotToPlaceholder(v57, v52)
				v57.Parent = v52
			end
		end
	end
end
function v_u_18.KnitStart(_)
	-- upvalues: (ref) v_u_16, (copy) v_u_3, (ref) v_u_17, (copy) v_u_4, (copy) v_u_8, (copy) v_u_5, (copy) v_u_2, (ref) v_u_14, (ref) v_u_11, (copy) v_u_18
	v_u_16 = v_u_3.GetService("PickupService")
	v_u_17 = require(v_u_3.Components.BossComponent)
	for v58, _ in v_u_4 do
		v_u_8:WaitForChild(v58)
	end
	for _, v59 in v_u_8:GetChildren() do
		local v60 = _CreateBossModel(v59.Name)
		v_u_5:PivotToPlaceholder(v60, v59)
		v60.Parent = v59
	end
	local v61 = v_u_2.LocalPlayer.Character or v_u_2.LocalPlayer.CharacterAdded:Wait()
	if v61 then
		_InitCharacter(v61)
	end
	v_u_2.LocalPlayer.CharacterAdded:Connect(function(p62)
		_InitCharacter(p62)
	end)
	v_u_2.LocalPlayer:GetAttributeChangedSignal("InSpawn"):Connect(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_14, (ref) v_u_11
		if v_u_2.LocalPlayer:GetAttribute("InSpawn") then
			v_u_14 = nil
			v_u_2.LocalPlayer:SetAttribute("Chased", nil)
			if v_u_11 then
				_ReturnToSpawn(v_u_11)
				v_u_11 = nil
			end
		end
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_18
		v_u_18:RespawnBossTask()
	end)
end
return v_u_18

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.PickupController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
game:GetService("StarterPlayer")
require(v1.Modifiers)
local v_u_3 = require(v1.Packages.Knit)
require(v1.GameShared.PickupUtils)
local v_u_4 = v1:WaitForChild("Assets"):WaitForChild("Pickup"):WaitForChild("PickupPlayer")
local v_u_5 = nil
local v_u_6 = nil
local v7 = v_u_3.CreateController({
	["Name"] = "PickupController"
})
local v_u_8 = v2.LocalPlayer
local v_u_9 = v_u_8:WaitForChild("PlayerGui"):WaitForChild("HUD"):WaitForChild("Drop")
local v_u_10 = nil
function v7.KnitStart(_)
	-- upvalues: (copy) v_u_3, (ref) v_u_6, (ref) v_u_5, (copy) v_u_4, (ref) v_u_10, (copy) v_u_8, (copy) v_u_9
	local v11 = require(v_u_3.UIComponents.Button)
	v_u_6 = v_u_3.GetController("ReplicaController")
	v_u_5 = v_u_3.GetService("PickupService")
	local function v15(p12)
		-- upvalues: (ref) v_u_4, (ref) v_u_10
		p12:WaitForChild("HumanoidRootPart")
		local v13 = p12.PrimaryPart
		if v13 then
			local v14 = v_u_4:Clone()
			v14.Adornee = v13
			v14.Parent = v13
			v14.Enabled = false
			v_u_10 = v14
		end
		p12.ChildAdded:Connect(function(_) end)
		p12.ChildRemoved:Connect(function(_) end)
	end
	v_u_8:GetAttributeChangedSignal("InSpawn"):Connect(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_10
		if v_u_10 and v_u_8:GetAttribute("InSpawn") then
			v_u_10.Enabled = false
		end
	end)
	v_u_8.CharacterAdded:Connect(v15)
	if v_u_8.Character then
		v15(v_u_8.Character)
	end
	v11:WaitForInstance(v_u_9):andThen(function(p16)
		-- upvalues: (ref) v_u_5
		p16:AddCallback(function()
			-- upvalues: (ref) v_u_5
			v_u_5:DropLast()
		end)
	end)
end
return v7

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.GiftPopupController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.Configs.BrainrotsConfig)
local v_u_5 = require(v1.Configs.MutationConfig)
require(v1.Entities.BrainrotEntity)
local v6 = v2.LocalPlayer.PlayerGui:WaitForChild("Windows"):WaitForChild("GiftSendPopup")
local v7 = v2.LocalPlayer.PlayerGui:WaitForChild("Windows"):WaitForChild("GiftReceivePopup")
local v_u_8 = v6:WaitForChild("Accept")
local v_u_9 = v6:WaitForChild("Decline")
local v_u_10 = v6:WaitForChild("item"):WaitForChild("Level")
local v_u_11 = v6:WaitForChild("item"):WaitForChild("Title"):WaitForChild("StudPattern"):WaitForChild("TextLabel")
local v_u_12 = v6:WaitForChild("item"):WaitForChild("BrainrotImage")
local v_u_13 = v6:WaitForChild("item"):WaitForChild("MutationImage")
local v_u_14 = v6:WaitForChild("GiftingUser")
local v_u_15 = v7:WaitForChild("Accept")
local v_u_16 = v7:WaitForChild("Decline")
local v_u_17 = v7:WaitForChild("item"):WaitForChild("Level")
local v_u_18 = v7:WaitForChild("item"):WaitForChild("Title"):WaitForChild("StudPattern"):WaitForChild("TextLabel")
local v_u_19 = v7:WaitForChild("item"):WaitForChild("BrainrotImage")
local v_u_20 = v7:WaitForChild("item"):WaitForChild("MutationImage")
local v_u_21 = v7:WaitForChild("GiftingUser")
local v_u_22 = nil
local v_u_23 = nil
local v_u_24 = {
	["entityId"] = nil,
	["brainrotType"] = nil,
	["mutation"] = nil,
	["receivingPlayer"] = nil
}
local v_u_25 = {
	["entityId"] = nil
}
local v_u_26 = nil
local v27 = v_u_3.CreateController({
	["Name"] = "GiftPopupController"
})
function v27.GiftBrainrot(_, p28, p29, p30, p31, p32)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14, (ref) v_u_24, (ref) v_u_23
	local v33 = v_u_4[p29]
	if v33 then
		local v34 = v_u_5[p30]
		v_u_10.Text = ("Level %*"):format(p31)
		v_u_11.Text = v33.name
		v_u_12.Image = ("rbxassetid://%*"):format(v33.image)
		if p30 == "NORMAL" or not v34 then
			v_u_13.Visible = false
		else
			v_u_13.Image = ("rbxassetid://%*"):format(v34.image)
		end
		v_u_14.Text = ("to @%*"):format(p32.DisplayName)
		v_u_24.entityId = p28
		v_u_24.brainrotType = p29
		v_u_24.mutation = p30
		v_u_24.receivingPlayer = p32
		v_u_23:SetCurrentWindow("GiftSendPopup")
	else
		warn((("Could not find brainrot config for %*"):format(p29)))
	end
end
function v27.KnitStart(_)
	-- upvalues: (ref) v_u_22, (copy) v_u_3, (ref) v_u_23, (ref) v_u_25, (copy) v_u_4, (ref) v_u_26, (copy) v_u_5, (copy) v_u_17, (copy) v_u_18, (copy) v_u_19, (copy) v_u_20, (copy) v_u_21, (copy) v_u_8, (ref) v_u_24, (copy) v_u_9, (copy) v_u_15, (copy) v_u_16
	v_u_22 = v_u_3.GetService("GiftingService")
	v_u_23 = v_u_3.GetController("WindowController")
	v_u_22.GiftReceived:Connect(function(p35, p36)
		-- upvalues: (ref) v_u_25, (ref) v_u_4, (ref) v_u_22, (ref) v_u_26, (ref) v_u_23, (ref) v_u_5, (ref) v_u_17, (ref) v_u_18, (ref) v_u_19, (ref) v_u_20, (ref) v_u_21
		v_u_25.entityId = p36.id
		local v37 = v_u_4[p36.brainrotType]
		if v37 then
			if v_u_26 then
				task.cancel(v_u_26)
				v_u_26 = nil
			end
			v_u_26 = task.delay(60, function()
				-- upvalues: (ref) v_u_25, (ref) v_u_23, (ref) v_u_26
				v_u_25 = {}
				if v_u_23.currentWindow == "GiftReceivePopup" then
					v_u_23:CloseCurrentWindow()
				end
				v_u_26 = nil
			end)
			local v38 = v_u_5[p36.mutation]
			v_u_17.Text = ("Level %*"):format(p36.level)
			v_u_18.Text = v37.name
			v_u_19.Image = ("rbxassetid://%*"):format(v37.image)
			if p36.mutation == "NORMAL" or not v38 then
				v_u_20.Visible = false
			else
				v_u_20.Image = ("rbxassetid://%*"):format(v38.image)
			end
			v_u_21.Text = ("@%*"):format(p35.DisplayName)
			v_u_23:SetCurrentWindow("GiftReceivePopup")
		else
			warn((("Could not find brainrot config for %*"):format(p36.brainrotType)))
			v_u_22:DeclineGift(v_u_25.entityId)
		end
	end)
	local v39 = require(v_u_3.UIComponents.Button)
	v39:WaitForInstance(v_u_8):andThen(function(p40)
		-- upvalues: (ref) v_u_24, (ref) v_u_22, (ref) v_u_23
		p40:AddCallback(function()
			-- upvalues: (ref) v_u_24, (ref) v_u_22, (ref) v_u_23
			if v_u_24.entityId and v_u_24.receivingPlayer then
				v_u_22:GiftBrainrot(v_u_24.entityId, v_u_24.receivingPlayer)
				v_u_23:CloseCurrentWindow()
			end
		end)
	end)
	v39:WaitForInstance(v_u_9):andThen(function(p41)
		-- upvalues: (ref) v_u_24, (ref) v_u_23
		p41:AddCallback(function()
			-- upvalues: (ref) v_u_24, (ref) v_u_23
			v_u_24 = {}
			v_u_23:CloseCurrentWindow()
		end)
	end)
	v39:WaitForInstance(v_u_15):andThen(function(p42)
		-- upvalues: (ref) v_u_25, (ref) v_u_22, (ref) v_u_23
		p42:AddCallback(function()
			-- upvalues: (ref) v_u_25, (ref) v_u_22, (ref) v_u_23
			if v_u_25.entityId then
				v_u_22:ClaimGift(v_u_25.entityId)
				v_u_23:CloseCurrentWindow()
			end
		end)
	end)
	v39:WaitForInstance(v_u_16):andThen(function(p43)
		-- upvalues: (ref) v_u_25, (ref) v_u_22, (ref) v_u_23
		p43:AddCallback(function()
			-- upvalues: (ref) v_u_25, (ref) v_u_22, (ref) v_u_23
			if v_u_25.entityId then
				v_u_22:DeclineGift(v_u_25.entityId)
				v_u_23:CloseCurrentWindow()
			end
		end)
	end)
end
return v27

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.TutorialController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
game:GetService("MarketplaceService")
local v_u_3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.Shared.Janitor)
require(v1.Configs.MonetizationConfig)
local v_u_5 = require(script.TutorialSteps)
local v_u_6 = v2.LocalPlayer
local _ = v2.LocalPlayer.PlayerGui
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
local v11 = v_u_3.CreateController({
	["Name"] = "TutorialController",
	["steps"] = {},
	["finished"] = false
})
function v11.StartTutorial(p12, p13)
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
	local v14 = p13 or "onboarding"
	if v_u_5.stepJanitor then
		v_u_5.stepJanitor:Cleanup()
		v_u_5.stepJanitor:Destroy()
	end
	v_u_5.stepJanitor = v_u_4.new()
	v_u_6:SetAttribute("TutorialStep", nil)
	local v15 = v_u_5[v14]
	if v15 then
		p12.steps = v15
		p12:Advance()
	else
		warn((("No tutorial steps for type %*"):format(v14)))
	end
end
function v11.RunStep(p16, p17)
	local v18 = p16.steps[p17]
	if v18 then
		v18(p16)
	else
		warn((("No tutorial step for index %*"):format(p17)))
	end
end
function v11.Advance(p19)
	-- upvalues: (copy) v_u_6, (copy) v_u_5
	local v20 = (v_u_6:GetAttribute("TutorialStep") or 0) + 1
	v_u_5.stepJanitor:Cleanup()
	v_u_6:SetAttribute("TutorialStep", v20)
	if p19.steps[v20] then
		p19:RunStep(v20)
	else
		p19:FinishTutorial()
	end
end
function v11.FinishTutorial(p21, _)
	-- upvalues: (copy) v_u_5, (ref) v_u_10, (ref) v_u_9
	p21.finished = true
	if v_u_5.stepJanitor then
		v_u_5.stepJanitor:Cleanup()
	end
	v_u_10:MarkDone()
	v_u_9:OnTutorialFinished()
end
function v11._ShouldStartTutorial(_)
	-- upvalues: (ref) v_u_7
	return not v_u_7:GetPlayerData().TutorialFinished
end
function v11.KnitStart(p22)
	-- upvalues: (ref) v_u_7, (copy) v_u_3, (ref) v_u_9, (ref) v_u_8, (ref) v_u_10
	v_u_7 = v_u_3.GetController("ReplicaController")
	v_u_9 = v_u_3.GetService("AnalyticsService")
	v_u_8 = v_u_3.GetController("WindowController")
	v_u_10 = v_u_3.GetService("TutorialService")
	if p22:_ShouldStartTutorial() then
		task.delay(1, function()
			-- upvalues: (ref) v_u_8
			v_u_8:SetCurrentWindow("DailyRewards")
		end)
		p22:StartTutorial("onboarding")
	end
end
return v11

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.TutorialController.TutorialUtils
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Shared.Janitor)
local v_u_4 = v2.LocalPlayer
local v_u_5 = v1.Assets.Tutorial.PartBeam
local v_u_6 = v1.Assets.Tutorial.TutorialHighlight
return {
	["TargetPartFromPlayer"] = function(p7, p8)
		-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
		local v9 = p8 or {}
		local v10 = v_u_3.new()
		local v11 = v_u_5:Clone()
		local v12 = v_u_4.Character or v_u_4.CharacterAdded:Wait()
		local v13 = v12:WaitForChild("HumanoidRootPart"):WaitForChild("RootRigAttachment")
		local v14 = p7:FindFirstChild("TutorialTargetAttachment")
		local v15
		if v14 then
			v15 = false
		else
			v14 = Instance.new("Attachment")
			v14.Name = "TutorialTargetAttachment"
			v14.Parent = p7
			v15 = true
		end
		v11.Attachment0 = v13
		v11.Attachment1 = v14
		v11.Parent = v12
		v10:Add(v11, "Destroy")
		if v15 then
			v10:Add(v14, "Destroy")
		end
		if v9.withHighlight then
			local v16 = v_u_6:Clone()
			v16.Adornee = p7
			v16.Parent = p7
			v10:Add(v16, "Destroy")
		end
		return v10
	end
}

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.TutorialController.TutorialSteps
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.Knit)
local v4 = require(v1.Shared.Janitor)
local v_u_5 = require(script.Parent.TutorialUtils)
require(v1.Shared.TableUtils)
require(v1.Shared.RobloxUtils)
require(v1.Shared.UIUtils)
local v_u_6 = require(v1.GameShared.PlotUtils)
require(v1.GameShared.PickupUtils)
require(v1.GameShared.SpawnPlatformUtils)
local _ = v_u_2.LocalPlayer.PlayerGui
workspace:WaitForChild("SpawnArrow")
workspace:WaitForChild("Bases"):WaitForChild("base1")
local v_u_7 = workspace:WaitForChild("TrackStart")
local v_u_8 = workspace:WaitForChild("SpawnTarget")
local v_u_9 = {
	["stepJanitor"] = v4.new()
}
v_u_9.onboarding = {
	function(p_u_10)
		-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_9, (copy) v_u_2
		local v11 = v_u_5.TargetPartFromPlayer(v_u_7)
		v_u_9.stepJanitor:Add(v11, "Cleanup")
		local v12 = v_u_2.LocalPlayer:GetAttributeChangedSignal("InSpawn"):Connect(function()
			-- upvalues: (ref) v_u_2, (copy) p_u_10
			if not v_u_2.LocalPlayer:GetAttribute("InSpawn") then
				p_u_10:Advance()
			end
		end)
		v_u_9.stepJanitor:Add(v12, "Disconnect")
	end,
	function(p_u_13)
		-- upvalues: (copy) v_u_2, (copy) v_u_9
		local v14 = v_u_2.LocalPlayer:GetAttributeChangedSignal("Chased"):Connect(function()
			-- upvalues: (ref) v_u_2, (copy) p_u_13
			if v_u_2.LocalPlayer:GetAttribute("Chased") then
				p_u_13:Advance()
			end
		end)
		v_u_9.stepJanitor:Add(v14, "Disconnect")
	end,
	function(p_u_15)
		-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_9, (copy) v_u_2
		local v16 = v_u_5.TargetPartFromPlayer(v_u_8)
		v_u_9.stepJanitor:Add(v16, "Cleanup")
		local v17 = v_u_2.LocalPlayer:GetAttributeChangedSignal("InSpawn"):Connect(function()
			-- upvalues: (ref) v_u_2, (copy) p_u_15
			if v_u_2.LocalPlayer:GetAttribute("InSpawn") then
				p_u_15:Advance()
			end
		end)
		v_u_9.stepJanitor:Add(v17, "Disconnect")
	end,
	function(p_u_18)
		-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_2, (copy) v_u_9
		local v19 = v_u_3.GetController("ReplicaController")
		local v_u_20 = v19:GetPlayerData()
		v_u_6.GetPlayerPlot(v_u_2.LocalPlayer)
		for _, v21 in v_u_20.Inventory do
			if v21.itemType == "Brainrot" then
				p_u_18:Advance()
				return
			end
		end
		local v24 = v19:GetReplica():OnSet({ "Inventory" }, function(p22)
			-- upvalues: (copy) p_u_18
			for _, v23 in p22 do
				if v23.itemType == "Brainrot" then
					p_u_18:Advance()
					return
				end
			end
		end)
		v_u_9.stepJanitor:Add(v24, "Disconnect")
		task.delay(0.5, function()
			-- upvalues: (copy) v_u_20, (copy) p_u_18
			for _, v25 in v_u_20.Inventory do
				if v25.itemType == "Brainrot" then
					return
				end
			end
			p_u_18:StartTutorial()
		end)
	end,
	function(p_u_26)
		-- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_5, (copy) v_u_9
		local v27 = v_u_6.GetContainers(v_u_2.LocalPlayer)
		local v_u_28 = v_u_6.GetContainer(v_u_2.LocalPlayer, "1")
		local v29 = v_u_5.TargetPartFromPlayer(v_u_28)
		v_u_9.stepJanitor:Add(v29, "Cleanup")
		local v31 = v_u_2.LocalPlayer.CharacterAdded:Connect(function(_)
			-- upvalues: (ref) v_u_5, (copy) v_u_28, (ref) v_u_9
			local v30 = v_u_5.TargetPartFromPlayer(v_u_28)
			v_u_9.stepJanitor:Add(v30, "Cleanup")
		end)
		v_u_9.stepJanitor:Add(v31, "Disconnect")
		for _, v32 in v27 do
			local v33 = v32:WaitForChild("InnerModel")
			for _, v34 in v33:GetChildren() do
				if v34:HasTag("Brainrot") then
					p_u_26:Advance()
					return
				end
			end
			local v36 = v33.ChildAdded:Connect(function(p35)
				-- upvalues: (copy) p_u_26
				if p35:HasTag("Brainrot") then
					p_u_26:Advance()
				end
			end)
			v_u_9.stepJanitor:Add(v36, "Disconnect")
		end
	end,
	function(p_u_37)
		-- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_5, (copy) v_u_9
		task.wait(1.25)
		for _, v38 in v_u_6.GetContainers(v_u_2.LocalPlayer) do
			for _, v39 in v38:WaitForChild("InnerModel"):GetChildren() do
				if v39:HasTag("Brainrot") then
					local v40 = v38:WaitForChild("Collection")
					local v41 = v_u_5.TargetPartFromPlayer(v40)
					v_u_9.stepJanitor:Add(v41, "Cleanup")
					local v42 = v40.PrimaryPart
					if v42 then
						local v_u_43 = nil
						v_u_43 = v42.Touched:Connect(function(p44)
							-- upvalues: (ref) v_u_2, (ref) v_u_43, (copy) p_u_37
							if v_u_2:GetPlayerFromCharacter(p44.Parent) == v_u_2.LocalPlayer then
								if v_u_43 then
									v_u_43:Disconnect()
								end
								p_u_37:Advance()
							end
						end)
						v_u_9.stepJanitor:Add(v_u_43)
					end
				end
			end
		end
	end
}
return v_u_9

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.ContainerWorkController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.GameShared.PlotUtils)
local v_u_5 = nil
local v6 = v_u_3.CreateController({
	["Name"] = "ContainerWorkController"
})
function v6.KnitStart(_)
	-- upvalues: (ref) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
	v_u_5 = v_u_3.GetService("ContainerService")
	local v_u_7 = require(v_u_3.Components.ContainerAnimationComponent)
	task.delay(2, function()
		-- upvalues: (ref) v_u_5, (ref) v_u_4, (ref) v_u_2, (copy) v_u_7
		v_u_5.WorkUpdate:Connect(function(p8)
			-- upvalues: (ref) v_u_4, (ref) v_u_2, (ref) v_u_7
			local v9 = v_u_4.GetContainersById(v_u_2.LocalPlayer)
			for v10, v11 in p8 do
				local v12 = v9[v10]
				if v12 then
					local v13 = v_u_7:FromInstance(v12)
					if v13 then
						v13:UpdateCash(v11)
					end
				else
					warn("Got work update for a model that does not exist")
				end
			end
		end)
	end)
end
return v6

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.OfflineWorkController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("MarketplaceService")
local v_u_4 = require(v1.Packages.Knit)
local v_u_5 = require(v1.Configs.MonetizationConfig)
local v_u_6 = require(v1.Shared.AbbreviationUtils)
local v_u_7 = v2.LocalPlayer.PlayerGui:WaitForChild("Windows"):WaitForChild("OfflineCash")
local v_u_8 = v_u_7:WaitForChild("Cash")
local v_u_9 = v_u_8:WaitForChild("Cash")
local v_u_10 = v_u_7:WaitForChild("ButtonsFrame"):WaitForChild("Claim")
v_u_7:WaitForChild("Close")
local v_u_11 = nil
local v_u_12 = nil
local v_u_13 = nil
local v14 = v_u_4.CreateController({
	["Name"] = "OfflineWorkController"
})
function _ShowOfflineWindow(p15)
	-- upvalues: (ref) v_u_12, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9
	if v_u_12.currentWindow ~= "OfflineCash" then
		v_u_12:SetCurrentWindow("OfflineCash")
	end
	local v16 = v_u_6:AbbreviateNumber(p15)
	v_u_8.Text = ("%*$"):format(v16)
	v_u_9.Text = ("%*$"):format(v16)
end
function v14.KnitStart(_)
	-- upvalues: (ref) v_u_11, (copy) v_u_4, (ref) v_u_12, (ref) v_u_13, (copy) v_u_5, (copy) v_u_10, (copy) v_u_7, (copy) v_u_3
	v_u_11 = v_u_4.GetController("ReplicaController")
	v_u_12 = v_u_4.GetController("WindowController")
	v_u_13 = v_u_4.GetService("ContainerService")
	local v17 = require(v_u_4.UIComponents.Button)
	local v_u_18 = false
	local v19 = v_u_11:GetPlayerData()
	local v20 = v19.Gamepasses or {}
	if v19.OfflineCash > 0 then
		local v21 = v_u_5.DOUBLE_CASH_GAIN.id
		if v20[tostring(v21)] then
			v19.OfflineCash = v19.OfflineCash * 2
		end
		_ShowOfflineWindow(v19.OfflineCash)
	end
	v_u_11:GetReplica():OnSet({ "OfflineCash" }, function(p22)
		-- upvalues: (ref) v_u_11, (ref) v_u_5
		local v23 = v_u_11:GetPlayerData().Gamepasses or {}
		if p22 > 0 then
			local v24 = v_u_5.DOUBLE_CASH_GAIN.id
			if v23[tostring(v24)] then
				p22 = p22 * 2
			end
			_ShowOfflineWindow(p22)
		end
	end)
	v17:WaitForInstance(v_u_10):andThen(function(p25)
		-- upvalues: (ref) v_u_13, (ref) v_u_18, (ref) v_u_12
		p25:AddCallback(function()
			-- upvalues: (ref) v_u_13, (ref) v_u_18, (ref) v_u_12
			v_u_13:CollectOfflineCash()
			v_u_18 = true
			v_u_12:CloseCurrentWindow()
		end)
	end)
	v_u_7.Changed:Connect(function(p26)
		-- upvalues: (ref) v_u_18, (ref) v_u_7, (ref) v_u_13
		if v_u_18 then
			return
		elseif p26 == "Visible" then
			if not v_u_7.Visible then
				v_u_13:CollectOfflineCash()
			end
		else
			return
		end
	end)
	v_u_3.PromptProductPurchaseFinished:Connect(function(_, p27, p28)
		-- upvalues: (ref) v_u_5, (ref) v_u_18, (ref) v_u_12
		if p27 == v_u_5.OFFLINE_CASH_MULTIPLIER.id and p28 then
			v_u_18 = true
			v_u_12:CloseCurrentWindow()
		end
	end)
end
return v14

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.SpeedCoilController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Configs.GearsConfig)
local v_u_4 = require(v1.Packages.Knit)
local v_u_5 = require(v1.Modifiers)
local v_u_6 = require(v1.Shared.CharacterUtil)
local v_u_7 = v2.LocalPlayer
local v8 = v_u_4.CreateController({
	["Name"] = "SpeedCoilController"
})
function v8.KnitStart(_)
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_3, (copy) v_u_5, (copy) v_u_6
	local v9 = v_u_4.GetController("EquipController")
	v9.ToolAdded:Connect(function(p10)
		-- upvalues: (ref) v_u_7, (ref) v_u_3, (ref) v_u_5, (ref) v_u_6
		if p10:GetAttribute("GearType") == "SpeedCoil" then
			local v11 = p10:GetAttribute("GearId")
			if not v_u_7:GetAttribute("SlowMovementSpeed") then
				local v12 = v_u_3.GEARS[v11]
				local v13 = v_u_5.Get(v_u_7, "MovementSpeed") * v12.stats.speedBoost
				v_u_6.SetPlayerSpeed(v_u_7, v13)
			end
		end
	end)
	v9.ToolRemoved:Connect(function(p14)
		-- upvalues: (ref) v_u_5, (ref) v_u_7, (ref) v_u_6
		if p14:GetAttribute("GearType") == "SpeedCoil" then
			local v15 = v_u_5.Get(v_u_7, "MovementSpeed")
			if v_u_7:GetAttribute("SlowMovementSpeed") then
				v15 = v_u_5.Get(v_u_7, "SlowMovementSpeed")
			end
			v_u_6.SetPlayerSpeed(v_u_7, v15)
		end
	end)
	v_u_7:GetAttributeChangedSignal("SlowMovementSpeed"):Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_7, (ref) v_u_3, (ref) v_u_5
		local v16 = v_u_6.GetEquippedTool(v_u_7)
		if v16 and v16:GetAttribute("GearType") == "SpeedCoil" then
			local v17 = v16:GetAttribute("GearId")
			if not v_u_7:GetAttribute("SlowMovementSpeed") then
				local v18 = v_u_3.GEARS[v17]
				local v19 = v_u_5.Get(v_u_7, "MovementSpeed") * v18.stats.speedBoost
				v_u_6.SetPlayerSpeed(v_u_7, v19)
			end
		end
	end)
end
return v8

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.RunningController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
game:GetService("UserInputService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = require(v1.Packages.Knit)
local v_u_6 = require(v1.GameShared.RunningUtils)
require(v1.Shared.TableUtils)
require(v1.Shared.AbbreviationUtils)
local v_u_7 = require(v1.Shared.RobloxUtils)
local v_u_8 = require(v1.Modifiers)
local v_u_9 = require(v1.Configs.BossConfig)
local v_u_10 = require(v1.Configs.PlayerSkinConfig)
local v_u_11 = workspace:WaitForChild("TrackStart")
local v_u_12 = workspace:WaitForChild("TrackEnd")
local v_u_13 = v_u_2.LocalPlayer.PlayerGui:WaitForChild("HUD"):WaitForChild("BottomBar")
local v14 = v_u_13:WaitForChild("SpeedFrame"):WaitForChild("ImageLabel")
local v_u_15 = v14:WaitForChild("ROTATE_ME")
local v_u_16 = v14:WaitForChild("Numbers"):WaitForChild("Numer_Middle")
local v_u_17 = v14:WaitForChild("Numbers"):WaitForChild("Numer_End")
local v_u_18 = nil
local v_u_19 = false
local v_u_20 = {}
local v_u_21 = nil
local v_u_22 = nil
local v_u_23 = false
local v_u_24 = nil
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = nil
local v_u_28 = nil
local v_u_29 = nil
local v_u_30 = {}
local v31 = v_u_5.CreateController({
	["Name"] = "RunningController"
})
function v31.GetSkinModel(_)
	-- upvalues: (ref) v_u_18
	return v_u_18
end
function v31.Caught(_) end
local v_u_32 = Instance.new("NumberValue")
v_u_32.Value = 0
v_u_32.Changed:Connect(function(p33)
	-- upvalues: (copy) v_u_15
	v_u_15.Rotation = p33 > 190 and 190 or (p33 < -10 and -10 or p33)
end)
function _StartMove()
	-- upvalues: (ref) v_u_19, (ref) v_u_18, (copy) v_u_30, (ref) v_u_24, (ref) v_u_22, (copy) v_u_3, (copy) v_u_32
	v_u_19 = true
	if v_u_18 then
		v_u_30[v_u_18] = true
	end
	v_u_24:StartMove()
	if v_u_22 then
		v_u_22:Cancel()
		v_u_22:Destroy()
		v_u_22 = nil
	end
	v_u_22 = v_u_3:Create(v_u_32, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
		["Value"] = 180
	})
	v_u_22:Play()
end
function _EndMove()
	-- upvalues: (ref) v_u_19, (ref) v_u_18, (copy) v_u_30, (ref) v_u_20, (ref) v_u_24, (ref) v_u_22, (copy) v_u_3, (copy) v_u_32
	v_u_19 = false
	if v_u_18 then
		v_u_30[v_u_18] = false
	end
	v_u_20 = {}
	v_u_24:EndMove()
	if v_u_22 then
		v_u_22:Cancel()
		v_u_22:Destroy()
		v_u_22 = nil
	end
	v_u_22 = v_u_3:Create(v_u_32, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
		["Value"] = 0
	})
	v_u_22:Play()
end
local v_u_34 = false
local v_u_35 = 0
function _StartRun()
	-- upvalues: (ref) v_u_19, (ref) v_u_34, (copy) v_u_2, (ref) v_u_35, (ref) v_u_24, (ref) v_u_25, (copy) v_u_6, (copy) v_u_8, (copy) v_u_10, (copy) v_u_7, (copy) v_u_11, (ref) v_u_18, (copy) v_u_30, (copy) v_u_13, (ref) v_u_23
	v_u_19 = false
	v_u_34 = false
	local v36 = v_u_2.LocalPlayer.Character
	if v36 then
		local v37 = v36:FindFirstChild("Humanoid")
		if v37 and v37.MoveDirection.Magnitude > 0 then
			v_u_34 = true
		end
		v_u_35 = 0
		task.spawn(function()
			-- upvalues: (ref) v_u_24
			v_u_24:StartRun():Destroy()
		end)
		local v38 = v_u_25:GetPlayerData()
		local v39 = v_u_6.CreateSkinModel(v_u_2.LocalPlayer, v38.EquippedPlayerSkin)
		v39:SetAttribute("MovementSpeed", v_u_8.Get(v_u_2.LocalPlayer, "MovementSpeed"))
		v_u_2.LocalPlayer.Character.PrimaryPart.Anchored = true
		if v_u_2.LocalPlayer.Character:FindFirstChild("PLAYER_LUCKY_BLOCK") then
			v_u_2.LocalPlayer.Character.PLAYER_LUCKY_BLOCK:Destroy()
		end
		for _, v40 in pairs(v_u_2.LocalPlayer.Character:GetDescendants()) do
			if v40:IsA("BasePart") then
				v40:SetAttribute("OriginalTransparency", v40.Transparency)
				v40.Transparency = 1
			end
			if v40:IsA("Decal") then
				v40:SetAttribute("OriginalTransparency", v40.Transparency)
				v40.Transparency = 1
			end
			if v40:IsA("ForceField") then
				v40:Destroy()
			end
		end
		local v41 = v_u_10[v38.EquippedPlayerSkin].height
		v_u_7:PivotToPlaceholder(v39, v_u_11, nil, (Vector3.new(0, v41, 0)))
		v39:SetAttribute("IsClientCreated", true)
		v39.Parent = workspace.RunningModels
		task.wait()
		for _, v42 in ipairs(v39:GetChildren()) do
			if v42:IsA("Accessory") and v42:FindFirstChild("Handle") then
				local v43 = v42.Handle.Size.X
				local v44 = v42.Handle.Size.Y
				local v45 = v42.Handle.Size.Z
				local v46 = v42.Handle.Size.X > 2.5 and 2.5 or v43
				local v47 = v42.Handle.Size.Y > 2.5 and 2.5 or v44
				local v48 = v42.Handle.Size.Z > 2.5 and 2.5 or v45
				v42.Handle.Size = Vector3.new(v46, v47, v48)
			end
		end
		v39.VFX.Size = Vector3.new(4.922, 4.922, 4.922)
		workspace:WaitForChild("Camera").CameraSubject = v39.PrimaryPart
		v_u_18 = v39
		v_u_30[v_u_18] = false
		v_u_13.SpeedFrame.Visible = true
		v_u_23 = true
	end
end
function v31.DisconnectRunningModel(_, p49)
	-- upvalues: (copy) v_u_30, (ref) v_u_24, (ref) v_u_18
	local v50 = p49.Name
	v_u_30[p49] = nil
	v_u_24:Collected(v50)
	if v_u_18 and v50 == v_u_18.Name then
		v_u_18:Destroy()
		v_u_18 = nil
	end
end
function v31.KnitStart(_)
	-- upvalues: (ref) v_u_24, (copy) v_u_5, (ref) v_u_27, (ref) v_u_28, (ref) v_u_29, (ref) v_u_25, (ref) v_u_26, (copy) v_u_2, (copy) v_u_30, (ref) v_u_18, (copy) v_u_4, (copy) v_u_9, (ref) v_u_21, (copy) v_u_12, (copy) v_u_7, (ref) v_u_23, (ref) v_u_35, (ref) v_u_19, (ref) v_u_34, (copy) v_u_16, (copy) v_u_17
	v_u_24 = v_u_5.GetService("RunningService")
	v_u_27 = v_u_5.GetService("PickupService")
	v_u_28 = v_u_5.GetService("PlayerService")
	v_u_29 = v_u_5.GetService("BrainrotService")
	v_u_25 = v_u_5.GetController("ReplicaController")
	v_u_26 = v_u_5.GetController("ChaseController")
	v_u_29.Morphed:Connect(function(p51)
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		workspace.CurrentCamera.CameraSubject = p51.PrimaryPart
	end)
	v_u_24.StartRunSignal:Connect(function(p52)
		-- upvalues: (ref) v_u_2, (ref) v_u_30
		if p52:GetAttribute("OwnerId") ~= v_u_2.LocalPlayer.UserId then
			if not v_u_30[p52] then
				v_u_30[p52] = false
			end
		end
	end)
	v_u_24.StartMoveSignal:Connect(function(p_u_53)
		-- upvalues: (ref) v_u_18, (ref) v_u_30
		if v_u_18 and p_u_53.Name == v_u_18.Name then
			return
		elseif v_u_30[p_u_53] == nil then
			v_u_30[p_u_53] = true
		else
			v_u_30[p_u_53] = true
			p_u_53.Destroying:Connect(function()
				-- upvalues: (ref) v_u_30, (copy) p_u_53
				v_u_30[p_u_53] = nil
			end)
		end
	end)
	v_u_24.EndMoveSignal:Connect(function(p54)
		-- upvalues: (ref) v_u_18, (ref) v_u_30
		if not v_u_18 or p54.Name ~= v_u_18.Name then
			v_u_30[p54] = false
		end
	end)
	v_u_2.LocalPlayer:GetAttributeChangedSignal("InSpawn"):Connect(function()
		-- upvalues: (ref) v_u_2
		if not (v_u_2.LocalPlayer:GetAttribute("InSpawn") or v_u_2.LocalPlayer:GetAttribute("IsRunning")) then
			_StartRun()
		end
	end)
	v_u_4.Heartbeat:Connect(function(p55)
		-- upvalues: (ref) v_u_2, (ref) v_u_9, (ref) v_u_30, (ref) v_u_21, (ref) v_u_26, (ref) v_u_12, (ref) v_u_7, (ref) v_u_23, (ref) v_u_35, (ref) v_u_19, (ref) v_u_34
		for _, v56 in workspace:WaitForChild("CollectZones"):GetChildren() do
			for _, v57 in workspace:GetPartsInPart(v56) do
				if v57.Parent:HasTag("PlayerSkin") then
					local v58 = v57.Parent.Name
					local v59 = v_u_2.LocalPlayer.UserId
					if v58 == tostring(v59) then
						local v60 = v_u_9[v56.Name]
						if not v60 then
							warn((("Could not find bossc onfig for %*"):format(v56.Name)))
							return
						end
						if v_u_30[v57.Parent] ~= nil then
							v57.Parent:SetAttribute("SpeedModifier", v60.playerSpeedModifier)
						end
						v_u_21 = v60.playerSpeedModifier
						v_u_26:CollectZoneEntered(v56.Name)
						break
					end
				end
			end
		end
		for v61, v62 in pairs(v_u_30) do
			if v61 and (v61.PrimaryPart and v61.Parent) then
				local v63 = v61:GetAttribute("MovementSpeed")
				if not v62 then
					local v64 = v63 * 0.05
					v63 = math.max(v64, 5)
				end
				local v65 = v61:GetAttribute("SpeedModifier")
				if v65 then
					v63 = v63 * v65
				end
				local v66 = v61.PrimaryPart.Position
				local v67 = v_u_12.Position.X
				local v68 = v66.Y
				local v69 = v_u_12.Position.Z
				local v70 = Vector3.new(v67, v68, v69)
				local v71 = v_u_7:CalculateLerp(v61.PrimaryPart:GetPivot(), v70, v63, p55)
				if v71 then
					v61:PivotTo(v71)
				end
			end
		end
		if v_u_23 then
			local v72 = v_u_2.LocalPlayer.Character
			if v72 then
				local v73 = v72:FindFirstChild("Humanoid")
				if v73 then
					if v73.MoveDirection.Magnitude > 0 then
						v_u_35 = -1
						if not v_u_19 then
							_StartMove()
							return
						end
					elseif v_u_35 == -1 then
						if v_u_19 then
							_EndMove()
						end
					else
						v_u_35 = v_u_35 + 1
						if v_u_34 then
							_StartMove()
							return
						end
						if v_u_19 then
							_EndMove()
							return
						end
					end
				end
			else
				return
			end
		else
			return
		end
	end)
	v_u_2.LocalPlayer.CharacterAdded:Connect(function(p74)
		-- upvalues: (ref) v_u_28
		local v75 = p74:WaitForChild("Humanoid")
		if v75 then
			v75.Died:Connect(function()
				-- upvalues: (ref) v_u_28
				v_u_28:ReloadCharacter()
			end)
		end
	end)
	v_u_2.LocalPlayer:GetAttributeChangedSignal("IsRunning"):Connect(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_23
		if not v_u_2.LocalPlayer:GetAttribute("IsRunning") then
			v_u_23 = false
		end
	end)
	v_u_2.LocalPlayer:GetAttributeChangedSignal("InSpawn"):Connect(function()
		-- upvalues: (ref) v_u_2
		local v76 = game:GetService("StarterGui")
		if v_u_2.LocalPlayer:GetAttribute("InSpawn") then
			v76:SetCore("ResetButtonCallback", true)
		else
			v76:SetCore("ResetButtonCallback", false)
		end
	end)
	local v77 = v_u_25:GetPlayerData().Upgrades.MovementSpeed
	local v78 = v_u_16
	local v79 = v77 / 2
	v78.Text = ("%*"):format((math.round(v79)))
	v_u_17.Text = ("%*"):format(v77)
	v_u_25:GetReplica():OnSet({ "Upgrades" }, function(p80)
		-- upvalues: (ref) v_u_16, (ref) v_u_17
		local v81 = p80.MovementSpeed
		local v82 = v_u_16
		local v83 = v81 / 2
		v82.Text = ("%*"):format((math.round(v83)))
		v_u_17.Text = ("%*"):format(v81)
	end)
end
return v31

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.TooltipController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
game:GetService("StarterPlayer")
local v_u_3 = game:GetService("UserInputService")
require(v1.Shared.PlatformUtils)
local v4 = require(v1.Packages.Knit)
local v_u_5 = require(script.TooltipConfig)
local v6 = v2.LocalPlayer
local v_u_7 = v6:GetMouse()
local v_u_8 = v6.PlayerGui:WaitForChild("Effects")
local v9 = v4.CreateController({
	["Name"] = "TooltipController"
})
local v_u_10 = nil
local v_u_11 = nil
local v_u_12 = {}
local v_u_13 = {}
local v_u_14 = {}
local v_u_15 = nil
function v9.SetupTooltip(p_u_16, p17, p_u_18)
	p17.MouseEnter:Connect(function()
		-- upvalues: (copy) p_u_16, (copy) p_u_18
		p_u_16:Show(p_u_18)
	end)
	p17.MouseLeave:Connect(function()
		-- upvalues: (copy) p_u_16
		p_u_16:Hide()
	end)
end
function v9.Show(p19, p20)
	-- upvalues: (ref) v_u_10, (copy) v_u_8, (ref) v_u_11, (ref) v_u_12, (ref) v_u_14
	if v_u_10 then
		p19:Hide()
	end
	local v21 = _GetTemplate(p20.templateName)
	if v21 then
		local v22 = v21:Clone()
		v22.Parent = v_u_8
		v_u_10 = v22
		v_u_11 = p20.templateName
		v_u_12 = p20.data
		v_u_14 = p20.customUpdaters or {}
		_ApplyMinimumDimensions(v22)
		_BindElements(v22)
		_InjectData(p20.data)
		_PositionTooltip(p20.position)
		_StartMouseTracking()
		return v22
	end
	warn("[TooltipController] Template not found:", p20.templateName)
end
function v9.Hide(_)
	-- upvalues: (ref) v_u_10, (ref) v_u_11, (ref) v_u_12, (ref) v_u_13, (ref) v_u_14
	if v_u_10 then
		local v23 = v_u_10
		_StopMouseTracking()
		v23:Destroy()
		v_u_10 = nil
		v_u_11 = nil
		v_u_12 = {}
		v_u_13 = {}
		v_u_14 = {}
	end
end
function v9.GetCurrentData(_)
	-- upvalues: (ref) v_u_12
	return v_u_12
end
function v9.IsActive(_)
	-- upvalues: (ref) v_u_10
	return v_u_10 ~= nil
end
function _GetTemplate(p24)
	local v25 = script.Templates
	if v25 then
		return v25:FindFirstChild(p24)
	end
	warn("[TooltipController] Templates folder not found / not loaded yet")
	return nil
end
function _ApplyMinimumDimensions(p26)
	local v27 = p26:GetAttribute("MinWidth")
	local v28 = p26:GetAttribute("MinHeight")
	if v27 or v28 then
		local v29 = p26.AbsoluteSize
		local v30 = v29.X
		local v31 = v29.Y
		if v27 then
			if v29.X >= v27 then
				v27 = v30
			end
		else
			v27 = v30
		end
		if v28 then
			if v29.Y >= v28 then
				v28 = v31
			end
		else
			v28 = v31
		end
		if v27 ~= v29.X or v28 ~= v29.Y then
			p26.Size = UDim2.new(0, v27, 0, v28)
		end
	end
end
function _BindElements(p32)
	-- upvalues: (ref) v_u_13, (copy) v_u_5
	v_u_13 = {}
	(function(p33)
		-- upvalues: (ref) v_u_5, (ref) v_u_13
		for _, v34 in p33:GetDescendants() do
			for _, v35 in v_u_5.BindingSuffixes do
				if v34.Name:match(v35 .. "$") then
					v_u_13[v34.Name:gsub(v35 .. "$", "")] = v34
					break
				end
			end
		end
	end)(p32)
end
function _InjectData(p36)
	-- upvalues: (ref) v_u_13, (ref) v_u_14, (ref) v_u_12, (copy) v_u_5
	for v37, v38 in p36 do
		local v39 = v_u_13[v37]
		if v39 then
			local v40 = v39:GetAttribute("Helper")
			if v_u_14[v37] then
				v_u_14[v37](v39, v_u_12)
			elseif v40 and v_u_5.UpdateHelpers[v40] then
				v_u_5.UpdateHelpers[v40](v39, v_u_12)
			else
				_DefaultUpdateElement(v39, v37, v38)
			end
		end
	end
end
function _DefaultUpdateElement(p41, _, p42)
	if p41:IsA("TextLabel") or p41:IsA("TextButton") then
		p41.Text = tostring(p42)
		local v43 = p41:HasTag("LayeredText") and p41:FindFirstChildOfClass("TextLabel")
		if v43 then
			v43.Text = p41.Text
			return
		end
	elseif p41:IsA("ImageLabel") or p41:IsA("ImageButton") then
		if type(p42) == "number" then
			p41.Image = "rbxassetid://" .. p42
			return
		end
		p41.Image = tostring(p42)
	end
end
function _PositionTooltip(p44)
	-- upvalues: (ref) v_u_10
	local v45 = v_u_10
	if p44 then
		v45.Position = UDim2.new(0, p44.X, 0, p44.Y)
	else
		_UpdateMousePosition()
	end
end
function _StartMouseTracking()
	-- upvalues: (ref) v_u_15, (copy) v_u_7, (ref) v_u_10
	if v_u_15 then
		v_u_15:Disconnect()
	end
	v_u_15 = v_u_7.Move:Connect(function()
		-- upvalues: (ref) v_u_10
		if v_u_10 then
			_UpdateMousePosition()
		end
	end)
end
function _StopMouseTracking()
	-- upvalues: (ref) v_u_15
	if v_u_15 then
		v_u_15:Disconnect()
		v_u_15 = nil
	end
end
function _UpdateMousePosition()
	-- upvalues: (ref) v_u_10, (copy) v_u_5, (copy) v_u_3
	local v46 = v_u_10
	if v46 then
		v46.AnchorPoint = Vector2.new(0, 0)
		local v47 = v_u_5.MouseOffset
		local v48 = v_u_3:GetMouseLocation()
		local v49 = v48.X + v47.X
		local v50 = v48.Y + v47.Y
		local v51 = workspace.CurrentCamera.ViewportSize
		local v52 = v46.AbsoluteSize
		if v49 + v52.X > v51.X then
			v49 = v48.X - v52.X - v47.X
		end
		if v50 + v52.Y > v51.Y then
			v50 = v48.Y - v52.Y
		end
		v46.Position = UDim2.new(0, v49, 0, v50)
	end
end
return v9

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.TooltipController.TooltipConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Configs.LuckyBlockConfig)
local v_u_3 = require(v1.Entities.BrainrotEntity)
local v_u_4 = require(v1.GameShared.BrainrotUtils)
local v_u_5 = require(v1.Configs.BrainrotsConfig)
local v_u_6 = require(v1.Configs.PlayerSkinConfig)
local v_u_7 = require(v1.Shared.AbbreviationUtils)
local v33 = {
	["BindingSuffixes"] = { "Label", "Image", "Custom" },
	["MouseOffset"] = {
		["X"] = 10,
		["Y"] = 0
	},
	["UpdateHelpers"] = {
		["ValueInjector"] = function(p8, p9)
			if p8:IsA("TextLabel") or p8:IsA("TextButton") then
				local v10 = p9[p8.Name:gsub("Label$", ""):gsub("Custom$", "")] or ""
				p8.Text = string.gsub(p8.Text, "{Value}", (tostring(v10)))
			end
		end
	},
	["BUILDERS"] = {
		["PlayerSkin"] = function(p11)
			-- upvalues: (copy) v_u_6
			local v12 = v_u_6[p11.type]
			if v12 then
				if v12.specialMulti then
					local v13 = {
						["templateName"] = "SpecialLuckyBlock",
						["data"] = {
							["LuckyBlockName"] = v12.name,
							["Percentage"] = v12.specialMulti * 100,
							["Luck"] = v12.luck
						}
					}
					return v13
				else
					warn("No tooltip configured for regular player skin")
					return nil
				end
			else
				warn("not player skin info")
				return nil
			end
		end,
		["Brainrot"] = function(p14)
			-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_7
			local v15 = v_u_5[p14.type]
			if not v15 then
				warn("no brainrot info")
				return nil
			end
			local v16 = v_u_3.new(p14.type, p14.mutation)
			local v17 = v_u_4.GetCashPerSecondBase(v16)
			local v18 = {
				["templateName"] = "Brainrot",
				["data"] = {
					["BrainrotName"] = v15.name,
					["CashPerSecond"] = v_u_7:AbbreviateNumber(v17, 1)
				}
			}
			return v18
		end,
		["LuckyBlock"] = function(p19)
			-- upvalues: (copy) v_u_2, (copy) v_u_5
			local v20 = v_u_2.LUCKY_BLOCKS[p19.type]
			if v20 then
				local function v29(p21, p22)
					-- upvalues: (ref) v_u_5
					local v23 = p22.CrateRewards
					local v24 = p21:WaitForChild("Template")
					v24.Visible = false
					for v25, v26 in v23 do
						local v27 = v_u_5[v25]
						if v27 then
							local v28 = v24:Clone()
							v28.ImageLabel.Image = ("rbxassetid://%*"):format(v27.image)
							v28.RewardFullText.Text = ("%* %*%%"):format(v27.name, v26)
							v28.LayoutOrder = -v26
							v28.Visible = true
							v28.Parent = p21
						else
							warn((("No brainrot info for %*"):format(v25)))
						end
					end
				end
				local v30 = {}
				for _, v31 in v20.items do
					v30[v31.id] = v31.chance
				end
				local v32 = {
					["templateName"] = "Crate",
					["data"] = {
						["CrateName"] = v20.name,
						["CrateRewards"] = v30
					},
					["customUpdaters"] = {
						["CrateRewards"] = v29
					}
				}
				return v32
			end
			warn("no luckyblock info")
		end
	}
}
return v33

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.TooltipController.Templates.SpecialLuckyBlock.PercentageLabel.Rainbow
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("TweenService")
while true do
	for _, v2 in {
		Color3.fromRGB(221, 255, 69),
		Color3.fromRGB(255, 102, 105),
		Color3.fromRGB(111, 198, 94),
		Color3.fromRGB(255, 104, 29),
		Color3.fromRGB(255, 200, 61),
		Color3.fromRGB(85, 255, 255),
		Color3.fromRGB(255, 170, 255)
	} do
		v1:Create(script.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["TextColor3"] = v2
		}):Play()
		task.wait(1)
	end
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.NextUpdateEvent
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Knit)
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2
	local v_u_3 = game:GetService("SocialService")
	local v_u_4 = v_u_2.GetController("ReplicaController"):GetReplica()
	local v_u_5 = v_u_2.GetService("RewardService")
	local v_u_6 = workspace:WaitForChild("NextEventPage"):WaitForChild("ONE").FollowProximityPrompt
	local v_u_7 = workspace:WaitForChild("NextEventPage"):WaitForChild("Leaderboard").SurfaceGui.Frame.Verified
	local function v_u_8()
		-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_5
		v_u_6.Enabled = false
		v_u_7.Visible = true
		if workspace:WaitForChild("NextEventPage"):FindFirstChild("ModelA") then
			workspace:WaitForChild("NextEventPage"):FindFirstChild("ModelA"):Destroy()
		end
		if not v_u_5:NextEvent() then
		end
	end
	task.spawn(function()
		-- upvalues: (copy) v_u_4, (copy) v_u_8
		task.wait(14.5)
		if v_u_4.Data.Verify["826422598903661200"] then
			v_u_8()
		end
	end)
	local v9, v10 = pcall(function()
		-- upvalues: (copy) v_u_3
		return v_u_3:GetEventRsvpStatusAsync("826422598903661200")
	end)
	if v9 then
		print("CurrentRsvpStatus:", v10)
		if v10 == Enum.RsvpStatus.Going then
			v_u_8()
		end
		v_u_6.Triggered:Connect(function(_)
			-- upvalues: (copy) v_u_3, (copy) v_u_8
			if v_u_3:PromptRsvpToEventAsync("826422598903661200") == Enum.RsvpStatus.Going then
				v_u_8()
			end
		end)
	else
		warn("Failed to get RSVP status:", v10)
	end
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.RankController.RankController
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TextChatService")
local v4 = require(v2.Packages.Knit)
local v_u_5 = require(v2.Shared.Chalk)
local v_u_6 = require(v2.Shared.TableUtils)
local v_u_7 = require(script.Parent.Config)
local v8 = v4.CreateController({
	["Name"] = "RanksController"
})
local function v_u_19(p9)
	-- upvalues: (copy) v_u_1, (copy) v_u_7, (copy) v_u_6, (copy) v_u_5
	if not p9.TextSource then
		return nil
	end
	local v10 = v_u_1:GetPlayerByUserId(p9.TextSource.UserId)
	if v10 then
		local v11 = {}
		if v10:GetAttribute("IsVIP") then
			local v12 = v_u_7.Tags.VIP
			table.insert(v11, v12)
		end
		local v13 = v_u_6.GetLength(v11) == 0 and { v_u_7.Tags[v_u_7.DEFAULT_TAG] } or v11
		if v_u_6.GetLength(v13) <= 0 then
			return nil
		end
		local v14 = {}
		for _, v15 in ipairs(v13) do
			local v16 = v_u_5.bold.color(v15.Color)(v15.Text)
			table.insert(v14, v16)
		end
		local v17 = table.concat(v14, " ")
		local v18 = Instance.new("TextChatMessageProperties")
		v18.PrefixText = ("%* %*"):format(v17, p9.PrefixText)
		return v18
	end
end
function v8.KnitStart(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_19
	v_u_3.OnIncomingMessage = v_u_19
end
return v8

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerScripts.Controllers.RankController.Config
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {}
local v2 = {
	["VIP"] = {
		["Text"] = "[VIP]",
		["Color"] = Color3.fromRGB(255, 207, 33)
	}
}
v1.Tags = v2
v1.DEFAULT_TAG = nil
return v1

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.BackpackGui.Backpack.Inventory.BackpackButtonsContainer.EquipBestBrainrot.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Knit)
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2
	local v_u_3 = v_u_2.GetController("BackpackController")
	require(v_u_2.UIComponents.Button):WaitForInstance(script.Parent):andThen(function(p4)
		-- upvalues: (copy) v_u_3
		p4:AddCallback(function()
			-- upvalues: (ref) v_u_3
			v_u_3:PlaceBestBrainrots()
		end)
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD_TEST.LiveEventIn2.LiveEventTimer
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_2 = require(game.ReplicatedStorage.Shared.AbbreviationUtils)
v1.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2
	task.wait(2)
	local v3 = os.time({
		["year"] = 2026,
		["month"] = 1,
		["day"] = 10,
		["hour"] = 16,
		["min"] = 0,
		["sec"] = 0
	})
	local v4 = v3 - os.time()
	if v4 > 0 then
		if v4 > 21600 then
			while v4 > 21600 do
				task.wait(1)
				v4 = v4 - 1
			end
		end
		script.Parent.Visible = true
		repeat
			local v5 = os.time()
			script.Parent.Text = v_u_2:DHMSTimeAbbreviate(v3 - v5)
			task.wait(1)
		until v3 - v5 <= 0
		script.Parent.Visible = false
	end
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD_TEST.LiveEventIn.LiveEventTimer
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_2 = require(game.ReplicatedStorage.Shared.AbbreviationUtils)
v1.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2
	task.wait(2)
	local v3 = os.time({
		["year"] = 2026,
		["month"] = 1,
		["day"] = 3,
		["hour"] = 16,
		["min"] = 0,
		["sec"] = 0
	})
	local v4 = v3 - os.time()
	if v4 > 0 then
		if v4 > 21600 then
			while v4 > 21600 do
				task.wait(1)
				v4 = v4 - 1
			end
		end
		script.Parent.Visible = true
		repeat
			local v5 = os.time()
			script.Parent.Text = v_u_2:DHMSTimeAbbreviate(v3 - v5)
			task.wait(1)
		until v3 - v5 <= 0
		script.Parent.Visible = false
	end
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD_TEST.AutoReconnect.AutoReconnectScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("TeleportService")
local v3 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_4 = require(game.ReplicatedStorage.Shared.AbbreviationUtils)
v3.OnStart():andThen(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_4
	local v_u_5 = script.Parent
	local v_u_6 = os.clock()
	local v_u_7 = false
	v_u_1.InputBegan:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_7, (copy) v_u_5
		v_u_6 = os.clock()
		v_u_7 = false
		v_u_5.Visible = false
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_7, (copy) v_u_5, (ref) v_u_2, (ref) v_u_4
		while true do
			while true do
				task.wait(1)
				local v8 = os.clock() - v_u_6
				if v8 < 20 then
					break
				end
				if not v_u_7 then
					v_u_7 = true
					v_u_5.Visible = true
				end
				local v9 = 900 - v8
				if v9 <= 0 then
					v_u_2:Teleport(game.PlaceId)
					return
				end
				v_u_5.Text = "Auto Reconnect: " .. v_u_4:AbbreviateTime((math.max(v9, 0)))
			end
			v_u_5.Visible = false
		end
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD_TEST.TextButton.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Knit)
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2
	local v_u_3 = v_u_2.GetService("PickupService")
	script.Parent.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_3
		v_u_3:DropLast()
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.Buffs.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

if game:GetService("UserInputService").TouchEnabled then
	script.Parent.Position = UDim2.new(0.75, 0, 0.99, 0)
	script.Parent.Size = UDim2.new(0.42, 0, 0.15, 0)
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.Buffs.Premium.PremiumBoostHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("MarketplaceService")
local v_u_2 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_3 = script.Parent:WaitForChild("TextLabel")
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_1
	local v4, v5 = require(v_u_2.UIComponents.Button):WaitForInstance(script.Parent):await()
	if game.Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
		v_u_3.Text = "+10%"
	else
		v_u_3.Text = "+0%"
	end
	game.Players.LocalPlayer:GetPropertyChangedSignal("MembershipType"):Connect(function()
		-- upvalues: (ref) v_u_3
		if game.Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
			v_u_3.Text = "+10%"
		else
			v_u_3.Text = "+0%"
		end
	end)
	if v4 then
		v5:AddCallback(function()
			-- upvalues: (ref) v_u_1
			v_u_1:PromptPremiumPurchase(game.Players.LocalPlayer)
		end)
	end
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.Buffs.Friends.FriendBoostHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("SocialService")
local v_u_2 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_3 = script.Parent
local v_u_4 = script.Parent:WaitForChild("TextLabel")
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_1
	local v5, v6 = require(v_u_2.UIComponents.Button):WaitForInstance(v_u_3):await()
	v_u_4.Text = ("+%*%%"):format((game.Players.LocalPlayer:GetAttribute("FriendsOnline") or 0) * 10)
	game.Players.LocalPlayer:GetAttributeChangedSignal("FriendsOnline"):Connect(function()
		-- upvalues: (ref) v_u_4
		v_u_4.Text = ("+%*%%"):format((game.Players.LocalPlayer:GetAttribute("FriendsOnline") or 0) * 10)
	end)
	local v7 = false
	for _ = 1, 5 do
		local v8, v9 = pcall(function()
			-- upvalues: (ref) v_u_1
			return v_u_1:CanSendGameInviteAsync(game.Players.LocalPlayer)
		end)
		if v8 then
			v7 = v9
			break
		end
	end
	if v5 and v7 then
		v6:AddCallback(function()
			-- upvalues: (ref) v_u_1
			v_u_1:PromptGameInvite(game.Players.LocalPlayer)
		end)
	end
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.LeftContainer.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

if game:GetService("UserInputService").TouchEnabled then
	script.Parent.Position = UDim2.new(0.008, 0, 0.32, 0)
	script.Parent.UIListLayout.Padding = UDim.new(-0.1, 0)
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.LeftContainer.Currency.Speed.SpeedVisualHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Configs.GearsConfig)
local v_u_4 = require(v1.Packages.Knit)
local v_u_5 = require(v1.Shared.CharacterUtil)
local v_u_6 = v2.LocalPlayer
local v_u_7 = script.Parent:WaitForChild("Speed"):WaitForChild("SpeedLabel")
v_u_4.OnStart():andThen(function()
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_3, (copy) v_u_7
	local v_u_8 = v_u_4.GetController("ReplicaController")
	local v9 = v_u_4.GetController("EquipController")
	local v10 = v_u_8:GetReplica()
	local function v_u_14()
		-- upvalues: (copy) v_u_8, (ref) v_u_5, (ref) v_u_6, (ref) v_u_3, (ref) v_u_7
		local v11 = (v_u_8:GetPlayerData().Upgrades or {}).MovementSpeed or 0
		local v12 = v_u_5.GetEquippedTool(v_u_6)
		if v12 and v12:GetAttribute("GearType") == "SpeedCoil" then
			local v13 = v12:GetAttribute("GearId")
			v11 = v11 * v_u_3.GEARS[v13].stats.speedBoost
		end
		v_u_7.Text = ("Speed: %*"):format((math.round(v11)))
		v_u_7:WaitForChild("Speed").Text = v_u_7.Text
	end
	v_u_14()
	v10:OnSet({ "Upgrades" }, v_u_14)
	v9.ToolAdded:Connect(v_u_14)
	v9.ToolRemoved:Connect(v_u_14)
	v_u_6.CharacterAdded:Connect(function()
		-- upvalues: (copy) v_u_14
		task.defer(v_u_14)
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.LeftContainer.SlowMode.SlowModeUI
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("Players")
local v_u_4 = require(v2.Shared.CharacterUtil)
local v_u_5 = require(v2.Modifiers)
local v_u_6 = require(v2.Packages.Knit)
local v_u_7 = script.Parent
local v_u_8 = v_u_7:WaitForChild("Title")
local v_u_9 = v_u_7:WaitForChild("Icon")
local v_u_10 = v_u_9:WaitForChild("Frame"):WaitForChild("Plus")
local v_u_11 = false
local v_u_12 = v3.LocalPlayer
local v_u_13 = game:GetService("UserInputService")
local v_u_14 = v_u_13.TouchEnabled and "" or "[<font color=\"#59cdff\">Q</font>] "
local v_u_15 = true
function ToggleBtn(p16)
	-- upvalues: (ref) v_u_15, (copy) v_u_1, (copy) v_u_10, (copy) v_u_9, (copy) v_u_8, (ref) v_u_14, (ref) v_u_11
	if v_u_15 then
		v_u_15 = false
		if p16 == "ON" then
			v_u_1:Create(v_u_10, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				["Position"] = UDim2.fromScale(1, 0.494)
			}):Play()
			v_u_1:Create(v_u_9, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				["ImageColor3"] = Color3.fromRGB(100, 194, 109)
			}):Play()
			v_u_8.Text = "Slow Mode " .. v_u_14 .. "- <font color=\"#9bffa2\">ON</font>"
			v_u_11 = true
		else
			v_u_1:Create(v_u_10, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				["Position"] = UDim2.fromScale(0, 0.494)
			}):Play()
			v_u_1:Create(v_u_9, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				["ImageColor3"] = Color3.fromRGB(56, 56, 56)
			}):Play()
			v_u_8.Text = "Slow Mode " .. v_u_14 .. "- <font color=\"#fff7a0\">OFF</font>"
			v_u_11 = false
		end
		task.wait(0.2)
		v_u_15 = true
	end
end
v_u_6.OnStart():andThen(function()
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_12, (copy) v_u_4, (copy) v_u_13, (copy) v_u_7, (ref) v_u_11, (copy) v_u_9
	local v17 = require(v_u_6.UIComponents.Button)
	local v_u_18 = v_u_6.GetController("ReplicaController"):GetReplica()
	v_u_13.InputBegan:Connect(function(p19, p20)
		-- upvalues: (ref) v_u_7, (ref) v_u_11, (ref) v_u_5, (ref) v_u_12, (ref) v_u_4
		if not p20 then
			if p19.KeyCode == Enum.KeyCode.Q and v_u_7.Visible then
				if v_u_11 then
					local v21 = v_u_5.Get(v_u_12, "MovementSpeed")
					v_u_4.SetPlayerSpeed(v_u_12, v21)
					ToggleBtn("OFF")
					v_u_12:SetAttribute("SlowMovementSpeed", false)
					return
				end
				local v22 = v_u_5.Get(v_u_12, "SlowMovementSpeed")
				v_u_4.SetPlayerSpeed(v_u_12, v22)
				ToggleBtn("ON")
				v_u_12:SetAttribute("SlowMovementSpeed", true)
			end
		end
	end)
	v17:WaitForInstance(v_u_9):andThen(function(p23)
		-- upvalues: (ref) v_u_11, (ref) v_u_5, (ref) v_u_12, (ref) v_u_4
		p23:AddCallback(function()
			-- upvalues: (ref) v_u_11, (ref) v_u_5, (ref) v_u_12, (ref) v_u_4
			if v_u_11 then
				local v24 = v_u_5.Get(v_u_12, "MovementSpeed")
				v_u_4.SetPlayerSpeed(v_u_12, v24)
				ToggleBtn("OFF")
				v_u_12:SetAttribute("SlowMovementSpeed", false)
			else
				local v25 = v_u_5.Get(v_u_12, "SlowMovementSpeed")
				v_u_4.SetPlayerSpeed(v_u_12, v25)
				ToggleBtn("ON")
				v_u_12:SetAttribute("SlowMovementSpeed", true)
			end
		end)
	end)
	local v26 = v_u_5.Get(v_u_12, "SlowMovementSpeed")
	v_u_4.SetPlayerSpeed(v_u_12, v26)
	ToggleBtn("ON")
	v_u_12:SetAttribute("SlowMovementSpeed", true)
	v_u_12:GetAttributeChangedSignal("InSpawn"):Connect(function()
		-- upvalues: (ref) v_u_12, (ref) v_u_5, (ref) v_u_4
		if v_u_12:GetAttribute("InSpawn") then
			local v27 = v_u_5.Get(v_u_12, "SlowMovementSpeed")
			v_u_4.SetPlayerSpeed(v_u_12, v27)
			ToggleBtn("ON")
			v_u_12:SetAttribute("SlowMovementSpeed", true)
		else
			local v28 = v_u_5.Get(v_u_12, "MovementSpeed")
			v_u_4.SetPlayerSpeed(v_u_12, v28)
			ToggleBtn("OFF")
			v_u_12:SetAttribute("SlowMovementSpeed", false)
		end
	end)
	if ((v_u_18.Data.Upgrades or {}).MovementSpeed or 0) > 40 then
		v_u_7.Visible = true
	else
		v_u_7.Visible = false
	end
	v_u_18:OnSet({ "Upgrades" }, function()
		-- upvalues: (copy) v_u_18, (ref) v_u_7
		if ((v_u_18.Data.Upgrades or {}).MovementSpeed or 0) > 40 then
			v_u_7.Visible = true
		else
			v_u_7.Visible = false
		end
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.LeftButtons.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

if game:GetService("UserInputService").TouchEnabled then
	script.Parent.Position = UDim2.new(0.982, 0, 0.56, 0)
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.LeftButtons.Shop.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Knit)
local v_u_3 = require(v1.Configs.FreeShopConfig)
local v_u_4 = script.Parent:WaitForChild("Alert")
local v_u_5 = script.Parent
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local v_u_6 = v_u_2.GetController("SoundController")
	local v7 = v_u_2.GetController("ReplicaController")
	local v_u_8 = v7:GetPlayerData().LastFreeShopClaim < v_u_3.CURRENT_CLAIM_INDEX
	if v_u_8 then
		v_u_4.Visible = true
	else
		v_u_4.Visible = false
	end
	v7:GetReplica():OnSet({ "LastFreeShopClaim" }, function(p9)
		-- upvalues: (ref) v_u_8, (ref) v_u_3, (ref) v_u_4
		v_u_8 = p9 < v_u_3.CURRENT_CLAIM_INDEX
		if v_u_8 then
			v_u_4.Visible = true
		else
			v_u_4.Visible = false
		end
	end)
	v_u_5.Activated:Connect(function()
		-- upvalues: (copy) v_u_6
		v_u_6:PlaySound("OpenShop", {
			["PlaybackSpeed"] = 1 + math.random(0, 5) / 10
		})
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.LeftButtons.Shop.UIGradient.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("TweenService")
while true do
	v1:Create(script.Parent, TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		["Rotation"] = 360
	}):Play()
	task.wait(20)
	script.Parent.Rotation = 0
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.RightBuffs.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

if game:GetService("UserInputService").TouchEnabled then
	script.Parent.Position = UDim2.new(0.9, 0, 0.6598, 0)
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.RightBuffs.NextEvent.NextWeatherHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Knit)
local v_u_3 = require(v1.Shared.AbbreviationUtils)
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	v_u_2.GetController("ReplicaController"):GetReplica()
	require(v_u_2.UIComponents.Button)
	local v4 = game.ReplicatedStorage:WaitForChild("NextWeatherTime")
	local v_u_5 = game.ReplicatedStorage:WaitForChild("ActiveWeathers")
	if v4.Value > 0 and #v_u_5:GetChildren() == 0 then
		script.Parent.Visible = true
		script.Parent.Timer.Text = v_u_3:AbbreviateTime(v4.Value)
	else
		script.Parent.Visible = false
	end
	v4.Changed:Connect(function(p6)
		-- upvalues: (copy) v_u_5, (ref) v_u_3
		if p6 > 0 and #v_u_5:GetChildren() == 0 then
			script.Parent.Visible = true
			script.Parent.Timer.Text = v_u_3:AbbreviateTime(p6)
		else
			script.Parent.Visible = false
		end
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.RightBuffs.EVENT_TEMPLATE.TimerHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_2 = require(game.ReplicatedStorage.Shared.AbbreviationUtils)
v1.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2
	local function v4()
		-- upvalues: (ref) v_u_2
		local v3 = game.ReplicatedStorage:GetAttribute("SpecialSpawnTimer") or 0
		script.Parent.Timer.Text = v_u_2:DHMSTimeAbbreviate(v3)
	end
	game.ReplicatedStorage:GetAttributeChangedSignal("SpecialSpawnTimer"):Connect(v4)
	local v5 = game.ReplicatedStorage:GetAttribute("SpecialSpawnTimer") or 0
	script.Parent.Timer.Text = v_u_2:DHMSTimeAbbreviate(v5)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.AutoReconnect.AutoReconnectScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("TeleportService")
local v3 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_4 = require(game.ReplicatedStorage.Shared.AbbreviationUtils)
v3.OnStart():andThen(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_4
	local v_u_5 = script.Parent
	local v_u_6 = os.clock()
	local v_u_7 = false
	v_u_1.InputBegan:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_7, (copy) v_u_5
		v_u_6 = os.clock()
		v_u_7 = false
		v_u_5.Visible = false
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_7, (copy) v_u_5, (ref) v_u_2, (ref) v_u_4
		while true do
			while true do
				task.wait(1)
				local v8 = os.clock() - v_u_6
				if v8 < 20 then
					break
				end
				if not v_u_7 then
					v_u_7 = true
					v_u_5.Visible = true
				end
				local v9 = 900 - v8
				if v9 <= 0 then
					v_u_2:Teleport(game.PlaceId)
					return
				end
				v_u_5.Text = "Auto Reconnect: " .. v_u_4:AbbreviateTime((math.max(v9, 0)))
			end
			v_u_5.Visible = false
		end
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.STARTER_PACK.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

if game:GetService("UserInputService").TouchEnabled then
	script.Parent.Position = UDim2.new(0.782, 0, 0.15, 0)
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.STARTER_PACK.StarterPackHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Knit)
local v_u_3 = require(v1.Configs.MonetizationConfig)
local v_u_4 = script.Parent
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	local v_u_5 = v_u_2.GetController("ReplicaController")
	local v6 = v_u_5:GetReplica()
	local v7 = v_u_3.STARTER_PACK.id
	local v_u_8 = tostring(v7)
	local v_u_9 = v_u_2.PlayerGui:WaitForChild("Windows"):WaitForChild("Shop"):WaitForChild("Holder"):WaitForChild("Scrolling"):WaitForChild("Featured"):WaitForChild("Packs"):WaitForChild("StarterPack"):WaitForChild("Content"):WaitForChild("Buttons")
	local function v11()
		-- upvalues: (copy) v_u_5, (copy) v_u_8, (ref) v_u_4, (copy) v_u_9
		local v10 = v_u_5:GetPlayerData()
		if v10.PurchaseCounts[v_u_8] and v10.PurchaseCounts[v_u_8] > 0 then
			v_u_4.Visible = false
			v_u_9:WaitForChild("STARTER_PACK").Visible = false
			v_u_9:WaitForChild("Owned").Visible = true
		else
			v_u_4.Visible = true
			v_u_9:WaitForChild("STARTER_PACK").Visible = true
			v_u_9:WaitForChild("Owned").Visible = false
		end
	end
	v11()
	v6:OnSet({ "PurchaseCounts", v_u_8 }, v11)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.ULTRA_PACK.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

if game:GetService("UserInputService").TouchEnabled then
	script.Parent.Position = UDim2.new(0.782, 0, 0.15, 0)
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.ULTRA_PACK.UltraPackHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Knit)
local v_u_3 = require(v1.Configs.MonetizationConfig)
local v_u_4 = script.Parent
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	local v_u_5 = v_u_2.GetController("ReplicaController")
	local v6 = v_u_5:GetReplica()
	local v7 = v_u_3.STARTER_PACK.id
	local v_u_8 = tostring(v7)
	local v9 = v_u_3.ULTRA_PACK.id
	local v_u_10 = tostring(v9)
	local v_u_11 = v_u_2.PlayerGui:WaitForChild("Windows"):WaitForChild("Shop"):WaitForChild("Holder"):WaitForChild("Scrolling"):WaitForChild("Featured"):WaitForChild("Packs"):WaitForChild("UltraPack"):WaitForChild("Content"):WaitForChild("Buttons")
	local function v13()
		-- upvalues: (copy) v_u_5, (copy) v_u_10, (copy) v_u_11, (copy) v_u_8, (ref) v_u_4
		local v12 = v_u_5:GetPlayerData()
		if v12.PurchaseCounts[v_u_10] and v12.PurchaseCounts[v_u_10] > 0 then
			v_u_11:WaitForChild("ULTRA_PACK").Visible = false
			v_u_11:WaitForChild("Owned").Visible = true
		else
			v_u_11:WaitForChild("ULTRA_PACK").Visible = true
			v_u_11:WaitForChild("Owned").Visible = false
		end
		if v12.PurchaseCounts[v_u_8] then
			if v12.PurchaseCounts[v_u_10] and v12.PurchaseCounts[v_u_10] > 0 then
				v_u_4.Visible = false
			else
				v_u_4.Visible = true
			end
		else
			v_u_4.Visible = false
			return
		end
	end
	v13()
	v6:OnSet({ "PurchaseCounts", v_u_8 }, v13)
	v6:OnSet({ "PurchaseCounts", v_u_10 }, v13)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.TeleportsContainer.HideTop
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("Players")
local v_u_2 = require(game.ReplicatedStorage.Packages.Knit)
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v_u_3 = v_u_2.GetController("WindowController")
	v_u_1.LocalPlayer:GetAttributeChangedSignal("InSpawn"):Connect(function()
		-- upvalues: (ref) v_u_1, (copy) v_u_3
		if v_u_1.LocalPlayer:GetAttribute("InSpawn") then
			v_u_3:ShowTop()
		else
			v_u_3:HideTop()
		end
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.TeleportsContainer.Base.TeleportBaseHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = require(game.ReplicatedStorage.Packages.Knit)
v_u_1.OnStart():andThen(function()
	-- upvalues: (copy) v_u_1
	local v_u_2 = v_u_1.GetService("PlotService")
	require(v_u_1.UIComponents.Button):WaitForInstance(script.Parent):andThen(function(p3)
		-- upvalues: (copy) v_u_2
		p3:AddCallback(function()
			-- upvalues: (ref) v_u_2
			print("trelrpoted")
			v_u_2:TeleportToPlot()
		end)
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.TeleportsContainer.Shops.TeleportToShopsHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = require(game.ReplicatedStorage.Packages.Knit)
v_u_1.OnStart():andThen(function()
	-- upvalues: (copy) v_u_1
	local v_u_2 = v_u_1.GetService("WarpService")
	require(v_u_1.UIComponents.Button):WaitForInstance(script.Parent):andThen(function(p3)
		-- upvalues: (copy) v_u_2
		p3:AddCallback(function()
			-- upvalues: (ref) v_u_2
			v_u_2:WarpToLocation("Shop")
		end)
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.TIMERCLOCK.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("RunService")
local v_u_2 = script.Parent.Frame.f1
local v_u_3 = script.Parent.Frame.f2
local v_u_4 = script.Parent.Frame.b1
local v_u_5 = script.Parent.Frame.b2
local v_u_6 = 10
local v_u_7 = 0
local v_u_8 = true
v_u_2.Rotation = 0
v_u_3.Rotation = 0
v_u_4.Rotation = 0
v_u_5.Rotation = 0
v_u_2.ZIndex = 7
v_u_3.ZIndex = 5
v_u_4.ZIndex = 2
v_u_5.ZIndex = 4
local function v12(p9)
	-- upvalues: (ref) v_u_7, (ref) v_u_6, (ref) v_u_8, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	v_u_7 = v_u_7 + p9
	local v10 = v_u_7 / v_u_6
	local v11 = math.clamp(v10, 0, 1)
	if v_u_8 and v11 > 0.5 then
		v_u_8 = false
		v_u_2.ZIndex = 1
		v_u_3.ZIndex = 3
	end
	if not v_u_8 and v11 < 0.5 then
		v_u_8 = true
		v_u_2.ZIndex = 7
		v_u_3.ZIndex = 5
	end
	v_u_3.Rotation = v11 * 360
	if v_u_6 <= v_u_7 then
		v_u_2.Rotation = 0
		v_u_3.Rotation = 0
		v_u_4.Rotation = 0
		v_u_5.Rotation = 0
		v_u_2.ZIndex = 7
		v_u_3.ZIndex = 5
		v_u_4.ZIndex = 2
		v_u_5.ZIndex = 4
		v_u_7 = 0
		v_u_6 = 10
	end
end
v1.Heartbeat:Connect(v12)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.TopBar.MinimapHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("RunService")
local v3 = workspace.RunningModels
workspace:WaitForChild("TrackStart")
workspace:WaitForChild("TrackEnd")
local v_u_4 = {
	workspace.MapPoints["1"],
	workspace.MapPoints["2"],
	workspace.MapPoints["3"],
	workspace.MapPoints["4"],
	workspace.MapPoints["5"],
	workspace.MapPoints["6"],
	workspace.MapPoints["7"],
	workspace.MapPoints["8"],
	workspace.MapPoints["9"],
	workspace.MapPoints["10"],
	workspace.MapPoints["11"],
	workspace.MapPoints["12"],
	workspace.MapPoints["13"],
	workspace.MapPoints["14"]
}
local v5 = {}
local v6 = 0
local v7 = { 0 }
local v_u_8 = {}
for v9 = 1, #v_u_4 - 1 do
	local v10 = v_u_4[v9].Position
	local v11 = (v_u_4[v9 + 1].Position - v10).Magnitude
	v5[v9] = v11
	v6 = v6 + v11
	v7[v9 + 1] = v6
end
local v_u_12 = #v_u_4 - 1
local v_u_13 = (1 - v_u_12 * 0.0769) * 0.5
local function v_u_27(p14)
	-- upvalues: (copy) v_u_12, (copy) v_u_4, (copy) v_u_13
	local v15 = (1 / 0)
	local v16 = 1
	local v17 = 0
	for v18 = 1, v_u_12 do
		local v19 = v_u_4[v18].Position
		local v20 = v_u_4[v18 + 1].Position - v19
		local v21 = v20:Dot(v20)
		local v22
		if v21 <= 1e-9 then
			v22 = 0
		else
			local v23 = (p14 - v19):Dot(v20) / v21
			v22 = v23 < 0 and 0 or (v23 > 1 and 1 or v23)
			v19 = v19 + v20 * v22
		end
		local v24 = p14 - v19
		local v25 = v24:Dot(v24)
		if v25 < v15 then
			v17 = v22
			v16 = v18
			v15 = v25
		end
	end
	local v26 = v_u_13 + (v16 - 1 + v17) * 0.0769
	return v26 < 0 and 0 or (v26 > 1 and 1 or v26)
end
v2.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_8, (copy) v_u_27, (copy) v_u_13, (copy) v_u_12
	if script.Parent.Visible then
		for v28, v29 in pairs(v_u_8) do
			if v28 and (v28.PrimaryPart and (v28.Parent and v29.Parent)) then
				local v30 = v28.PrimaryPart
				if v30 then
					local v31 = v_u_27(v30.Position)
					v29.Position = UDim2.fromScale(v31, 2)
					if not v29:FindFirstChild("LuckLevel") then
						return
					end
					local v32 = (v31 - v_u_13) / 0.0769
					local v33 = v_u_12
					local v34 = (math.clamp(v32, 0, v33) / v_u_12 * 12 + 1) * 10 + 0.5
					local v35 = math.floor(v34) / 10
					local v36 = math.clamp(v35, 1, 13)
					v29:FindFirstChild("LuckLevel"):FindFirstChild("Title").Text = "x" .. string.format("%.1f", v36)
				end
			else
				v_u_8[v28] = nil
			end
		end
	end
end)
function add(p37)
	-- upvalues: (copy) v_u_1, (copy) v_u_8
	local v38 = p37.Name
	local v39 = tonumber(v38)
	if v39 ~= game.Players.LocalPlayer.UserId or p37:GetAttribute("IsClientCreated") then
		local v40
		if v39 == game.Players.LocalPlayer.UserId then
			v40 = script.Parent:WaitForChild("PlayerBar"):FindFirstChild("YourPlayer") or script.YourPlayer:Clone()
		else
			v40 = script.NormalPlayer:Clone()
		end
		v40.Tamp.PlayerImage.Image = v_u_1:GetUserThumbnailAsync(v39, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180)
		v40.Parent = script.Parent.PlayerBar
		v40.Visible = true
		v_u_8[p37] = v40
	end
end
for _, v41 in v3:GetChildren() do
	add(v41)
end
v3.ChildAdded:Connect(function(p42)
	add(p42)
end)
v3.ChildRemoved:Connect(function(p43)
	-- upvalues: (copy) v_u_8
	if v_u_8[p43] and v_u_8[p43].Name == "YourPlayer" then
		v_u_8[p43] = nil
	end
	if v_u_8[p43] then
		v_u_8[p43]:Destroy()
		v_u_8[p43] = nil
	end
end)
v_u_1.LocalPlayer:GetAttributeChangedSignal("InSpawn"):Connect(function()
	-- upvalues: (copy) v_u_1
	if v_u_1.LocalPlayer:GetAttribute("InSpawn") then
		script.Parent.Visible = false
	else
		script.Parent.Visible = true
	end
end)
v_u_1.LocalPlayer:GetAttributeChangedSignal("Chased"):Connect(function()
	-- upvalues: (copy) v_u_1
	if v_u_1.LocalPlayer:GetAttribute("Chased") then
		script.Parent.Visible = false
	end
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.TopBar.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

if game:GetService("UserInputService").TouchEnabled then
	script.Parent.UIScale.Scale = 0.9
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.TopBar.MiniMap2.ImageLabel.UIGradient.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("TweenService")
while true do
	v1:Create(script.Parent, TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		["Rotation"] = 360
	}):Play()
	task.wait(6)
	script.Parent.Rotation = 0
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.TopBar.MiniMap2.ImageLabel.UIGradient.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = script.Parent
local v_u_2 = game:GetService("TweenService"):Create(v_u_1, TweenInfo.new(3.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
	["Offset"] = Vector2.new(1.1, 0)
})
local v_u_3 = Vector2.new(-1.1, 0)
v_u_1.Offset = v_u_3
local function v_u_4()
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_4()
end
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_4()

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.TopBar.MiniMap2.ImageLabel.UIGradient.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = script.Parent
local v_u_2 = game:GetService("TweenService"):Create(v_u_1, TweenInfo.new(3.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
	["Offset"] = Vector2.new(1.1, 0)
})
local v_u_3 = Vector2.new(-1.1, 0)
v_u_1.Offset = v_u_3
local function v_u_4()
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_4()
end
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_4()

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.TopBar.MiniMap2.ImageLabel.UIGradient.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = script.Parent
local v_u_2 = game:GetService("TweenService"):Create(v_u_1, TweenInfo.new(3.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
	["Offset"] = Vector2.new(1.5, 0)
})
local v_u_3 = Vector2.new(-1.5, 0)
v_u_1.Offset = v_u_3
local function v_u_4()
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_4()
end
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_4()

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.TopBar.MiniMap2.ImageLabel.UIGradient.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("RunService")
local v_u_2 = script.Parent
local v_u_16 = (function(p3)
	local v4 = {}
	table.insert(v4, 0)
	for v5 = 1, 10 do
		local v6 = (v5 - 0.5) / 10 * 3.141592653589793
		local v7 = ((0.5 - math.cos(v6) * 0.5) * 0.2 + 0.23329999999999998) % 1
		table.insert(v4, v7)
	end
	local v8 = p3 - 2 - 10
	local v9 = math.max(0, v8)
	for v10 = 1, v9 do
		local v11 = v10 / (v9 + 1)
		table.insert(v4, v11)
	end
	table.insert(v4, 1)
	table.sort(v4)
	local v12 = nil
	local v13 = {}
	for _, v14 in ipairs(v4) do
		if v12 then
			local v15 = v14 - v12
			if math.abs(v15) > 0.0001 then
				goto l10
			end
		else
			::l10::
			table.insert(v13, v14)
			v12 = v14
		end
	end
	return v13
end)(20)
local function v_u_42(p_u_17)
	-- upvalues: (copy) v_u_16
	local v18 = table.create(#v_u_16)
	local v19 = (0 + p_u_17) % 1
	local v20 = v19 - 0.3333
	local v21 = math.abs(v20)
	local v22 = 1 - v21
	local v23 = math.min(v21, v22)
	local v24 = -(v23 * v23) / 0.0128
	local v25 = math.exp(v24)
	local v26 = 1 - v25 * 0.45
	local v27 = 1 - v25 * 0.12
	local v28 = Color3.fromHSV(v19, v26, v27)
	v18[1] = ColorSequenceKeypoint.new(0, v28)
	local function v39(p29)
		-- upvalues: (copy) p_u_17
		local v30 = (p29 + p_u_17) % 1
		local v31 = v30 - 0.3333
		local v32 = math.abs(v31)
		local v33 = 1 - v32
		local v34 = math.min(v32, v33)
		local v35 = -(v34 * v34) / 0.0128
		local v36 = math.exp(v35)
		local v37 = 1 - v36 * 0.45
		local v38 = 1 - v36 * 0.12
		return Color3.fromHSV(v30, v37, v38)
	end
	for v40 = 2, #v_u_16 - 1 do
		local v41 = v_u_16[v40]
		v18[v40] = ColorSequenceKeypoint.new(v41, v39(v41))
	end
	v18[#v_u_16] = ColorSequenceKeypoint.new(1, v28)
	return ColorSequence.new(v18)
end
v1.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_42
	local v43 = tick()
	v_u_2.Color = v_u_42(v43 * 0.22 * -1 % 1)
	local v44 = v43 * 3.141592653589793 * 2 * 0.35
	local v45 = math.sin(v44) * 0.25
	v_u_2.Offset = Vector2.new(-v45 * -1, v45 * -1)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.RunTopFrame.RUN.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = script.Parent
local v2 = game:GetService("TweenService")
local v_u_3 = v2:Create(v1, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
	["BackgroundColor3"] = Color3.fromRGB(125, 0, 0)
})
local v_u_4 = v2:Create(v1, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
	["BackgroundColor3"] = Color3.fromRGB(24, 0, 0)
})
local v_u_5 = game:GetService("Players")
v_u_5.LocalPlayer:GetAttributeChangedSignal("InSpawn"):Connect(function()
	-- upvalues: (copy) v_u_5
	if v_u_5.LocalPlayer:GetAttribute("InSpawn") then
		script.Parent.Parent.Visible = false
	end
end)
v_u_5.LocalPlayer:GetAttributeChangedSignal("Chased"):Connect(function()
	-- upvalues: (copy) v_u_5
	if v_u_5.LocalPlayer:GetAttribute("Chased") then
		script.Parent.Parent.Visible = true
	end
end);
(function()
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	while true do
		v_u_3:Play()
		task.wait(0.5)
		v_u_4:Play()
		task.wait(0.5)
	end
end)()

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.BottomBar.SpeedFrame.ImageLabel.Numbers.Numer_Start.UIStroke.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("UserInputService")
if v1.TouchEnabled and not (v1.KeyboardEnabled or v1.MouseEnabled) then
	script.Parent.Thickness = 2
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.BottomBar.SpeedFrame.ImageLabel.Numbers.Numer_End.UIStroke.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("UserInputService")
if v1.TouchEnabled and not (v1.KeyboardEnabled or v1.MouseEnabled) then
	script.Parent.Thickness = 2
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.BottomBar.SpeedFrame.ImageLabel.Numbers.Numer_Middle.UIStroke.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("UserInputService")
if v1.TouchEnabled and not (v1.KeyboardEnabled or v1.MouseEnabled) then
	script.Parent.Thickness = 2
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.BottomBar.SlowMode.SlowModeUI
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("Players")
require(v2.Shared.CharacterUtil)
require(v2.Modifiers)
local v_u_4 = require(v2.Packages.Knit)
local v_u_5 = script.Parent
local v_u_6 = v_u_5:WaitForChild("Main"):WaitForChild("Title")
local v_u_7 = v_u_5:WaitForChild("Main"):WaitForChild("Icon")
local v_u_8 = v_u_5.Main.Icon.Frame.Plus
local v_u_9 = false
local _ = v3.LocalPlayer
local v_u_10 = game:GetService("UserInputService")
local v_u_11 = v_u_10.TouchEnabled and "" or "[<font color=\"#59cdff\">Q</font>] "
local v_u_12 = true
function ToggleBtn(p13)
	-- upvalues: (ref) v_u_12, (copy) v_u_1, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (ref) v_u_11, (ref) v_u_9
	if v_u_12 then
		v_u_12 = false
		if p13 == "ON" then
			v_u_1:Create(v_u_8, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				["Position"] = UDim2.fromScale(1, 0.494)
			}):Play()
			v_u_1:Create(v_u_7, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				["ImageColor3"] = Color3.fromRGB(100, 194, 109)
			}):Play()
			v_u_6.Text = "Auto Run " .. v_u_11 .. "- <font color=\"#9bffa2\">ON</font>"
			v_u_9 = true
		else
			v_u_1:Create(v_u_8, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				["Position"] = UDim2.fromScale(0, 0.494)
			}):Play()
			v_u_1:Create(v_u_7, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				["ImageColor3"] = Color3.fromRGB(56, 56, 56)
			}):Play()
			v_u_6.Text = "Auto Run " .. v_u_11 .. "- <font color=\"#fff7a0\">OFF</font>"
			v_u_9 = false
		end
		task.wait(0.2)
		v_u_12 = true
	end
end
v_u_4.OnStart():andThen(function()
	-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_5, (ref) v_u_9, (copy) v_u_7
	local v14 = require(v_u_4.UIComponents.Button)
	local v15 = v_u_4.GetController("ReplicaController")
	local v_u_16 = v_u_4.GetService("SettingsService")
	local v17 = v15:GetReplica()
	v_u_10.InputBegan:Connect(function(p18, p19)
		-- upvalues: (ref) v_u_5, (ref) v_u_9, (copy) v_u_16
		if not p19 then
			if p18.KeyCode == Enum.KeyCode.Q and v_u_5.Visible then
				if v_u_9 then
					v_u_16:ChangeSetting("AutoRun", false)
					return
				end
				v_u_16:ChangeSetting("AutoRun", true)
			end
		end
	end)
	v14:WaitForInstance(v_u_7):andThen(function(p20)
		-- upvalues: (ref) v_u_9, (copy) v_u_16
		p20:AddCallback(function()
			-- upvalues: (ref) v_u_9, (ref) v_u_16
			if v_u_9 then
				v_u_16:ChangeSetting("AutoRun", false)
			else
				v_u_16:ChangeSetting("AutoRun", true)
			end
		end)
	end)
	v17:OnSet({ "Settings", "AutoRun" }, function(p21)
		ToggleBtn(p21 and "ON" or "OFF")
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.HUD.LiveEventIn.LiveEventTimer
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_2 = require(game.ReplicatedStorage.Shared.AbbreviationUtils)
v1.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2
	task.wait(2)
	local v3 = os.time({
		["year"] = 2026,
		["month"] = 3,
		["day"] = 21,
		["hour"] = 16,
		["min"] = 0,
		["sec"] = 0
	})
	local v4 = v3 - os.time()
	if v4 > 0 then
		if v4 > 21600 then
			while v4 > 21600 do
				task.wait(1)
				v4 = v4 - 1
			end
		end
		script.Parent.Visible = true
		repeat
			local v5 = os.time()
			script.Parent.Text = v_u_2:DHMSTimeAbbreviate(v3 - v5)
			task.wait(1)
		until v3 - v5 <= 0
		script.Parent.Visible = false
	end
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Index.IndexHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_2 = require(game.ReplicatedStorage.Configs.BrainrotsConfig)
local v3 = require(game.ReplicatedStorage.Entities.BrainrotEntity)
local v_u_4 = require(game.ReplicatedStorage.Configs.MutationConfig)
local v5 = require(game.ReplicatedStorage.GameShared.BrainrotUtils)
local v_u_6 = require(game.ReplicatedStorage.Shared.AbbreviationUtils)
local v_u_7 = script.Parent
local v_u_8 = 0
local v_u_9 = {}
local v_u_10 = {}
local v_u_11 = "NORMAL"
for v12, _ in pairs(v_u_2) do
	v_u_8 = v_u_8 + 1
	local v13 = {
		["Name"] = v12,
		["chance"] = v5.GetCashPerSecondBase(v3.new(v12, "NORMAL"))
	}
	table.insert(v_u_9, v13)
end
table.sort(v_u_9, function(p14, p15)
	return p14.chance < p15.chance
end)
v_u_1.OnStart():andThen(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_6, (ref) v_u_8, (copy) v_u_7, (copy) v_u_9, (copy) v_u_2, (copy) v_u_10, (ref) v_u_11, (copy) v_u_4
	local v16 = v_u_1.GetController("ReplicaController")
	local v_u_17 = require(v_u_1.UIComponents.Button)
	local v_u_18 = v16:GetReplica()
	local function v_u_31(p19)
		-- upvalues: (ref) v_u_7, (ref) v_u_9, (ref) v_u_2, (ref) v_u_10, (copy) v_u_18, (ref) v_u_6, (ref) v_u_8
		local v20 = v_u_7.ShopContainer.ItemsContainer
		local v21 = 0
		local v22 = 0
		for v23, v24 in pairs(v_u_9) do
			v21 = v21 + 1
			local v25 = v24.Name
			local v26 = v_u_2[v25]
			local v27 = v_u_10[v25]
			if not v27 then
				v27 = script.Template:Clone()
				v_u_10[v25] = v27
				v27.Title.TextLabel.Text = v26.name
				v27.Visible = true
				v27.Parent = v20
				v27.ImageLabel.Image = "rbxassetid://" .. v_u_2[v25].image
				v27.LayoutOrder = v23
				local v28 = game.ReplicatedStorage.Shared.SavedDesigns.Gradients[v26.rarity or "Common"]:Clone()
				v28.Name = "Gradient"
				v28.Parent = v27.ItemImage
			end
			if v_u_18.Data.UnlockedBrainrots[v25] and v_u_18.Data.UnlockedBrainrots[v25][p19] then
				v27.ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
				v27.ImageLabel.ImageTransparency = 0
				v27.Title.TextLabel.Text = v26.name
				v22 = v22 + 1
			else
				v27.ImageLabel.ImageColor3 = Color3.new(0, 0, 0)
				v27.ImageLabel.ImageTransparency = 0.25
				v27.Title.TextLabel.Text = "???"
			end
		end
		local v29 = ("(%*/%*)"):format(v_u_6:AbbreviateNumber(v22), v_u_8)
		script.Parent.Title.Count.Text = v29
		script.Parent.Title.Count.Count.Text = v29
		local v30 = 35
		v_u_7.BottomTItles[p19].StudPattern.Bar.TextLabel.Text = v22 .. "/" .. v30
		v_u_7.BottomTItles[p19].StudPattern.Bar.TextLabel.TextLabel.Text = v_u_7.BottomTItles[p19].StudPattern.Bar.TextLabel.Text
		v_u_7.BottomTItles[p19].StudPattern.Bar.InBar.Size = UDim2.fromScale(v22 / v30, 1)
		if v30 <= v22 then
			v_u_7.BottomTItles[p19].StudPattern.Bar.TextLabel.Text = "Completed"
			v_u_7.BottomTItles[p19].StudPattern.Bar.TextLabel.TextLabel.Text = v_u_7.BottomTItles[p19].StudPattern.Bar.TextLabel.Text
			v_u_7.BottomTItles[p19].StudPattern.Bar.InBar.Size = UDim2.fromScale(1, 1)
			v_u_7.BottomTItles[p19].StudPattern.Bar.InBar.BackgroundColor3 = Color3.new(0.322255, 1, 0.228992)
		end
	end
	(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_11, (copy) v_u_31, (ref) v_u_4, (copy) v_u_17
		local function v_u_35(p32)
			-- upvalues: (ref) v_u_7, (ref) v_u_11, (ref) v_u_31
			for _, v33 in pairs(v_u_7.Buttons.Holder.Scrolling:GetChildren()) do
				if not v33:IsA("UIListLayout") then
					v33.OutLine.Visible = false
				end
			end
			for _, v34 in pairs(v_u_7.BottomTItles:GetChildren()) do
				v34.Visible = false
			end
			v_u_7.Buttons.Holder.Scrolling[p32].OutLine.Visible = true
			v_u_7.BottomTItles[p32].Visible = true
			v_u_11 = p32
			v_u_31(p32)
		end
		for _, v_u_36 in pairs(v_u_7.Buttons.Holder.Scrolling:GetChildren()) do
			if not v_u_36:IsA("UIListLayout") then
				local v37 = v_u_4[v_u_36.Name].cashMulti
				local v38 = v_u_36:WaitForChild("Tooltip"):WaitForChild("TextLabel")
				local v39 = v_u_36.UIGradient.Color.Keypoints[1].Value
				local v40 = v39.R * 255
				local v41 = math.floor(v40)
				local v42 = v39.G * 255
				local v43 = math.floor(v42)
				local v44 = v39.B * 255
				local v45 = math.floor(v44)
				v38.Text = ("<font color=\"%*\">+%*%%</font><font color=\"#2eff2a\">$</font>"):format(string.format("#%02X%02X%02X", v41, v43, v45), (v37 - 1) * 100)
				v38:WaitForChild("TextLabel").Text = v38.Text
				v_u_17:WaitForInstance(v_u_36):andThen(function(p46)
					-- upvalues: (ref) v_u_11, (copy) v_u_36, (copy) v_u_35
					p46:AddCallback(function()
						-- upvalues: (ref) v_u_11, (ref) v_u_36, (ref) v_u_35
						if v_u_11 ~= v_u_36.Name then
							v_u_35(v_u_36.Name)
						end
					end)
				end)
			end
		end
		v_u_35("NORMAL")
	end)()
	v_u_18:OnSet({ "UnlockedBrainrots" }, function(_)
		-- upvalues: (copy) v_u_31, (ref) v_u_11
		v_u_31(v_u_11)
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.SellBrainrots.SellingHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_3 = require(game.ReplicatedStorage.Shared.AbbreviationUtils)
local v_u_4 = require(game.ReplicatedStorage.Shared.TableUtils)
local v_u_5 = require(game.ReplicatedStorage.Configs.BrainrotsConfig)
require(game.ReplicatedStorage.Entities.BrainrotEntity)
local v_u_6 = require(game.ReplicatedStorage.Configs.MutationConfig)
local v_u_7 = require(game.ReplicatedStorage.Configs.TraitsConfig)
local v_u_8 = require(game.ReplicatedStorage.GameShared.BrainrotUtils)
local v_u_9 = require(game.ReplicatedStorage.GameShared.TraitUtils)
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_9, (copy) v_u_1, (copy) v_u_5, (copy) v_u_8, (copy) v_u_3, (copy) v_u_6, (copy) v_u_7
	local v_u_10 = v_u_2.GetController("ReplicaController")
	local v_u_11 = v_u_2.GetService("InventoryService")
	local v_u_12 = require(v_u_2.UIComponents.Button)
	local v_u_13 = v_u_10:GetReplica()
	local v_u_14 = {}
	local v_u_15 = nil
	local function v_u_31()
		-- upvalues: (copy) v_u_10, (ref) v_u_4, (ref) v_u_9, (ref) v_u_1
		local v16 = script.Parent
		local v17 = v16.ShopContainer.ScrollingFrame
		while v16.Visible == true do
			task.wait(1.3)
			local v18 = v_u_10:GetPlayerData()
			for _, v19 in v17:GetChildren() do
				if v19:GetAttribute("EntityId") then
					local v20 = v19:GetAttribute("EntityId")
					local v21 = v18.Inventory[v20]
					if v21.itemType == "Brainrot" then
						local v22 = v21.innerEntity
						if v22 and (v22.traits and v_u_4.GetLength(v22.traits) ~= 0) then
							local v23 = 0
							if v22.mutation ~= "NORMAL" then
								v23 = v23 + 1
							end
							if v23 + v_u_4.GetLength(v22.traits) > 1 then
								local v24
								if v22.mutation == "NORMAL" then
									v24 = nil
								else
									v24 = v22.mutation or nil
								end
								local v_u_25 = v19:WaitForChild("Main"):WaitForChild("item"):WaitForChild("MutationImag")
								local v26 = v_u_25:GetAttribute("CurrentTrait")
								local v_u_27 = v_u_9.GetNextTrait(v22.traits, v26, v24)
								local v28 = TweenInfo.new(0.5, Enum.EasingStyle.Linear)
								local v29 = v_u_1:Create(v_u_25, v28, {
									["ImageTransparency"] = 1
								})
								local v_u_30 = v_u_1:Create(v_u_25, v28, {
									["ImageTransparency"] = 0
								})
								v29.Completed:Connect(function()
									-- upvalues: (copy) v_u_25, (copy) v_u_27, (copy) v_u_30
									v_u_25.Image = ("rbxassetid://%*"):format(v_u_27.image)
									v_u_25:SetAttribute("CurrentTrait", v_u_27.id)
									v_u_30:Play()
								end)
								v29:Play()
							end
						end
					end
				end
			end
			task.wait(1.3)
		end
	end
	local function v_u_43(p32, p33, _)
		-- upvalues: (ref) v_u_5, (ref) v_u_8, (ref) v_u_3, (ref) v_u_6, (ref) v_u_4, (ref) v_u_7
		local v34 = p33.brainrotType
		local v35 = v_u_5[v34]
		if not v35 then
			warn((("Could not get config for brainrot %*"):format(v34)))
		end
		local v36 = p33.mutation
		local v37 = v_u_8.CalculateWorth(p33)
		p32:SetAttribute("EntityId", p33.id)
		p32.Main.Cash.Text = v_u_3:AbbreviateNumber(v37) .. "$"
		p32.Main.Cash.Cash.Text = p32.Main.Cash.Text
		p32.Main.Rarity.Text = v_u_6[v36].name
		p32.Main.Level.Text = "Lvl " .. p33.level
		local v38 = p32.Main.item.Title.StudPattern.TextLabel
		local v39
		if v35 then
			v39 = v35.name or v34
		else
			v39 = v34
		end
		v38.Text = v39
		if v36 == "NORMAL" and (not p33.traits or v_u_4.GetLength(p33.traits) == 0) then
			p32.Main.item.MutationImag.Visible = false
		else
			local v40 = v_u_6[v36].image
			if v36 == "NORMAL" then
				local v41 = p33.traits[1]
				local v42 = v_u_7.TRAITS[v41]
				v40 = not v42 and "" or v42.image
			end
			p32.Main.item.MutationImag.Image = "rbxassetid://" .. v40
			p32.Main.item.MutationImag.Visible = true
		end
		p32.Main.item.Title.TextLabel.Text = v_u_5[v34].name
		p32.Main.item.ImageLabel.Image = "rbxassetid://" .. v_u_5[v34].image
		return v37
	end
	local function v_u_55()
		-- upvalues: (copy) v_u_13, (ref) v_u_8, (copy) v_u_14, (copy) v_u_43, (copy) v_u_12, (copy) v_u_11, (ref) v_u_3, (ref) v_u_2
		local v44 = v_u_13.Data.Inventory
		local v45 = {}
		local v46 = 0
		for v47, v48 in pairs(v44) do
			if v48.itemType == "Brainrot" then
				local v49 = v48.innerEntity
				v45[v47] = true
				local v_u_50 = v49.id
				v46 = v46 + v_u_8.CalculateWorth(v49)
				if v_u_14[v47] then
					v_u_43(v_u_14[v47], v49, v47)
				else
					local v51 = script.Template:Clone()
					v51.Name = v47
					v_u_43(v51, v49, v47)
					v_u_12:WaitForInstance(v51.Main.Sell, 1):andThen(function(p52)
						-- upvalues: (ref) v_u_11, (copy) v_u_50
						p52:AddCallback(function()
							-- upvalues: (ref) v_u_11, (ref) v_u_50
							v_u_11:SellBrainrot(v_u_50)
						end)
					end)
					v51.Parent = script.Parent.ShopContainer.ScrollingFrame
					v_u_14[v47] = v51
				end
			end
		end
		for v53, v54 in pairs(v_u_14) do
			if not v45[v53] then
				v54:Destroy()
				v_u_14[v53] = nil
			end
		end
		script.Parent.Cash.Text = v_u_3:AbbreviateNumber(v46) .. "$"
		script.Parent.Cash.Cash.Text = script.Parent.Cash.Text
		v_u_2.PlayerGui.HUD.TeleportsContainer.Sell.Tooltip.Value.Text = script.Parent.Cash.Text
		v_u_2.PlayerGui.HUD.TeleportsContainer.Sell.Tooltip.Value.TextLabel.Text = script.Parent.Cash.Text
	end
	v_u_55()
	local v_u_56 = script.Parent
	v_u_56:GetPropertyChangedSignal("Visible"):Connect(function()
		-- upvalues: (copy) v_u_56, (ref) v_u_15, (copy) v_u_31
		if v_u_56.Visible and not v_u_15 then
			v_u_15 = task.spawn(v_u_31)
		elseif not v_u_56.Visible and v_u_15 then
			task.cancel(v_u_15)
			v_u_15 = nil
		end
	end)
	v_u_13:OnSet({ "Inventory" }, function(_)
		-- upvalues: (copy) v_u_55
		v_u_55()
	end)
	v_u_12:WaitForInstance(script.Parent.SellAll):andThen(function(p57)
		-- upvalues: (copy) v_u_11
		p57:AddCallback(function()
			-- upvalues: (ref) v_u_11
			v_u_11:SellAllBrainrots()
		end)
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PlaytimeReward.TimedRewardsHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("MarketplaceService")
local v_u_2 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_3 = require(game.ReplicatedStorage.Shared.AbbreviationUtils)
local v_u_4 = require(game.ReplicatedStorage.Configs.PlaytimeRewardConfig)
local v_u_5 = require(game.ReplicatedStorage.Configs.MonetizationConfig)
local v_u_6 = {
	["Currency"] = require(game.ReplicatedStorage.Configs.CurrencyConfig),
	["Brainrot"] = require(game.ReplicatedStorage.Configs.BrainrotsConfig),
	["LuckyBlock"] = require(game.ReplicatedStorage.Configs.LuckyBlockConfig).LUCKY_BLOCKS
}
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_6, (copy) v_u_3, (copy) v_u_1, (copy) v_u_5
	local v7 = v_u_2.GetController("ReplicaController")
	local v_u_8 = v_u_2.GetController("PlaytimeRewardController")
	v_u_2.GetService("PlaytimeRewardService")
	local v_u_9 = require(v_u_2.UIComponents.Button)
	v7:GetReplica()
	local v_u_10 = script.Parent.Rewards
	local v_u_11 = v_u_2.PlayerGui:WaitForChild("HUD"):WaitForChild("LeftButtons"):WaitForChild("Gifts")
	local function v_u_24()
		-- upvalues: (copy) v_u_8, (copy) v_u_10, (ref) v_u_4, (ref) v_u_6, (ref) v_u_3, (copy) v_u_11, (copy) v_u_9, (copy) v_u_24
		local v12 = v_u_8:GetClaimedGifts()
		local v13 = v_u_8:GetSessionTime()
		for _, v14 in pairs(v_u_10:GetChildren()) do
			if v14:IsA("ImageButton") then
				v14:Destroy()
			end
		end
		for v_u_15, v16 in ipairs(v_u_4) do
			local v_u_17 = script.Template:Clone()
			v_u_17.Title.Text = v_u_6[v16.reward][v16.name].name
			v_u_17.Icon.Image = "rbxassetid://" .. v_u_6[v16.reward][v16.name].image
			if v12[v_u_15] then
				v_u_17.Claimed.Visible = true
				v_u_17.Claim.Visible = false
				v_u_17.Timer.Visible = false
			else
				v_u_17.Claimed.Visible = false
				v_u_17.Claim.Visible = false
				v_u_17.Timer.Visible = true
				local v_u_18 = v16.time - v13
				if v_u_18 < 1 then
					v_u_17.Claimed.Visible = false
					v_u_17.Claim.Visible = true
					v_u_17.Timer.Visible = false
				else
					v_u_17.Timer.Text = v_u_3:AbbreviateTime(v_u_18)
					task.spawn(function()
						-- upvalues: (copy) v_u_17, (ref) v_u_8, (ref) v_u_11, (ref) v_u_18, (copy) v_u_15, (ref) v_u_3
						while task.wait(1) do
							if not v_u_17.Parent then
								return
							end
							local v19 = v_u_8:GetAvailableGiftsCount()
							if v19 > 0 then
								v_u_11.Frame.Title.Text = v19
								v_u_11.Frame.Visible = true
							end
							v_u_18 = v_u_18 - 1
							if v_u_18 < 1 then
								v_u_17.Claimed.Visible = false
								v_u_17.Claim.Visible = true
								v_u_17.Timer.Visible = false
								local v20, _ = v_u_8:GetNextClaimableGift()
								if v_u_15 == v20 then
									v_u_11.Title.Text = "Ready!"
									v_u_11.Title.UIGradient_On.Enabled = true
									v_u_11.Frame.Visible = true
									return
								end
								break
							end
							v_u_11.Title.UIGradient_On.Enabled = false
							v_u_17.Timer.Text = v_u_3:AbbreviateTime(v_u_18)
							local v21, _ = v_u_8:GetNextClaimableGift()
							if v_u_15 == v21 then
								v_u_11.Title.Text = v_u_17.Timer.Text
								v_u_11.Frame.Visible = false
							end
						end
					end)
				end
			end
			v_u_9:WaitForInstance(v_u_17):andThen(function(p22)
				-- upvalues: (ref) v_u_8, (copy) v_u_15, (copy) v_u_17, (ref) v_u_10, (ref) v_u_24
				p22:AddCallback(function()
					-- upvalues: (ref) v_u_8, (ref) v_u_15, (ref) v_u_17, (ref) v_u_10, (ref) v_u_24
					if v_u_8:ClaimGift(v_u_15) then
						v_u_17.Claimed.Visible = true
						v_u_17.Claim.Visible = false
						v_u_17.Timer.Visible = false
						for _, v23 in pairs(v_u_10:GetChildren()) do
							if v23:IsA("ImageButton") and v23.Claimed.Visible == false then
								return
							end
						end
						task.wait(0.1)
						v_u_24()
					end
				end)
			end)
			v_u_17.Parent = v_u_10
		end
	end
	v_u_24()
	v_u_1.PromptProductPurchaseFinished:Connect(function(_, p25, p26)
		-- upvalues: (ref) v_u_5, (copy) v_u_24, (copy) v_u_11
		if p25 == v_u_5.PLAYTIME_REWARD_SKIP.id and p26 then
			task.wait(0.1)
			v_u_24()
			v_u_11.Title.Text = "Ready!"
			v_u_11.Frame.Visible = true
		end
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.UpgradesShop.UpgradesHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Shared.AbbreviationUtils)
local v_u_3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.Configs.UpgradeConfig)
local v_u_5 = script.Parent:WaitForChild("Container"):WaitForChild("ScrollingFrame")
v_u_3.OnStart():andThen(function()
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_2
	local v_u_6 = require(v_u_3.UIComponents.Button)
	local v_u_7 = v_u_3.GetController("ReplicaController")
	local v8 = v_u_7:GetReplica()
	local v_u_9 = v_u_3.GetService("UpgradesService")
	local function v_u_32()
		-- upvalues: (ref) v_u_4, (copy) v_u_7, (ref) v_u_5, (ref) v_u_2
		for v10, v11 in v_u_4.Upgrades do
			local v12 = v_u_7:GetPlayerData()
			local v13 = (v12.Upgrades or {})[v10] or 0
			local v14 = v12.Currencies.Cash or 0
			local v15, v16 = v_u_4.GetMaxBuyable(v10, v13, v14)
			local v17 = v_u_4.GetBulkPrice(v10, v13, 1)
			local v18 = v_u_5:WaitForChild(v10):WaitForChild("Main"):WaitForChild("Buttons")
			local v19 = v18:WaitForChild("Buy1")
			local v20 = v19:WaitForChild("Ready_UI")
			local v21 = v19:WaitForChild("NotReady_UI")
			local v22 = v18:WaitForChild("BuyHalf")
			local v23 = v18:WaitForChild("BuyMax")
			local v24 = v18:WaitForChild("Max")
			local v25 = v19:WaitForChild("Cash")
			v25.Text = ("%*$"):format((v_u_2:AbbreviateNumber(v17, 1)))
			v25:WaitForChild("Cash").Text = v25.Text
			v20.Enabled = true
			v21.Enabled = false
			if v15 <= 1 then
				if v15 <= 0 then
					v20.Enabled = false
					v21.Enabled = true
				end
				v19.Visible = true
				v22.Visible = false
				v23.Visible = false
			elseif v15 == 2 then
				v19.Visible = true
				v22.Visible = false
				v23.Visible = true
				v23:WaitForChild("Frame"):WaitForChild("Amount").Text = ("Buy %*"):format(v15)
				local v26 = v23:WaitForChild("Cash")
				v26.Text = ("%*$"):format((v_u_2:AbbreviateNumber(v16, 1)))
				v26:WaitForChild("Cash").Text = v26.Text
			else
				v19.Visible = true
				v22.Visible = true
				v23.Visible = true
				local v27 = v15 / 2
				local v28 = math.ceil(v27)
				local v29 = v_u_4.GetBulkPrice(v10, v13, v28)
				v22:WaitForChild("Frame"):WaitForChild("Amount").Text = ("Buy %*"):format(v28)
				local v30 = v22:WaitForChild("Cash")
				v30.Text = ("%*$"):format((v_u_2:AbbreviateNumber(v29, 1)))
				v30:WaitForChild("Cash").Text = v30.Text
				v23:WaitForChild("Frame"):WaitForChild("Amount").Text = ("Buy %*"):format(v15)
				local v31 = v23:WaitForChild("Cash")
				v31.Text = ("%*$"):format((v_u_2:AbbreviateNumber(v16, 1)))
				v31:WaitForChild("Cash").Text = v31.Text
			end
			if v11.maxLevel and v11.maxLevel <= v13 then
				v19.Visible = false
				v22.Visible = false
				v23.Visible = false
				v24.Visible = true
			end
		end
	end
	local function v_u_40(p33)
		-- upvalues: (ref) v_u_4, (copy) v_u_7, (ref) v_u_5, (copy) v_u_32
		local v34 = v_u_4.Upgrades[p33]
		local v35 = (v_u_7:GetPlayerData().Upgrades or {})[p33] or 0
		local v36 = v_u_5:WaitForChild(p33):WaitForChild("Main"):WaitForChild("Stats")
		v_u_5:WaitForChild(p33):WaitForChild("Main"):WaitForChild("Buttons")
		local v37 = v36:WaitForChild("CurrentRank")
		v37.Text = ("%*: %*"):format(v34.name, v35)
		v37:WaitForChild("TextLabel").Text = v37.Text
		local v38 = v36:WaitForChild("Block")
		local v39 = v36:WaitForChild("NextRank")
		v39.Text = v35 + 1
		v39:WaitForChild("TextLabel").Text = v39.Text
		if v34.maxLevel and v34.maxLevel <= v35 then
			v38.Visible = false
			v39.Visible = false
			v37.Visible = true
		else
			v38.Visible = true
			v39.Visible = true
			v37.Visible = true
		end
		v_u_32()
	end
	(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_5, (copy) v_u_6, (copy) v_u_9, (copy) v_u_7
		for v_u_41, _ in v_u_4.Upgrades do
			local v42 = v_u_5:WaitForChild(v_u_41):WaitForChild("Main"):WaitForChild("Buttons")
			local v43 = v42:WaitForChild("Buy1")
			local v44 = v42:WaitForChild("BuyHalf")
			local v45 = v42:WaitForChild("BuyMax")
			v_u_6:WaitForInstance(v43):andThen(function(p46)
				-- upvalues: (ref) v_u_9, (copy) v_u_41
				p46:AddCallback(function()
					-- upvalues: (ref) v_u_9, (ref) v_u_41
					v_u_9:Upgrade(v_u_41, 1)
				end)
			end)
			v_u_6:WaitForInstance(v44):andThen(function(p47)
				-- upvalues: (ref) v_u_7, (copy) v_u_41, (ref) v_u_4, (ref) v_u_9
				p47:AddCallback(function()
					-- upvalues: (ref) v_u_7, (ref) v_u_41, (ref) v_u_4, (ref) v_u_9
					local v48 = v_u_7:GetPlayerData()
					local v49 = (v48.Upgrades or {})[v_u_41] or 0
					local v50 = v48.Currencies.Cash or 0
					local v51, _ = v_u_4.GetMaxBuyable(v_u_41, v49, v50)
					local v52 = v51 / 2
					v_u_9:Upgrade(v_u_41, (math.ceil(v52)))
				end)
			end)
			v_u_6:WaitForInstance(v45):andThen(function(p53)
				-- upvalues: (ref) v_u_7, (copy) v_u_41, (ref) v_u_4, (ref) v_u_9
				p53:AddCallback(function()
					-- upvalues: (ref) v_u_7, (ref) v_u_41, (ref) v_u_4, (ref) v_u_9
					local v54 = v_u_7:GetPlayerData()
					local v55 = (v54.Upgrades or {})[v_u_41] or 0
					local v56 = v54.Currencies.Cash or 0
					local v57, _ = v_u_4.GetMaxBuyable(v_u_41, v55, v56)
					v_u_9:Upgrade(v_u_41, v57)
				end)
			end)
		end
	end)()
	for v58, _ in v_u_4.Upgrades do
		v_u_40(v58)
	end
	v8:OnSet({ "Upgrades" }, function()
		-- upvalues: (ref) v_u_4, (copy) v_u_40
		for v59, _ in v_u_4.Upgrades do
			v_u_40(v59)
		end
	end)
	v8:OnSet({ "Currencies", "Cash" }, v_u_32)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Settings.SettingsHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
local v_u_2 = require(v1.Packages.Knit)
local v3 = script.Parent:WaitForChild("Slots"):WaitForChild("Container"):WaitForChild("ScrollingFrame")
local v_u_4 = v3:WaitForChild("Music"):WaitForChild("Main"):WaitForChild("ButtonHolder"):WaitForChild("Button")
local v_u_5 = v3:WaitForChild("SFX"):WaitForChild("Main"):WaitForChild("ButtonHolder"):WaitForChild("Button")
local v_u_6 = v3:WaitForChild("Gifting"):WaitForChild("Main"):WaitForChild("ButtonHolder"):WaitForChild("Button")
local v_u_7 = script.Parent:WaitForChild("Slots"):WaitForChild("AllSkins")
local v_u_8 = script.Parent:WaitForChild("Slots"):WaitForChild("AllSkins"):WaitForChild("Main"):WaitForChild("ScrollingFrame")
local v_u_9 = v3:WaitForChild("Skins"):WaitForChild("Main"):WaitForChild("ButtonHolder"):WaitForChild("BaseBtn")
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8, (copy) v_u_7, (copy) v_u_9
	local v_u_10 = v_u_2.GetController("ReplicaController")
	local v_u_11 = v_u_2.GetService("PlotService")
	local v_u_12 = v_u_2.GetController("SettingsController")
	local v_u_13 = v_u_2.GetController("SoundController")
	local v14 = v_u_10:GetReplica()
	local v15 = require(v_u_2.UIComponents.Button);
	(function()
		-- upvalues: (copy) v_u_10, (ref) v_u_4, (ref) v_u_5, (ref) v_u_6
		local v16 = v_u_10:GetPlayerData().Settings or {}
		if v16.MusicEnabled then
			v_u_4:WaitForChild("Off").Visible = false
			v_u_4:WaitForChild("On").Visible = true
		else
			v_u_4:WaitForChild("Off").Visible = true
			v_u_4:WaitForChild("On").Visible = false
		end
		if v16.SfxEnabled then
			v_u_5:WaitForChild("Off").Visible = false
			v_u_5:WaitForChild("On").Visible = true
		else
			v_u_5:WaitForChild("Off").Visible = true
			v_u_5:WaitForChild("On").Visible = false
		end
		if v16.GiftsEnabled then
			v_u_6.Off.Visible = false
			v_u_6.On.Visible = true
		else
			v_u_6.Off.Visible = true
			v_u_6.On.Visible = false
		end
	end)()
	v15:WaitForInstance(v_u_4):andThen(function(p17)
		-- upvalues: (copy) v_u_12, (copy) v_u_13, (ref) v_u_4
		p17:AddCallback(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_13, (ref) v_u_4
			if v_u_12:GetSetting("MusicEnabled") then
				v_u_12:ChangeSetting("MusicEnabled", false)
				v_u_13:StopMusic()
				v_u_4:WaitForChild("Off").Visible = true
				v_u_4:WaitForChild("On").Visible = false
			else
				v_u_12:ChangeSetting("MusicEnabled", true)
				v_u_13:StartBackgroundMusic()
				v_u_4:WaitForChild("Off").Visible = false
				v_u_4:WaitForChild("On").Visible = true
			end
		end)
	end)
	v15:WaitForInstance(v_u_5):andThen(function(p18)
		-- upvalues: (copy) v_u_12, (ref) v_u_5
		p18:AddCallback(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_5
			if v_u_12:GetSetting("SfxEnabled") then
				v_u_12:ChangeSetting("SfxEnabled", false)
				v_u_5:WaitForChild("Off").Visible = true
				v_u_5:WaitForChild("On").Visible = false
			else
				v_u_12:ChangeSetting("SfxEnabled", true)
				v_u_5:WaitForChild("Off").Visible = false
				v_u_5:WaitForChild("On").Visible = true
			end
		end)
	end)
	v15:WaitForInstance(v_u_6):andThen(function(p19)
		-- upvalues: (copy) v_u_12, (ref) v_u_6
		p19:AddCallback(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_6
			if v_u_12:GetSetting("GiftsEnabled") then
				v_u_12:ChangeSetting("GiftsEnabled", false)
				v_u_6.Off.Visible = true
				v_u_6.On.Visible = false
			else
				v_u_12:ChangeSetting("GiftsEnabled", true)
				v_u_6.Off.Visible = false
				v_u_6.On.Visible = true
			end
		end)
	end)
	for _, v_u_20 in pairs(v_u_8:GetChildren()) do
		if not v_u_20:IsA("UIListLayout") then
			v15:WaitForInstance(v_u_20):andThen(function(p21)
				-- upvalues: (copy) v_u_11, (copy) v_u_20, (ref) v_u_7
				p21:AddCallback(function()
					-- upvalues: (ref) v_u_11, (ref) v_u_20, (ref) v_u_7
					local v22, v23 = v_u_11:ChangeSkin(v_u_20.Name)
					if not v22 and v23 == "ALREADY_EQUIPED" then
						v_u_7.Visible = false
					end
					if v22 or v23 ~= "DONT_OWN" then
						v_u_7.Visible = false
					end
				end)
			end)
		end
	end
	local function v28(p24)
		-- upvalues: (ref) v_u_8
		for _, v25 in pairs(v_u_8:GetChildren()) do
			if not v25:IsA("UIListLayout") then
				v25.LOC.Visible = true
			end
		end
		for v26, _ in pairs(p24) do
			local v27 = v_u_8:FindFirstChild(v26)
			if v27 then
				v27.LOC.Visible = false
			end
		end
	end
	v28(v14.Data.UnlockedPlotSkins)
	v14:OnSet({ "UnlockedPlotSkins" }, v28)
	local v29 = v_u_8[v14.Data.CurrentPlotSkin].On:Clone()
	v29.Name = "CurrentSkin"
	v29.Parent = v_u_9
	if v_u_9:FindFirstChild("On") then
		v_u_9.On:Destroy()
	end
	v15:WaitForInstance(v_u_9):andThen(function(p30)
		-- upvalues: (ref) v_u_7
		p30:AddCallback(function()
			-- upvalues: (ref) v_u_7
			v_u_7.Visible = not v_u_7.Visible
		end)
	end)
	v14:OnSet({ "CurrentPlotSkin" }, function(p31)
		-- upvalues: (ref) v_u_9, (ref) v_u_8
		local v32 = v_u_9:FindFirstChild("CurrentSkin")
		if v32 then
			v32:Destroy()
		end
		local v33 = v_u_8[p31].On:Clone()
		v33.Name = "CurrentSkin"
		v33.Parent = v_u_9
	end)
	script.Parent:GetPropertyChangedSignal("Visible"):Connect(function()
		-- upvalues: (ref) v_u_7
		if not script.Parent.Visible then
			v_u_7.Visible = false
		end
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Settings.Slots.Container.ScrollingFrame.Skins.Main.ButtonHolder.BaseBtn.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = true
local v_u_2 = script.Parent.Parent.Parent.Parent.Parent.AllSkins
script.Parent.MouseButton1Click:Connect(function()
	-- upvalues: (ref) v_u_1, (copy) v_u_2
	if v_u_1 then
		v_u_1 = false
		if v_u_2.Visible == false then
			v_u_2.Visible = true
			script.Parent.Parent.Parent.Parent.Parent.CanvasSize = UDim2.new(0, 0, 2.17, 0)
			local v3 = script.Parent.Parent.Parent.Parent.Parent.AbsoluteCanvasSize.Y - script.Parent.Parent.Parent.Parent.Parent.AbsoluteSize.Y
			script.Parent.Parent.Parent.Parent.Parent.CanvasPosition = Vector2.new(0, v3)
			script.Parent.ImageLabel.Rotation = 180
		else
			script.Parent.ImageLabel.Rotation = 0
			v_u_2.Visible = false
			script.Parent.Parent.Parent.Parent.Parent.CanvasSize = UDim2.new(0, 0, 1.3, 0)
		end
		task.wait(0.1)
		v_u_1 = true
	end
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.FreeReward.GroupRewardsHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = require(game.ReplicatedStorage.Packages.Knit)
v_u_1.OnStart():andThen(function()
	-- upvalues: (copy) v_u_1
	local v_u_2 = v_u_1.GetService("RewardService")
	local v3 = require(v_u_1.UIComponents.Button)
	script.Parent:GetPropertyChangedSignal("Visible"):Connect(function()
		if script.Parent.Visible then
			script.Parent.Right.Frame.JoinTheGroup.Bar.Line.Line.Visible = false
			script.Parent.Right.Frame.JoinTheGroup.Bar.Line.Amount.Text = "0/1"
			script.Parent.Right.Frame.JoinTheGroup.Bar.Line.Amount.Amount.Text = "0/1"
			script.Parent.Right.Frame.LikeTheGame.Bar.Line.Line.Visible = false
			script.Parent.Right.Frame.LikeTheGame.Bar.Line.Amount.Text = "0/1"
			script.Parent.Right.Frame.LikeTheGame.Bar.Line.Amount.Amount.Text = "0/1"
			local _, _ = pcall(function()
				if game.Players.LocalPlayer:IsInGroup(719390069) then
					script.Parent.Right.Frame.JoinTheGroup.Bar.Line.Line.Visible = true
					script.Parent.Right.Frame.JoinTheGroup.Bar.Line.Amount.Text = "1/1"
					script.Parent.Right.Frame.JoinTheGroup.Bar.Line.Amount.Amount.Text = "1/1"
					script.Parent.Right.Frame.LikeTheGame.Bar.Line.Line.Visible = true
					script.Parent.Right.Frame.LikeTheGame.Bar.Line.Amount.Text = "1/1"
					script.Parent.Right.Frame.LikeTheGame.Bar.Line.Amount.Amount.Text = "1/1"
				end
			end)
		end
	end)
	v3:WaitForInstance(script.Parent.Right.ClaimButton):andThen(function(p4)
		-- upvalues: (copy) v_u_2
		p4:AddCallback(function()
			-- upvalues: (ref) v_u_2
			if v_u_2:GroupReward() then
				task.wait(4)
				pcall(function()
					game:GetService("AvatarEditorService"):PromptSetFavorite(124473577469410, 1, true)
				end)
			end
		end)
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Rebirth.RebirthHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Knit)
local v_u_3 = require(v1.Configs.RebirthConfig)
local v_u_4 = require(v1.Shared.RobloxUtils)
local v_u_5 = require(v1.Shared.AbbreviationUtils)
local v6 = script.Parent
local v_u_7 = v6:WaitForChild("Title"):WaitForChild("Amount")
local v_u_8 = v6:WaitForChild("Frame"):WaitForChild("Now")
local v_u_9 = v6:WaitForChild("Frame"):WaitForChild("After")
local v_u_10 = v6:WaitForChild("Frame"):WaitForChild("Block")
local v_u_11 = v6:WaitForChild("Bar"):WaitForChild("Progress")
local v_u_12 = v6:WaitForChild("Bar"):WaitForChild("SpeedText")
local v_u_13 = v6:WaitForChild("Buy"):WaitForChild("NotReady")
local v_u_14 = v6:WaitForChild("Buy"):WaitForChild("Rebirth")
local v_u_15 = v6:WaitForChild("Buy"):WaitForChild("RobuxButton")
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_5, (copy) v_u_12, (copy) v_u_13, (copy) v_u_11, (copy) v_u_14, (copy) v_u_15, (copy) v_u_9, (copy) v_u_10, (copy) v_u_7, (copy) v_u_8, (copy) v_u_4
	local v_u_16 = v_u_2.PlayerGui:WaitForChild("HUD"):WaitForChild("LeftButtons"):WaitForChild("Rebirth")
	local v17 = require(v_u_2.UIComponents.Button)
	local v_u_18 = v_u_2.GetController("ReplicaController")
	local v_u_19 = v_u_2.GetController("MonetizationController")
	local v_u_20 = v_u_2.GetController("SoundController")
	local v_u_21 = v_u_2.GetService("RebirthService")
	local v22 = v_u_18:GetReplica()
	local function v_u_32()
		-- upvalues: (copy) v_u_18, (ref) v_u_3, (ref) v_u_5, (ref) v_u_12, (ref) v_u_13, (ref) v_u_11, (ref) v_u_14, (copy) v_u_16
		local v23 = v_u_18:GetPlayerData()
		local v24 = v23.Currencies.Cash or 0
		local v25 = v23.Rebirth or 0
		local v26 = v_u_3.REBIRTH[v25 + 1]
		local v27 = v26 and (v26.Cost.Cash or -1) or -1
		local v28 = v27 == -1 and "Max" or (v_u_5:AbbreviateNumber(v26.Cost.Cash, 1) or "Max")
		if v26 then
			v_u_12.Text = ("Cash: %*$/%*$"):format(v_u_5:AbbreviateNumber(v24, 1), v28)
		else
			v_u_12.Text = "MAX"
			v_u_13.Cash.Text = "MAX"
			v_u_13.Cash.Cash.Text = v_u_13.Cash.Text
		end
		v_u_12:WaitForChild("TextLabel").Text = v_u_12.Text
		if v27 == -1 then
			v_u_11.Size = UDim2.fromScale(1, 1)
		else
			local v29 = v24 / v27
			local v30 = math.min(1, v29)
			v_u_11.Size = UDim2.fromScale(v30, 1)
		end
		if v27 == -1 then
			v_u_13.Visible = true
			v_u_14.Visible = false
			v_u_16:WaitForChild("Frame").Visible = false
			return
		else
			local v31 = v24 / v27
			if math.min(1, v31) >= 1 then
				v_u_13.Visible = false
				v_u_14.Visible = true
				v_u_16:WaitForChild("Frame").Visible = true
			else
				v_u_13.Visible = true
				v_u_14.Visible = false
				v_u_16:WaitForChild("Frame").Visible = false
			end
		end
	end
	local function v42()
		-- upvalues: (copy) v_u_18, (ref) v_u_3, (ref) v_u_15, (ref) v_u_14, (ref) v_u_9, (ref) v_u_10, (copy) v_u_32, (ref) v_u_7, (ref) v_u_8, (copy) v_u_19, (ref) v_u_4
		local v33 = v_u_18:GetPlayerData().Rebirth or 0
		if v33 == #v_u_3.REBIRTH then
			v_u_15.Visible = false
			v_u_14.Visible = false
			v_u_9.Visible = false
			v_u_10.Visible = false
		else
			v_u_15.Visible = true
			v_u_14.Visible = true
			v_u_9.Visible = true
			v_u_10.Visible = true
		end
		v_u_32()
		v_u_7.Text = v33
		v_u_7:WaitForChild("Shadow").Text = v_u_7.Text
		local v34 = v_u_8:WaitForChild("Reb")
		v34.Text = ("Rebirth %*"):format(v33)
		v34:WaitForChild("Reb").Text = v34.Text
		local v35 = v33 > 0 and (v_u_3.REBIRTH[v33].CashMulti or 1) or 1
		local v36 = v_u_8:WaitForChild("Cash")
		v36.Text = ("x%* Cash"):format(v35)
		v36:WaitForChild("Cash").Text = v36.Text
		local v37 = v_u_9:WaitForChild("Reb")
		v37.Text = ("Rebirth %*"):format(v33 + 1)
		v37:WaitForChild("Reb").Text = v37.Text
		local v38 = v_u_9:WaitForChild("Cash")
		if v_u_3.REBIRTH[v33 + 1] then
			v38.Text = ("x%* Cash"):format(v_u_3.REBIRTH[v33 + 1].CashMulti)
			v38:WaitForChild("Cash").Text = v38.Text
		end
		local v39 = v_u_3.GetSkipInfo(v33)
		if v39 then
			local v40 = v_u_19:GetMonetizationPrice(v39.devProductId) or v39.defaultPrice
			local v41 = v_u_15:WaitForChild("Rub")
			v41.Text = ("%*%*"):format(v_u_4:GetRobuxIconText(), v40)
			v41:WaitForChild("Rub").Text = v41.Text
		end
	end
	v17:WaitForInstance(v_u_14):andThen(function(p43)
		-- upvalues: (copy) v_u_21
		p43:AddCallback(function()
			-- upvalues: (ref) v_u_21
			v_u_21:Rebirth()
		end)
	end)
	v17:WaitForInstance(v_u_15):andThen(function(p44)
		-- upvalues: (copy) v_u_21, (copy) v_u_19, (copy) v_u_20
		p44:AddCallback(function()
			-- upvalues: (ref) v_u_21, (ref) v_u_19, (ref) v_u_20
			if v_u_21:InitSkip() then
				v_u_19:ShowPendingPurchase()
				v_u_20:PlaySound("PromotAnItem")
			end
		end)
	end)
	v42()
	v22:OnSet({ "Rebirth" }, v42)
	v22:OnSet({ "Currencies", "Cash" }, v_u_32)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Shop.Holder.Scrolling.Featured.Packs.LuckyBlock.Icon2.Ray.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("TweenService")
while true do
	v1:Create(script.Parent.UIGradient, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		["Rotation"] = 0
	}):Play()
	task.wait(1)
	v1:Create(script.Parent.UIGradient, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		["Rotation"] = -180
	}):Play()
	task.wait(1)
	v1:Create(script.Parent.UIGradient, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		["Rotation"] = 0
	}):Play()
	task.wait(1)
	v1:Create(script.Parent.UIGradient, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		["Rotation"] = 180
	}):Play()
	task.wait(1)
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Shop.Holder.Scrolling.Featured.Packs.LuckyBlock.Icon2.Folder.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("TweenService")
while true do
	for _, v2 in pairs(script.Parent:GetChildren()) do
		if v2.ClassName == "ImageLabel" then
			if v2.Name == "Icon1" then
				v1:Create(v2, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
					["Position"] = UDim2.fromScale(0.464, 0.45)
				}):Play()
			elseif v2.Name == "Icon2" then
				v1:Create(v2, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
					["Position"] = UDim2.fromScale(0.148, -0.05)
				}):Play()
			elseif v2.Name == "Icon3" then
				v1:Create(v2, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
					["Position"] = UDim2.fromScale(0.729, -0)
				}):Play()
			end
		end
	end
	task.wait(1.6)
	for _, v3 in pairs(script.Parent:GetChildren()) do
		if v3.ClassName == "ImageLabel" then
			if v3.Name == "Icon1" then
				v1:Create(v3, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
					["Position"] = UDim2.fromScale(0.464, 0.505)
				}):Play()
			elseif v3.Name == "Icon2" then
				v1:Create(v3, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
					["Position"] = UDim2.fromScale(0.148, 0.07)
				}):Play()
			elseif v3.Name == "Icon3" then
				v1:Create(v3, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
					["Position"] = UDim2.fromScale(0.729, 0.075)
				}):Play()
			end
		end
	end
	task.wait(1.6)
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Shop.Holder.Scrolling.Featured.Packs.LuckyBlock.Content.Runbar.Runbar.Runbar.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("TweenService")
while true do
	v1:Create(script.Parent, TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		["Position"] = UDim2.fromScale(-0.713, 0.5)
	}):Play()
	task.wait(10)
	script.Parent.Position = UDim2.fromScale(0.5, 0.5)
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Shop.Holder.Scrolling.Codes.CodesHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Knit)
local v_u_3 = script.Parent:WaitForChild("Frame"):WaitForChild("TextBoxBackground"):WaitForChild("TextBox")
local v_u_4 = script.Parent:WaitForChild("Frame"):WaitForChild("VerifyButton")
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	local v5 = require(v_u_2.UIComponents.Button)
	local v_u_6 = v_u_2.GetService("CodesService")
	local v7, v8 = v5:WaitForInstance(v_u_4):await()
	if v7 then
		v8:AddCallback(function()
			-- upvalues: (ref) v_u_3, (copy) v_u_6
			local v9, _ = v_u_6:RedeemCode(v_u_3.Text)
			if v9 then
				v_u_3.Text = ""
			end
		end)
	else
		warn("Failed to get submit code button component")
	end
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Shop.ShopHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
require(v1.Configs.MonetizationConfig)
local v_u_2 = require(v1.Packages.Knit)
local v_u_3 = require(v1.Shared.SmoothScrollUtils)
require(v1.GameShared.PlotUtils)
local v_u_4 = require(v1.Configs.FreeShopConfig)
local v5 = script.Parent:WaitForChild("Title"):WaitForChild("TopButtons")
local v_u_6 = v5:WaitForChild("Featured")
local v_u_7 = v5:WaitForChild("GamepassesTitle")
local v_u_8 = v5:WaitForChild("Codes")
local v_u_9 = script.Parent:WaitForChild("Holder"):WaitForChild("Scrolling")
local v_u_10 = v_u_9:WaitForChild("FreeItem"):WaitForChild("Packs"):WaitForChild("Free Reward")
local v_u_11 = v_u_10:WaitForChild("Buttons")
local v_u_12 = v_u_9:WaitForChild("Featured")
local v_u_13 = v_u_9:WaitForChild("GamePass")
local v_u_14 = v_u_9:WaitForChild("Codes")
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_11, (copy) v_u_4, (copy) v_u_10, (copy) v_u_6, (copy) v_u_3, (copy) v_u_9, (copy) v_u_12, (copy) v_u_7, (copy) v_u_13, (copy) v_u_8, (copy) v_u_14
	local v15 = require(v_u_2.UIComponents.Button)
	require(v_u_2.UIComponents.MonetizationButton)
	local v_u_16 = v_u_2.GetController("NotificationController")
	local v17 = v_u_2.GetController("ReplicaController")
	v_u_2.GetController("WindowController")
	local v_u_18 = v_u_2.GetService("FreeShopService")
	local v19 = v17:GetPlayerData()
	local v20 = v_u_11:WaitForChild("Owned")
	local v21 = v_u_11:WaitForChild("NotOwned")
	local v_u_22 = v19.LastFreeShopClaim < v_u_4.CURRENT_CLAIM_INDEX
	if v_u_22 then
		v20.Visible = false
		v21.Visible = true
	else
		v20.Visible = true
		v21.Visible = false
	end
	v17:GetReplica():OnSet({ "LastFreeShopClaim" }, function(p23)
		-- upvalues: (ref) v_u_11, (ref) v_u_22, (ref) v_u_4
		local v24 = v_u_11:WaitForChild("Owned")
		local v25 = v_u_11:WaitForChild("NotOwned")
		v_u_22 = p23 < v_u_4.CURRENT_CLAIM_INDEX
		if v_u_22 then
			v24.Visible = false
			v25.Visible = true
		else
			v24.Visible = true
			v25.Visible = false
		end
	end)
	v15:WaitForInstance(v_u_10):andThen(function(p26)
		-- upvalues: (ref) v_u_22, (copy) v_u_16, (copy) v_u_18
		p26:AddCallback(function()
			-- upvalues: (ref) v_u_22, (ref) v_u_16, (ref) v_u_18
			if v_u_22 then
				v_u_18:Claim()
			else
				v_u_16:DisplayNotification("Error", "You have already claimed this reward")
			end
		end)
	end)
	v15:WaitForInstance(v_u_6):andThen(function(p27)
		-- upvalues: (ref) v_u_3, (ref) v_u_9, (ref) v_u_12
		p27:AddCallback(function()
			-- upvalues: (ref) v_u_3, (ref) v_u_9, (ref) v_u_12
			v_u_3.scrollToElement(v_u_9, v_u_12)
		end)
	end)
	v15:WaitForInstance(v_u_7):andThen(function(p28)
		-- upvalues: (ref) v_u_3, (ref) v_u_9, (ref) v_u_13
		p28:AddCallback(function()
			-- upvalues: (ref) v_u_3, (ref) v_u_9, (ref) v_u_13
			v_u_3.scrollToElement(v_u_9, v_u_13)
		end)
	end)
	v15:WaitForInstance(v_u_8):andThen(function(p29)
		-- upvalues: (ref) v_u_3, (ref) v_u_9, (ref) v_u_14
		p29:AddCallback(function()
			-- upvalues: (ref) v_u_3, (ref) v_u_9, (ref) v_u_14
			v_u_3.scrollToElement(v_u_9, v_u_14)
		end)
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Shop.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("PolicyService")
local v_u_2 = game:GetService("Players").LocalPlayer
local v3, v4 = pcall(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	return v_u_1:GetPolicyInfoForPlayerAsync(v_u_2)
end)
function DisableDis(p5)
	if p5 == false and workspace:FindFirstChild("FreeRewardSocial") then
		workspace:WaitForChild("FreeRewardSocial"):Destroy()
	end
end
if v3 then
	if v4.ArePaidRandomItemsRestricted then
		script.Parent.Holder.Scrolling.Featured.Packs.LuckyBlock.Visible = false
		script.Parent.Holder.Scrolling.Featured.Size = UDim2.fromScale(1, 0.513)
		script.Parent.Holder.Scrolling.CanvasSize = UDim2.new(0, 0, 3.3, 0)
	end
	if table.find(v4.AllowedExternalLinkReferences, "Discord") then
		DisableDis(true)
	else
		DisableDis(false)
	end
	table.find(v4.AllowedExternalLinkReferences, "YouTube")
	table.find(v4.AllowedExternalLinkReferences, "X")
else
	warn("PolicyService error: " .. v4)
	DisableDis(false)
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Shop.GiftingHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_4 = v_u_3.PlayerGui:WaitForChild("Windows"):WaitForChild("GiftingUI")
local v_u_5 = v_u_3.PlayerGui:WaitForChild("Windows"):WaitForChild("Shop")
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = {}
local function v_u_23(p_u_12)
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (ref) v_u_6, (copy) v_u_2, (copy) v_u_11, (ref) v_u_7, (ref) v_u_10, (ref) v_u_8
	if p_u_12 ~= v_u_1.LocalPlayer then
		local v_u_13 = p_u_12.UserId
		local v14 = script.PlayerTemplate:Clone()
		v14.Name = p_u_12.Name
		v14.PlayerNickname.Text = p_u_12.DisplayName
		v14.PlayerNickname.ItemName.Text = v14.PlayerNickname.Text
		v14.PlayerUsername.Text = p_u_12.Name
		local v_u_15 = nil
		local v16, _ = pcall(function()
			-- upvalues: (ref) v_u_15, (ref) v_u_1, (copy) v_u_13
			v_u_15 = v_u_1:GetUserThumbnailAsync(v_u_13, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		end)
		if v16 then
			v14.PlayerImage.Image = v_u_15
		else
			v14.ImageColor3 = Color3.new(0, 0, 0)
			v14.ImageTransparency = 0.4
		end
		v14.Parent = v_u_4.Inner.ScrollingFrame
		v_u_6:WaitForInstance(v14):andThen(function(p17)
			-- upvalues: (ref) v_u_2, (ref) v_u_11, (ref) v_u_7, (ref) v_u_4, (ref) v_u_10, (copy) p_u_12, (ref) v_u_8
			p17:AddCallback(function()
				-- upvalues: (ref) v_u_2, (ref) v_u_11, (ref) v_u_7, (ref) v_u_4, (ref) v_u_10, (ref) p_u_12, (ref) v_u_8
				for _, v18 in pairs(v_u_2:GetTagged("GiftIcon")) do
					if not v18.Visible then
						v18.Visible = true
						local v19 = v18.Parent:FindFirstChild("Owned", true)
						if v19 then
							v19:SetAttribute("Before", v19.Visible)
							v19.Visible = false
						end
						local v20 = v18.Parent:FindFirstChild("NotOwned", true)
						if v20 then
							v20:SetAttribute("Before", v20.Visible)
							v20.Visible = true
						end
						for _, v21 in v_u_11 do
							local v22 = v18.Parent:FindFirstChild(v21, true)
							if v22 then
								v22:SetAttribute("Before", v22.Visible)
								v22.Visible = true
							end
						end
					end
				end
				v_u_7:SetCurrentWindow(v_u_4:GetAttribute("LastWindow"))
				v_u_10 = p_u_12
				script.Parent.CancelButton.Visible = true
				script.Parent.GiftButton.Visible = false
				script.Parent.GiftingText.Visible = true
				script.Parent.GiftingText.Text = "Gifting to: " .. p_u_12.DisplayName
				v_u_8:Gifting(p_u_12.UserId)
			end)
		end)
	end
end
local function v_u_26(p24)
	-- upvalues: (copy) v_u_1, (copy) v_u_4
	if p24 ~= v_u_1.LocalPlayer then
		local v25 = v_u_4.Inner.ScrollingFrame:FindFirstChild(p24.Name)
		if v25 then
			v25:Destroy()
		end
	end
end
local function v_u_41()
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (ref) v_u_6, (copy) v_u_2, (copy) v_u_11, (ref) v_u_7, (ref) v_u_10, (ref) v_u_8
	local v_u_27 = v_u_4.SpecificGift.Frame.TextBoxBackground.TextBox
	v_u_27.FocusLost:Connect(function()
		-- upvalues: (ref) v_u_1, (copy) v_u_27, (ref) v_u_4
		local v28, v_u_29 = pcall(function()
			-- upvalues: (ref) v_u_1, (ref) v_u_27
			return v_u_1:GetUserIdFromNameAsync(v_u_27.Text)
		end)
		if v28 then
			local v30, v31 = pcall(function()
				-- upvalues: (ref) v_u_1, (copy) v_u_29
				return v_u_1:GetUserThumbnailAsync(v_u_29, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
			end)
			if v30 then
				v_u_4.SpecificGift.Frame.PlayerImage.Image = v31
				v_u_4.SpecificGift.Frame.PlayerImage.ImageColor3 = Color3.new(1, 1, 1)
				v_u_4.SpecificGift.Frame.PlayerImage.ImageTransparency = 0
			else
				v_u_4.SpecificGift.Frame.PlayerImage.ImageColor3 = Color3.new(0, 0, 0)
				v_u_4.SpecificGift.Frame.PlayerImage.ImageTransparency = 0.4
				v_u_4.SpecificGift.Frame.PlayerImage.Image = "rbxthumb://type=AvatarHeadShot&id=49878346&w=420&h=420"
			end
		else
			v_u_4.SpecificGift.Frame.PlayerImage.ImageColor3 = Color3.new(0, 0, 0)
			v_u_4.SpecificGift.Frame.PlayerImage.ImageTransparency = 0.4
			v_u_4.SpecificGift.Frame.PlayerImage.Image = "rbxthumb://type=AvatarHeadShot&id=49878346&w=420&h=420"
			return
		end
	end)
	v_u_6:WaitForInstance(v_u_4.SpecificGift.Frame.TextButton, 3):andThen(function(p32)
		-- upvalues: (ref) v_u_1, (copy) v_u_27, (ref) v_u_2, (ref) v_u_11, (ref) v_u_7, (ref) v_u_4, (ref) v_u_10, (ref) v_u_8
		p32:AddCallback(function()
			-- upvalues: (ref) v_u_1, (ref) v_u_27, (ref) v_u_2, (ref) v_u_11, (ref) v_u_7, (ref) v_u_4, (ref) v_u_10, (ref) v_u_8
			local v33, v34 = pcall(function()
				-- upvalues: (ref) v_u_1, (ref) v_u_27
				return v_u_1:GetUserIdFromNameAsync(v_u_27.Text)
			end)
			if v33 then
				local v35 = v_u_27.Text
				for _, v36 in pairs(v_u_2:GetTagged("GiftIcon")) do
					if not v36.Visible then
						v36.Visible = true
						local v37 = v36.Parent:FindFirstChild("Owned", true)
						if v37 then
							v37:SetAttribute("Before", v37.Visible)
							v37.Visible = false
						end
						local v38 = v36.Parent:FindFirstChild("NotOwned", true)
						if v38 then
							v38:SetAttribute("Before", v38.Visible)
							v38.Visible = true
						end
						for _, v39 in v_u_11 do
							local v40 = v36.Parent:FindFirstChild(v39, true)
							if v40 then
								v40:SetAttribute("Before", v40.Visible)
								v40.Visible = true
							end
						end
					end
				end
				v_u_7:SetCurrentWindow(v_u_4:GetAttribute("LastWindow"))
				v_u_10 = v35
				script.Parent.CancelButton.Visible = true
				script.Parent.GiftButton.Visible = false
				script.Parent.GiftingText.Visible = true
				script.Parent.GiftingText.Text = "Gifting to: " .. v35
				v_u_8:Gifting(v34)
				v_u_27.Text = ""
				v_u_4.SpecificGift.Frame.PlayerImage.ImageColor3 = Color3.new(0, 0, 0)
				v_u_4.SpecificGift.Frame.PlayerImage.ImageTransparency = 0.4
				v_u_4.SpecificGift.Frame.PlayerImage.Image = "rbxthumb://type=AvatarHeadShot&id=49878346&w=420&h=420"
			else
				NotificationController:DisplayNotification("Error", "Player was not found!")
			end
		end)
	end)
end
v_u_3.OnStart():andThen(function()
	-- upvalues: (copy) v_u_3, (ref) v_u_7, (ref) v_u_8, (ref) v_u_6, (ref) v_u_9, (copy) v_u_4, (copy) v_u_2, (copy) v_u_11, (ref) v_u_10, (copy) v_u_5, (copy) v_u_1, (copy) v_u_23, (copy) v_u_26, (copy) v_u_41
	local v42 = v_u_3.GetController("ReplicaController")
	v_u_7 = v_u_3.GetController("WindowController")
	NotificationController = v_u_3.GetController("NotificationController")
	v_u_8 = v_u_3.GetService("MonetizationService")
	v_u_6 = require(v_u_3.UIComponents.Button)
	v_u_9 = v42:GetReplica()
	v_u_6:WaitForInstance(script.Parent.GiftButton):andThen(function(p43)
		-- upvalues: (ref) v_u_4, (ref) v_u_7
		p43:AddCallback(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_7
			v_u_4:SetAttribute("LastWindow", script.Parent.Name)
			v_u_7:SetCurrentWindow("GiftingUI")
			v_u_4.SpecificGift.Frame.TextBoxBackground.TextBox.Text = ""
			v_u_4.SpecificGift.Frame.PlayerImage.ImageColor3 = Color3.new(0, 0, 0)
			v_u_4.SpecificGift.Frame.PlayerImage.ImageTransparency = 0.4
			v_u_4.SpecificGift.Frame.PlayerImage.Image = "rbxthumb://type=AvatarHeadShot&id=49878346&w=420&h=420"
		end)
	end)
	v_u_6:WaitForInstance(script.Parent.CancelButton):andThen(function(p44)
		-- upvalues: (ref) v_u_2, (ref) v_u_11, (ref) v_u_10, (ref) v_u_8
		p44:AddCallback(function()
			-- upvalues: (ref) v_u_2, (ref) v_u_11, (ref) v_u_10, (ref) v_u_8
			for _, v45 in pairs(v_u_2:GetTagged("GiftIcon")) do
				if v45.Visible then
					v45.Visible = false
					local v46 = v45.Parent:FindFirstChild("Owned", true)
					if v46 and v46:GetAttribute("Before") ~= nil then
						v46.Visible = v46:GetAttribute("Before")
						v46:SetAttribute("Before", nil)
					end
					local v47 = v45.Parent:FindFirstChild("NotOwned", true)
					if v47 and v47:GetAttribute("Before") ~= nil then
						v47.Visible = v47:GetAttribute("Before")
						v47:SetAttribute("Before", nil)
					end
					for _, v48 in v_u_11 do
						local v49 = v45.Parent:FindFirstChild(v48, true)
						if v49 and v49:GetAttribute("Before") ~= nil then
							v49.Visible = v49:GetAttribute("Before")
							v49:SetAttribute("Before", nil)
						end
					end
				end
			end
			v_u_10 = nil
			script.Parent.CancelButton.Visible = false
			script.Parent.GiftButton.Visible = true
			script.Parent.GiftingText.Visible = false
			v_u_8:Gifting()
		end)
	end)
	v_u_5:GetPropertyChangedSignal("Visible"):Connect(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_2, (ref) v_u_11, (ref) v_u_10, (ref) v_u_8
		if not v_u_5.Visible then
			for _, v50 in pairs(v_u_2:GetTagged("GiftIcon")) do
				if v50.Visible then
					v50.Visible = false
					local v51 = v50.Parent:FindFirstChild("Owned", true)
					if v51 and v51:GetAttribute("Before") ~= nil then
						v51.Visible = v51:GetAttribute("Before")
						v51:SetAttribute("Before", nil)
					end
					local v52 = v50.Parent:FindFirstChild("NotOwned", true)
					if v52 and v52:GetAttribute("Before") ~= nil then
						v52.Visible = v52:GetAttribute("Before")
						v52:SetAttribute("Before", nil)
					end
					for _, v53 in v_u_11 do
						local v54 = v50.Parent:FindFirstChild(v53, true)
						if v54 and v54:GetAttribute("Before") ~= nil then
							v54.Visible = v54:GetAttribute("Before")
							v54:SetAttribute("Before", nil)
						end
					end
				end
			end
			v_u_10 = nil
			script.Parent.CancelButton.Visible = false
			script.Parent.GiftButton.Visible = true
			script.Parent.GiftingText.Visible = false
			v_u_8:Gifting()
		end
	end)
	v_u_6:WaitForInstance(v_u_4.Title.Close):andThen(function(p55)
		-- upvalues: (ref) v_u_7, (ref) v_u_4
		p55:AddCallback(function()
			-- upvalues: (ref) v_u_7, (ref) v_u_4
			task.spawn(function()
				-- upvalues: (ref) v_u_7, (ref) v_u_4
				task.wait(0.1)
				v_u_7:SetCurrentWindow(v_u_4:GetAttribute("LastWindow"))
			end)
		end)
	end)
	v_u_1.PlayerAdded:Connect(v_u_23)
	for _, v56 in pairs(v_u_1:GetPlayers()) do
		v_u_23(v56)
	end
	v_u_1.PlayerRemoving:Connect(v_u_26)
	v_u_41()
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PickaxeShop.PIckaxeShopHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("MarketplaceService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Players")
local v_u_4 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_5 = require(v2.Shared.SavedDesigns)
local v_u_6 = require(v2.Configs.PlayerSkinConfig)
local v_u_7 = require(v2.Shared.RobloxUtils)
local v_u_8 = require(game.ReplicatedStorage.Shared.AbbreviationUtils)
v_u_4.OnStart():andThen(function()
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_8, (copy) v_u_7, (copy) v_u_1, (copy) v_u_3
	local v9 = v_u_4.GetController("ReplicaController")
	v_u_4.GetController("NotificationController")
	local v_u_10 = v_u_4.GetController("MonetizationController")
	local v_u_11 = v_u_4.GetController("SoundController")
	local v_u_12 = require(v_u_4.UIComponents.Button)
	local v_u_13 = v_u_4.GetService("SkinService")
	local v_u_14 = v9:GetReplica()
	local function v30()
		-- upvalues: (copy) v_u_14, (ref) v_u_6
		local v15 = v_u_14.Data.EquippedPlayerSkin
		local v16 = v_u_14.Data.OwnedSkins or {}
		local v17 = v_u_14.Data.Rebirth or 0
		for _, v18 in script.Parent.ShopContainer.ScrollingFrame:GetChildren() do
			if v18:IsA("Frame") then
				local v19 = v18.RebirthRq
				local v20 = v18.PassRq
				local v21 = v18.Main.ItemImage
				local v22 = v18.Main.Damage
				local v23 = v18.Main.Buy.BuyButton
				local v24 = v18.Main.Buy.RobuxButton
				local v25 = v18.Main.Buy.Equip
				local v26 = v18.Main.Buy.Unequip
				local v27 = v_u_6[v18.Name]
				local v28 = v18.Name == v15
				local v29 = v16[v18.Name]
				if v27.hideIfNotOwned and not v29 then
					v18.Visible = false
				else
					v18.Visible = true
					if v27.rebirthRequired and v17 < v27.rebirthRequired then
						v19.Visible = true
						v21.Visible = false
						v22.Visible = false
						v23.Visible = false
						v24.Visible = false
					elseif v27.rebirthRequired and v27.rebirthRequired <= v17 then
						v19.Visible = false
						v21.Visible = true
						v22.Visible = true
						v23.Visible = true
						v24.Visible = true
						::l18::
						if v28 then
							v26.Visible = true
							v25.Visible = false
							v23.Visible = false
							v24.Visible = false
						elseif v29 then
							v26.Visible = false
							v25.Visible = true
							v23.Visible = false
							v24.Visible = false
						else
							v26.Visible = false
							v25.Visible = false
							if v27.cost then
								v23.Visible = true
							end
							v24.Visible = true
						end
					else
						if not v27.passRequired or v29 then
							if v27.passRequired and v29 then
								v20.Visible = false
								v21.Visible = true
								v22.Visible = true
								v23.Visible = false
								v24.Visible = false
							end
							goto l18
						end
						v20.Visible = true
						v21.Visible = false
						v22.Visible = false
						v23.Visible = false
						v24.Visible = false
					end
				end
			end
		end
	end
	(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_5, (ref) v_u_8, (copy) v_u_10, (ref) v_u_7, (copy) v_u_12, (copy) v_u_13, (copy) v_u_11, (ref) v_u_1, (ref) v_u_3
		local v31 = script.Parent.ShopContainer.ScrollingFrame
		for v_u_32, v_u_33 in v_u_6 do
			local v34 = false
			local v35
			if script:FindFirstChild(v_u_32) then
				v35 = script:FindFirstChild(v_u_32):Clone()
				v34 = true
			else
				v35 = script.Template:Clone()
			end
			v35.Name = v_u_32
			v35.Main.ItemName.Text = v_u_33.name
			v35.Main.ItemName.TextLabel.Text = v35.Main.ItemName.Text
			v35.Main.ItemImageWrapper.ItemImage.Image = ("rbxassetid://%*"):format(v_u_33.image)
			v35.ZIndex = 1000000 - v_u_33.layoutOrder
			if v_u_33.isSpecial then
				v35:SetAttribute("IsSpecial", true)
			end
			if v_u_33.rebirthRequired then
				v35.RebirthRq.Title.Text = ("Rebirth <font color=\"#000000\">%*</font> Required"):format(v_u_33.rebirthRequired)
				v35.RebirthRq.Title.Shadow.Text = ("Rebirth <font color=\"#ff8a8c\">%*</font> Required"):format(v_u_33.rebirthRequired)
			end
			v35.RebirthRq.Visible = false
			if not v34 then
				v35.Main.Rarity.Text = v_u_33.rarity
				v_u_5:LoadDesign(v_u_33.rarity, v35.Main.Rarity)
			end
			if v_u_33.isSpecial then
				v35.Main.Damage.Text = ("x%*%%"):format(v_u_33.specialMulti * 100)
			else
				v35.Main.Damage.Text = ("x%*"):format((v_u_8:AbbreviateNumber(v_u_33.luck, 1))) .. ".0"
			end
			v35.Main.Buy.BuyButton.Visible = false
			if v_u_33.cost then
				v35.Main.Buy.BuyButton.Cash.Text = ("%*$"):format((v_u_8:AbbreviateNumber(v_u_33.cost)))
				v35.Main.Buy.BuyButton.Cash.Cash.Text = v35.Main.Buy.BuyButton.Cash.Text
				v35.Main.Buy.BuyButton.Visible = true
			end
			local v36 = v_u_10:GetMonetizationPrice(v_u_33.devProductId) or v_u_33.defaultPrice
			v35.Main.Buy.RobuxButton.TextLabel.Text = ("%*%*"):format(v_u_7:GetRobuxIconText(), v36)
			v35.Main.Buy.RobuxButton.TextLabel.TextLabel.Text = v35.Main.Buy.RobuxButton.TextLabel.Text
			v_u_12:WaitForInstance(v35.Main.Buy.Equip):andThen(function(p37)
				-- upvalues: (ref) v_u_13, (copy) v_u_32
				p37:AddCallback(function()
					-- upvalues: (ref) v_u_13, (ref) v_u_32
					v_u_13:EquipSkin(v_u_32)
				end)
			end)
			if v_u_33.cost then
				v_u_12:WaitForInstance(v35.Main.Buy.BuyButton):andThen(function(p38)
					-- upvalues: (ref) v_u_13, (copy) v_u_32
					p38:AddCallback(function()
						-- upvalues: (ref) v_u_13, (ref) v_u_32
						v_u_13:BuySkin(v_u_32)
					end)
				end)
			end
			v_u_12:WaitForInstance(v35.Main.Buy.RobuxButton):andThen(function(p39)
				-- upvalues: (ref) v_u_10, (ref) v_u_11, (ref) v_u_1, (ref) v_u_3, (copy) v_u_33
				p39:AddCallback(function()
					-- upvalues: (ref) v_u_10, (ref) v_u_11, (ref) v_u_1, (ref) v_u_3, (ref) v_u_33
					v_u_10:ShowPendingPurchase()
					v_u_11:PlaySound("PromotAnItem")
					v_u_1:PromptProductPurchase(v_u_3.LocalPlayer, v_u_33.devProductId)
				end)
			end)
			v35.LayoutOrder = v_u_33.layoutOrder
			v35.Parent = v31
		end
	end)()
	v30()
	v_u_14:OnSet({ "OwnedSkins" }, v30)
	v_u_14:OnSet({ "EquippedPlayerSkin" }, v30)
	v_u_14:OnSet({ "Rebirth" }, v30)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PickaxeShop.PIckaxeShopHandler.Template.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent:WaitForChild("Main"):WaitForChild("Damage")
local function v4()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	while true do
		for _, v3 in {
			Color3.fromRGB(221, 255, 69),
			Color3.fromRGB(255, 102, 105),
			Color3.fromRGB(111, 198, 94),
			Color3.fromRGB(255, 104, 29),
			Color3.fromRGB(255, 200, 61),
			Color3.fromRGB(85, 255, 255),
			Color3.fromRGB(255, 170, 255)
		} do
			v_u_1:Create(v_u_2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["TextColor3"] = v3
			}):Play()
			task.wait(1)
		end
	end
end
if script.Parent:GetAttribute("IsSpecial") then
	v4()
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PickaxeShop.ShopContainer.ScrollingFrame.prestige_mogging_luckyblock.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent:WaitForChild("Main"):WaitForChild("Damage")
local function v4()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	while true do
		for _, v3 in {
			Color3.fromRGB(221, 255, 69),
			Color3.fromRGB(255, 102, 105),
			Color3.fromRGB(111, 198, 94),
			Color3.fromRGB(255, 104, 29),
			Color3.fromRGB(255, 200, 61),
			Color3.fromRGB(85, 255, 255),
			Color3.fromRGB(255, 170, 255)
		} do
			v_u_1:Create(v_u_2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["TextColor3"] = v3
			}):Play()
			task.wait(1)
		end
	end
end
if script.Parent:GetAttribute("IsSpecial") then
	v4()
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PickaxeShop.ShopContainer.ScrollingFrame.fairy_luckyblock.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent:WaitForChild("Main"):WaitForChild("Damage")
local function v4()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	while true do
		for _, v3 in {
			Color3.fromRGB(221, 255, 69),
			Color3.fromRGB(255, 102, 105),
			Color3.fromRGB(111, 198, 94),
			Color3.fromRGB(255, 104, 29),
			Color3.fromRGB(255, 200, 61),
			Color3.fromRGB(85, 255, 255),
			Color3.fromRGB(255, 170, 255)
		} do
			v_u_1:Create(v_u_2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["TextColor3"] = v3
			}):Play()
			task.wait(1)
		end
	end
end
if script.Parent:GetAttribute("IsSpecial") then
	v4()
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PickaxeShop.ShopContainer.ScrollingFrame.cyborg_luckyblock.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent:WaitForChild("Main"):WaitForChild("Damage")
local function v4()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	while true do
		for _, v3 in {
			Color3.fromRGB(221, 255, 69),
			Color3.fromRGB(255, 102, 105),
			Color3.fromRGB(111, 198, 94),
			Color3.fromRGB(255, 104, 29),
			Color3.fromRGB(255, 200, 61),
			Color3.fromRGB(85, 255, 255),
			Color3.fromRGB(255, 170, 255)
		} do
			v_u_1:Create(v_u_2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["TextColor3"] = v3
			}):Play()
			task.wait(1)
		end
	end
end
if script.Parent:GetAttribute("IsSpecial") then
	v4()
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PickaxeShop.ShopContainer.ScrollingFrame.gliched_luckyblock.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent:WaitForChild("Main"):WaitForChild("Damage")
local function v4()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	while true do
		for _, v3 in {
			Color3.fromRGB(221, 255, 69),
			Color3.fromRGB(255, 102, 105),
			Color3.fromRGB(111, 198, 94),
			Color3.fromRGB(255, 104, 29),
			Color3.fromRGB(255, 200, 61),
			Color3.fromRGB(85, 255, 255),
			Color3.fromRGB(255, 170, 255)
		} do
			v_u_1:Create(v_u_2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["TextColor3"] = v3
			}):Play()
			task.wait(1)
		end
	end
end
if script.Parent:GetAttribute("IsSpecial") then
	v4()
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PickaxeShop.ShopContainer.ScrollingFrame.divine_luckyblock.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent:WaitForChild("Main"):WaitForChild("Damage")
local function v4()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	while true do
		for _, v3 in {
			Color3.fromRGB(221, 255, 69),
			Color3.fromRGB(255, 102, 105),
			Color3.fromRGB(111, 198, 94),
			Color3.fromRGB(255, 104, 29),
			Color3.fromRGB(255, 200, 61),
			Color3.fromRGB(85, 255, 255),
			Color3.fromRGB(255, 170, 255)
		} do
			v_u_1:Create(v_u_2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["TextColor3"] = v3
			}):Play()
			task.wait(1)
		end
	end
end
if script.Parent:GetAttribute("IsSpecial") then
	v4()
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PickaxeShop.ShopContainer.ScrollingFrame.freezy_luckyblock.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent:WaitForChild("Main"):WaitForChild("Damage")
local function v4()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	while true do
		for _, v3 in {
			Color3.fromRGB(221, 255, 69),
			Color3.fromRGB(255, 102, 105),
			Color3.fromRGB(111, 198, 94),
			Color3.fromRGB(255, 104, 29),
			Color3.fromRGB(255, 200, 61),
			Color3.fromRGB(85, 255, 255),
			Color3.fromRGB(255, 170, 255)
		} do
			v_u_1:Create(v_u_2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["TextColor3"] = v3
			}):Play()
			task.wait(1)
		end
	end
end
if script.Parent:GetAttribute("IsSpecial") then
	v4()
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PickaxeShop.ShopContainer.ScrollingFrame.lava_luckyblock.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent:WaitForChild("Main"):WaitForChild("Damage")
local function v4()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	while true do
		for _, v3 in {
			Color3.fromRGB(221, 255, 69),
			Color3.fromRGB(255, 102, 105),
			Color3.fromRGB(111, 198, 94),
			Color3.fromRGB(255, 104, 29),
			Color3.fromRGB(255, 200, 61),
			Color3.fromRGB(85, 255, 255),
			Color3.fromRGB(255, 170, 255)
		} do
			v_u_1:Create(v_u_2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["TextColor3"] = v3
			}):Play()
			task.wait(1)
		end
	end
end
if script.Parent:GetAttribute("IsSpecial") then
	v4()
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PickaxeShop.ShopContainer.ScrollingFrame.default.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent:WaitForChild("Main"):WaitForChild("Damage")
local function v4()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	while true do
		for _, v3 in {
			Color3.fromRGB(221, 255, 69),
			Color3.fromRGB(255, 102, 105),
			Color3.fromRGB(111, 198, 94),
			Color3.fromRGB(255, 104, 29),
			Color3.fromRGB(255, 200, 61),
			Color3.fromRGB(85, 255, 255),
			Color3.fromRGB(255, 170, 255)
		} do
			v_u_1:Create(v_u_2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["TextColor3"] = v3
			}):Play()
			task.wait(1)
		end
	end
end
if script.Parent:GetAttribute("IsSpecial") then
	v4()
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PickaxeShop.ShopContainer.ScrollingFrame.colossus _luckyblock.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent:WaitForChild("Main"):WaitForChild("Damage")
local function v4()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	while true do
		for _, v3 in {
			Color3.fromRGB(221, 255, 69),
			Color3.fromRGB(255, 102, 105),
			Color3.fromRGB(111, 198, 94),
			Color3.fromRGB(255, 104, 29),
			Color3.fromRGB(255, 200, 61),
			Color3.fromRGB(85, 255, 255),
			Color3.fromRGB(255, 170, 255)
		} do
			v_u_1:Create(v_u_2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["TextColor3"] = v3
			}):Play()
			task.wait(1)
		end
	end
end
if script.Parent:GetAttribute("IsSpecial") then
	v4()
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PickaxeShop.ShopContainer.ScrollingFrame.mogging_luckyblock.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent:WaitForChild("Main"):WaitForChild("Damage")
local function v4()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	while true do
		for _, v3 in {
			Color3.fromRGB(221, 255, 69),
			Color3.fromRGB(255, 102, 105),
			Color3.fromRGB(111, 198, 94),
			Color3.fromRGB(255, 104, 29),
			Color3.fromRGB(255, 200, 61),
			Color3.fromRGB(85, 255, 255),
			Color3.fromRGB(255, 170, 255)
		} do
			v_u_1:Create(v_u_2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["TextColor3"] = v3
			}):Play()
			task.wait(1)
		end
	end
end
if script.Parent:GetAttribute("IsSpecial") then
	v4()
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PickaxeShop.ShopContainer.ScrollingFrame.spirit_luckyblock.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent:WaitForChild("Main"):WaitForChild("Damage")
local function v4()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	while true do
		for _, v3 in {
			Color3.fromRGB(221, 255, 69),
			Color3.fromRGB(255, 102, 105),
			Color3.fromRGB(111, 198, 94),
			Color3.fromRGB(255, 104, 29),
			Color3.fromRGB(255, 200, 61),
			Color3.fromRGB(85, 255, 255),
			Color3.fromRGB(255, 170, 255)
		} do
			v_u_1:Create(v_u_2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["TextColor3"] = v3
			}):Play()
			task.wait(1)
		end
	end
end
if script.Parent:GetAttribute("IsSpecial") then
	v4()
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PickaxeShop.ShopContainer.ScrollingFrame.inferno_luckyblock.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent:WaitForChild("Main"):WaitForChild("Damage")
local function v4()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	while true do
		for _, v3 in {
			Color3.fromRGB(221, 255, 69),
			Color3.fromRGB(255, 102, 105),
			Color3.fromRGB(111, 198, 94),
			Color3.fromRGB(255, 104, 29),
			Color3.fromRGB(255, 200, 61),
			Color3.fromRGB(85, 255, 255),
			Color3.fromRGB(255, 170, 255)
		} do
			v_u_1:Create(v_u_2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["TextColor3"] = v3
			}):Play()
			task.wait(1)
		end
	end
end
if script.Parent:GetAttribute("IsSpecial") then
	v4()
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.PickaxeShop.ShopContainer.ScrollingFrame.void_luckyblock.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent:WaitForChild("Main"):WaitForChild("Damage")
local function v4()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	while true do
		for _, v3 in {
			Color3.fromRGB(221, 255, 69),
			Color3.fromRGB(255, 102, 105),
			Color3.fromRGB(111, 198, 94),
			Color3.fromRGB(255, 104, 29),
			Color3.fromRGB(255, 200, 61),
			Color3.fromRGB(85, 255, 255),
			Color3.fromRGB(255, 170, 255)
		} do
			v_u_1:Create(v_u_2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["TextColor3"] = v3
			}):Play()
			task.wait(1)
		end
	end
end
if script.Parent:GetAttribute("IsSpecial") then
	v4()
end

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.FreeRewardPlayTime.PlaytimeRewardHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = require(game.ReplicatedStorage.Packages.Knit)
v_u_1.OnStart():andThen(function()
	-- upvalues: (copy) v_u_1
	local v_u_2 = v_u_1.GetService("RewardService")
	local v3 = require(v_u_1.UIComponents.Button)
	v_u_2.OnLimitedProgressUpdated:Connect(function(p4)
		if p4.brainrots > 5 then
			p4.brainrots = 5
		end
		script.Parent.Right.Frame["Win 10 Games"].Bar.Line.Line.Visible = true
		script.Parent.Right.Frame["Win 10 Games"].Bar.Line.Line.Size = UDim2.new(p4.brainrots / 5, 0, 1, 0)
		script.Parent.Right.Frame["Win 10 Games"].Bar.Line.Amount.Text = p4.brainrots .. "/5"
		script.Parent.Right.Frame["Win 10 Games"].Bar.Line.Amount.Amount.Text = p4.brainrots .. "/5"
	end)
	v_u_2.OnLimitedRewardStarted:Connect(function()
		script.Parent.Right.Frame["Play for 25 Mins"].Bar.Line.Line.Visible = true
		script.Parent.Right.Frame["Play for 25 Mins"].Bar.Line.Line.Size = UDim2.new(0.08, 0, 1, 0)
		script.Parent.Right.Frame["Play for 25 Mins"].Bar.Line.Amount.Text = "2/25"
		script.Parent.Right.Frame["Play for 25 Mins"].Bar.Line.Amount.Amount.Text = "2/25"
		script.Parent.Right.Frame["Win 10 Games"].Bar.Line.Line.Visible = false
		script.Parent.Right.Frame["Win 10 Games"].Bar.Line.Amount.Text = "0/5"
		script.Parent.Right.Frame["Win 10 Games"].Bar.Line.Amount.Amount.Text = "0/5"
		for v5 = 3, 25 do
			task.wait(60)
			script.Parent.Right.Frame["Play for 25 Mins"].Bar.Line.Line.Visible = true
			script.Parent.Right.Frame["Play for 25 Mins"].Bar.Line.Line.Size = UDim2.new(v5 / 25, 0, 1, 0)
			script.Parent.Right.Frame["Play for 25 Mins"].Bar.Line.Amount.Text = v5 .. "/25"
			script.Parent.Right.Frame["Play for 25 Mins"].Bar.Line.Amount.Amount.Text = v5 .. "/25"
		end
	end)
	v3:WaitForInstance(script.Parent.Right.ClaimButton):andThen(function(p6)
		-- upvalues: (copy) v_u_2
		p6:AddCallback(function()
			-- upvalues: (ref) v_u_2
			if v_u_2:ClaimLimitedReward() then
				script.Parent.Right.Frame["Play for 25 Mins"].Bar.Line.Line.Visible = true
				script.Parent.Right.Frame["Play for 25 Mins"].Bar.Line.Line.Size = UDim2.new(1, 0, 1, 0)
				script.Parent.Right.Frame["Play for 25 Mins"].Bar.Line.Amount.Text = "25/25"
				script.Parent.Right.Frame["Play for 25 Mins"].Bar.Line.Amount.Amount.Text = "25/25"
				script.Parent.Right.Frame["Win 10 Games"].Bar.Line.Line.Visible = true
				script.Parent.Right.Frame["Win 10 Games"].Bar.Line.Line.Size = UDim2.new(1, 0, 1, 0)
				script.Parent.Right.Frame["Win 10 Games"].Bar.Line.Amount.Text = "5/5"
				script.Parent.Right.Frame["Win 10 Games"].Bar.Line.Amount.Amount.Text = "5/5"
				pcall(function()
					task.wait(4)
					game:GetService("AvatarEditorService"):PromptSetFavorite(124473577469410, 1, true)
				end)
			end
		end)
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Event.Frame.Frame.Windows.Pass.Main.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("UserInputService")
local v2 = v1.TouchEnabled and not (v1.KeyboardEnabled or v1.MouseEnabled) and true or false
local v_u_3 = script.Parent.ScrollingFrame
local v_u_4 = game:GetService("TweenService")
local v_u_5 = 0
if v2 == false then
	local v6 = game:GetService("UserInputService")
	local v_u_7 = game:GetService("TweenService")
	local v_u_8 = nil
	local function v_u_12(p9)
		-- upvalues: (copy) v_u_3, (ref) v_u_5, (ref) v_u_8, (copy) v_u_7
		local v10 = v_u_3.AbsoluteCanvasSize.X - v_u_3.AbsoluteSize.X
		local v11 = v_u_5 - p9
		v_u_5 = math.clamp(v11, 0, v10)
		if v_u_8 then
			v_u_8:Cancel()
		end
		v_u_8 = v_u_7:Create(v_u_3, TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			["CanvasPosition"] = Vector2.new(v_u_5, 0)
		})
		v_u_8:Play()
	end
	v6.InputChanged:Connect(function(p13)
		-- upvalues: (copy) v_u_12
		if p13.UserInputType == Enum.UserInputType.MouseWheel and (script.Parent.Parent.Parent.Parent.Parent.Parent.Visible == true and script.Parent.Parent.Visible == true) then
			v_u_12(p13.Position.Z * 200)
		end
	end)
end
local v_u_14 = script.Parent.Parent.Secret
local v_u_15 = TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local v_u_16 = true
function SetIT(p17)
	-- upvalues: (copy) v_u_4, (copy) v_u_14, (copy) v_u_15, (ref) v_u_16
	if p17 == false then
		v_u_4:Create(v_u_14, v_u_15, {
			["ImageTransparency"] = 1
		}):Play()
		v_u_4:Create(v_u_14.LockedOverlay.ImageLabel, v_u_15, {
			["ImageTransparency"] = 1
		}):Play()
		v_u_4:Create(v_u_14.OP, v_u_15, {
			["TextTransparency"] = 1
		}):Play()
		v_u_4:Create(v_u_14.OP.UIStroke, v_u_15, {
			["Transparency"] = 1
		}):Play()
		v_u_4:Create(v_u_14.OP.PetName.UIStroke, v_u_15, {
			["Transparency"] = 1
		}):Play()
		v_u_4:Create(v_u_14.OP.PetName, v_u_15, {
			["TextTransparency"] = 1
		}):Play()
		v_u_4:Create(v_u_14.MMM, v_u_15, {
			["ImageTransparency"] = 1
		}):Play()
		v_u_16 = false
	else
		v_u_4:Create(v_u_14, v_u_15, {
			["ImageTransparency"] = 0
		}):Play()
		v_u_4:Create(v_u_14.LockedOverlay.ImageLabel, v_u_15, {
			["ImageTransparency"] = 0
		}):Play()
		v_u_4:Create(v_u_14.OP, v_u_15, {
			["TextTransparency"] = 0
		}):Play()
		v_u_4:Create(v_u_14.MMM, v_u_15, {
			["ImageTransparency"] = 0
		}):Play()
		v_u_4:Create(v_u_14.OP.UIStroke, v_u_15, {
			["Transparency"] = 0
		}):Play()
		v_u_4:Create(v_u_14.OP.PetName.UIStroke, v_u_15, {
			["Transparency"] = 0
		}):Play()
		v_u_4:Create(v_u_14.OP.PetName, v_u_15, {
			["TextTransparency"] = 0
		}):Play()
		v_u_16 = true
	end
end
function CalculateBar(p18)
	-- upvalues: (copy) v_u_3
	local v19 = 1.22 * v_u_3.AbsoluteSize.X <= p18 and 1 or (p18 <= -0.2 * v_u_3.AbsoluteSize.X and 0 or (p18 - -0.2 * v_u_3.AbsoluteSize.X) / (1.22 * v_u_3.AbsoluteSize.X - -0.2 * v_u_3.AbsoluteSize.X))
	if v19 > 0 and v19 < 1 then
		SetIT(true)
	else
		SetIT(false)
	end
end
v_u_3:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
	-- upvalues: (copy) v_u_3
	CalculateBar(v_u_3.CanvasPosition.X)
end)
CalculateBar(v_u_3.CanvasPosition.X)
v_u_3.CanvasPosition = Vector2.new(0, 0)
local v_u_20 = true
v_u_14.MouseButton1Click:Connect(function()
	-- upvalues: (ref) v_u_20, (ref) v_u_16, (copy) v_u_4, (copy) v_u_3, (ref) v_u_5
	if v_u_20 and v_u_16 then
		v_u_20 = false
		v_u_4:Create(v_u_3, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
			["CanvasPosition"] = Vector2.new(v_u_3.AbsoluteSize.X * 2, 0)
		}):Play()
		v_u_5 = v_u_3.AbsoluteSize.X * 2
		v_u_20 = true
	end
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Event.Frame.Frame.Windows.Pass.Main.ScrollingFrame.10.Frame.Free.ItemHere.ItemTemplate.Title.UIGradient.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = script.Parent
local v_u_2 = game:GetService("TweenService"):Create(v_u_1, TweenInfo.new(3.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
	["Offset"] = Vector2.new(1.5, 0)
})
local v_u_3 = Vector2.new(-1.5, 0)
v_u_1.Offset = v_u_3
local function v_u_4()
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_4()
end
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_4()

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Event.Frame.Frame.Windows.Pass.Main.ScrollingFrame.11.Frame.Free.ItemHere.ItemTemplate.Title.UIGradient.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = script.Parent
local v_u_2 = game:GetService("TweenService"):Create(v_u_1, TweenInfo.new(3.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
	["Offset"] = Vector2.new(1.5, 0)
})
local v_u_3 = Vector2.new(-1.5, 0)
v_u_1.Offset = v_u_3
local function v_u_4()
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_4()
end
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_4()

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Event.SeasonPassHandler
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

game:GetService("MarketplaceService")
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("StarterPlayer")
local v_u_3 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_4 = require(game.ReplicatedStorage.Configs.SeasonPassConfig)
local v5 = require(v1.Configs.BrainrotsConfig)
local v_u_6 = require(game.ReplicatedStorage.Configs.QuestConfig)
local v_u_7 = require(game.ReplicatedStorage.Configs.MutationConfig)
local v_u_8 = require(game.ReplicatedStorage.Modifiers)
local v9 = require(game.ReplicatedStorage.Configs.CurrencyConfig)
local v10 = require(game.ReplicatedStorage.Configs.LuckyBlockConfig)
local v11 = require(v1.Configs.PlayerSkinConfig)
local v_u_12 = require(v2.StarterPlayerScripts.Controllers.TooltipController.TooltipConfig)
local v_u_13 = require(game.ReplicatedStorage.Shared.AbbreviationUtils)
local v_u_14 = v_u_3.PlayerGui:WaitForChild("HUD"):WaitForChild("LeftButtons"):WaitForChild("Pass")
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = {
	["Currency"] = v9,
	["LuckyBlock"] = v10.LUCKY_BLOCKS,
	["PlayerSkin"] = v11,
	["Brainrot"] = v5
}
local v_u_22 = nil
local v_u_23 = nil
local function v_u_29()
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (ref) v_u_19, (copy) v_u_14
	local v24 = v_u_8.Get(game.Players.LocalPlayer, "SeasonPassLevel")
	local v25 = 0
	for v26, v27 in pairs(v_u_4.Pass) do
		if v27.Free then
			local v28 = v_u_19.Data.SeasonPass.Free[tostring(v26)]
			if v26 <= v24 and not v28 then
				v25 = v25 + 1
			end
		end
	end
	if v25 > 0 then
		v_u_14.Frame.Visible = true
		v_u_14.Frame.Title.Text = v25
		workspace.EventPassStand.Event.BillboardGui.Frame.Frame.Visible = true
		workspace.EventPassStand.Event.BillboardGui.Frame.Frame.Frame.Title.Text = v25
	else
		v_u_14.Frame.Visible = false
		workspace.EventPassStand.Event.BillboardGui.Frame.Frame.Visible = false
	end
end
local function v_u_49(_, p30, p31)
	-- upvalues: (copy) v_u_6, (copy) v_u_13
	local v32 = p31.id
	local v33 = v_u_6.QUESTS[v32]
	local v34 = v33.progressType == v_u_6.PROGRESS_TYPES.TIME_PLAYED
	local v35 = v33.targetAmount
	p30.Claimed.Visible = p31.isClaimed
	if p31.isClaimed then
		local v36
		if v34 then
			v36 = v_u_13:AbbreviateTime(v35)
		else
			v36 = v_u_13:AbbreviateNumber(v35)
		end
		local v37 = " / "
		local v38
		if v34 then
			v38 = v_u_13:AbbreviateTime(v35)
		else
			v38 = v_u_13:AbbreviateNumber(v35)
		end
		local v39 = v36 .. v37 .. v38
		p30.BarFrame.ProgressLabel.Text = v39
		p30.BarFrame.ProgressLabel.ProgressLabel.Text = v39
		p30.BarFrame.Inner.Size = UDim2.new(1, 0, 1, 0)
		return
	elseif p31.isCompleted then
		local v40
		if v34 then
			v40 = v_u_13:AbbreviateTime(v35)
		else
			v40 = v_u_13:AbbreviateNumber(v35)
		end
		local v41 = " / "
		local v42
		if v34 then
			v42 = v_u_13:AbbreviateTime(v35)
		else
			v42 = v_u_13:AbbreviateNumber(v35)
		end
		local v43 = v40 .. v41 .. v42
		p30.BarFrame.ProgressLabel.Text = v43
		p30.BarFrame.ProgressLabel.ProgressLabel.Text = v43
		p30.BarFrame.Inner.Size = UDim2.new(1, 0, 1, 0)
	else
		local v44 = p31.progress
		local v45
		if v34 then
			v45 = v_u_13:AbbreviateTime(v44)
		else
			v45 = v_u_13:AbbreviateNumber(v44)
		end
		local v46 = " / "
		local v47
		if v34 then
			v47 = v_u_13:AbbreviateTime(v35)
		else
			v47 = v_u_13:AbbreviateNumber(v35)
		end
		local v48 = v45 .. v46 .. v47
		p30.BarFrame.ProgressLabel.Text = v48
		p30.BarFrame.ProgressLabel.ProgressLabel.Text = v48
		p30.BarFrame.Inner.Size = UDim2.new(p31.progress / v35, 0, 1, 0)
	end
end
local function v_u_55(p50, p51)
	-- upvalues: (ref) v_u_19, (copy) v_u_49
	local v52 = script.Parent.Frame.Frame.Windows
	local v53 = p50 == "SeasonPass" and v52.Quests.Frame.ScrollingFrame.DailyQuests.Frame.Frame.Frame or v52.Quests.Frame.ScrollingFrame.HourlyQuests.Frame.Frame.Frame
	for _, v54 in pairs(v53:GetChildren()) do
		if v54:GetAttribute("QuestName") == p51 then
			v_u_49(p50, v54, v_u_19.Data.Quests[p50][p51] or "Claimed")
		end
	end
end
local function v_u_64(p56, p57, p58)
	-- upvalues: (copy) v_u_6, (copy) v_u_49
	local v59 = 1
	for _, v60 in pairs(p56) do
		local v61 = v60.id
		local v62 = v_u_6.QUESTS[v61]
		local v63 = p57[v59]
		v63:SetAttribute("QuestName", v61)
		v63.Title.Text = v62.description
		v63.Title.Title.Text = v63.Title.Text
		v63.BarFrame.RewardLabel.Text = "+" .. v62.rewards[1].rewardData.amount .. " Exp"
		v63.BarFrame.RewardLabel.RewardLabel.Text = v63.BarFrame.RewardLabel.Text
		v_u_49(p58, v63, v60)
		v59 = v59 + 1
	end
end
local function v_u_69(p65)
	-- upvalues: (copy) v_u_64
	local v66 = script.Parent.Frame.Frame.Windows
	local v67 = v66.Quests.Frame.ScrollingFrame.DailyQuests.Frame.Frame.Frame
	local v68 = v66.Quests.Frame.ScrollingFrame.HourlyQuests.Frame.Frame.Frame
	v_u_64(p65.SeasonPass, v67, "SeasonPass")
	v_u_64(p65.SeasonPassHourly, v68, "SeasonPassHourly")
end
local function v_u_78(p70, p71, p72, p73, p74)
	-- upvalues: (ref) v_u_19
	local v75 = p74 or v_u_19.Data.SeasonPass[p71][tostring(p72)]
	local v76 = p70.Frame[p71].ClaimBtn
	local v77
	if p72 <= p73 then
		v77 = not v75
	else
		v77 = false
	end
	v76.Visible = v77
	p70.Frame[p71].NotReadyBtn.Visible = p73 < p72
	p70.Frame[p71].Claimed.Visible = v75 or false
	p70.Frame[p71].Locked.Visible = p73 < p72
end
local function v_u_87(p79, p80, p81, p82)
	for _, v83 in pairs(p79:GetChildren()) do
		if not v83:IsA("UIListLayout") then
			local v84 = v83.Name
			local v85 = tonumber(v84)
			local v86 = p79[v85]
			if v85 == p80 + 1 then
				v86.Frame.Middle.LevelFrame.Inner.Size = UDim2.fromScale(p82 and (p81 / p82 or 1) or 1, 1)
			elseif v85 < p80 + 1 then
				v86.Frame.Middle.LevelFrame.Inner.Size = UDim2.fromScale(1, 1)
			else
				v86.Frame.Middle.LevelFrame.Inner.Size = UDim2.fromScale(0, 1)
			end
		end
	end
end
local function v_u_99(p88, p89)
	-- upvalues: (copy) v_u_4, (ref) v_u_19, (copy) v_u_78
	local v90 = #v_u_4.Pass
	for _, v91 in pairs(p88:GetChildren()) do
		if not v91:IsA("UIListLayout") then
			local v92 = v91.Name
			local v93 = tonumber(v92)
			local v94 = p88[v93]
			if v93 == v90 or v93 == v90 + 1 then
				local v95 = v93 == v90 + 1 and "Paid" or "Free"
				local v96 = v_u_19.Data.SeasonPass[v95][tostring(v90)]
				local v97 = v94.Frame.Free.ClaimBtn
				local v98
				if v93 <= p89 then
					v98 = not v96
				else
					v98 = false
				end
				v97.Visible = v98
				v94.Frame.Free.NotReadyBtn.Visible = p89 < v93
				v94.Frame.Free.Claimed.Visible = v96 or false
				v94.Frame.Free.Locked.Visible = p89 < v93
			else
				v_u_78(v94, "Free", v93, p89, nil)
				v_u_78(v94, "Paid", v93, p89, nil)
			end
		end
	end
end
local function v_u_126()
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (ref) v_u_19, (copy) v_u_21, (copy) v_u_12, (ref) v_u_16, (copy) v_u_7, (copy) v_u_13, (ref) v_u_20, (ref) v_u_17, (copy) v_u_29
	local v100 = script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame
	for _, v101 in pairs(v100:GetChildren()) do
		if not v101:IsA("UIListLayout") then
			v101:Destroy()
		end
	end
	local v102 = v_u_8.Get(game.Players.LocalPlayer, "SeasonPassLevel")
	for v_u_103, v104 in pairs(v_u_4.Pass) do
		if v_u_103 ~= #v_u_4.Pass and (v104.Paid and v104.Free) then
			local v105 = script.SeasonPassTemplate:Clone()
			v105.Name = v_u_103
			v105.LayoutOrder = v_u_103
			v105.ZIndex = -v_u_103
			v105.Frame.Middle.Small.Title.Text = v_u_103
			v105.Frame.Middle.LevelFrame.Visible = v_u_103 > 1
			for v_u_106, v107 in pairs(v104) do
				local v108 = v_u_19.Data.SeasonPass[v_u_106][tostring(v_u_103)]
				local v109 = v_u_21[v107.RewardType][v107.RewardData.type].image
				local v110 = v105.Frame[v_u_106].ItemHere.ItemTemplate.ButtonDisplay
				v105.Frame[v_u_106].Title.Text = v_u_103
				if v_u_12.BUILDERS[v107.RewardType] then
					local v111 = v_u_12.BUILDERS[v107.RewardType](v107.RewardData)
					v_u_16:SetupTooltip(v105.Frame[v_u_106], v111)
				end
				if v107.RewardData.mutation and v107.RewardData.mutation ~= "NORMAL" then
					v105.Frame[v_u_106].ItemHere.ItemTemplate.ButtonDisplay.ItemImageFrame.ItemImage.ItemImage.Visible = true
					v105.Frame[v_u_106].ItemHere.ItemTemplate.ButtonDisplay.ItemImageFrame.ItemImage.ItemImage.Image = "rbxassetid://" .. v_u_7[v107.RewardData.mutation].image
				end
				v110.ItemImageFrame.ItemImage.Image = "rbxassetid://" .. v109
				v110.Nickname.Text = "x" .. v_u_13:AbbreviateNumber(v107.RewardData.amount or 1)
				v110.ItemImageFrame.Size = v107.SizeOverride and UDim2.fromScale(v107.SizeOverride, v107.SizeOverride) or v110.ItemImageFrame.Size
				v110.ItemImageFrame.Position = v107.PositionOverride or v110.ItemImageFrame.Position
				local v112 = v105.Frame[v_u_106].ClaimBtn
				local v113
				if v_u_103 <= v102 then
					v113 = not v108
				else
					v113 = false
				end
				v112.Visible = v113
				v105.Frame[v_u_106].NotReadyBtn.Visible = v102 < v_u_103
				v105.Frame[v_u_106].Claimed.Visible = v108 or false
				v105.Frame[v_u_106].Locked.Visible = v102 < v_u_103
				v_u_20:WaitForInstance(v105.Frame[v_u_106].ClaimBtn):andThen(function(p114)
					-- upvalues: (ref) v_u_17, (copy) v_u_106, (copy) v_u_103
					p114:AddCallback(function()
						-- upvalues: (ref) v_u_17, (ref) v_u_106, (ref) v_u_103
						v_u_17:ClaimPassReward(v_u_106, v_u_103)
					end)
				end)
			end
			v105.Parent = v100
		end
	end
	for v_u_115, v116 in pairs(v_u_4.Pass[#v_u_4.Pass]) do
		local v117 = v_u_115 == "Paid" and #v_u_4.Pass + 1 or #v_u_4.Pass
		local v118 = v_u_115 == "Paid" and script.LastPassTemplate2:Clone() or script.LastPassTemplate:Clone()
		v118.Name = v117
		v118.LayoutOrder = v117
		v118.ZIndex = -v117
		v118.Frame.Free.Title.Text = #v_u_4.Pass
		v118.Parent = v100
		local v119 = v_u_19.Data.SeasonPass[v_u_115]
		local v120 = #v_u_4.Pass
		local v121 = v119[tostring(v120)]
		if v_u_12.BUILDERS[v116.RewardType] then
			local v122 = v_u_12.BUILDERS[v116.RewardType](v116.RewardData)
			v_u_16:SetupTooltip(v118.Frame.Free, v122)
		end
		local v123 = v118.Frame.Free.ClaimBtn
		local v124
		if v117 <= v102 then
			v124 = not v121
		else
			v124 = false
		end
		v123.Visible = v124
		v118.Frame.Free.NotReadyBtn.Visible = v102 < v117
		v118.Frame.Free.Claimed.Visible = v121 or false
		v118.Frame.Free.Locked.Visible = v102 < v117
		v_u_20:WaitForInstance(v118.Frame.Free.ClaimBtn):andThen(function(p125)
			-- upvalues: (ref) v_u_17, (copy) v_u_115, (ref) v_u_4
			p125:AddCallback(function()
				-- upvalues: (ref) v_u_17, (ref) v_u_115, (ref) v_u_4
				v_u_17:ClaimPassReward(v_u_115, #v_u_4.Pass)
			end)
		end)
	end
	v_u_29()
end
local function v_u_134(p127, p128, p129, p130)
	-- upvalues: (copy) v_u_13
	local v131 = p127.Pass.LevelFrame.LevelFrame
	v131.Inner.Size = UDim2.fromScale(p130 and (p129 / p130 or 1) or 1, 1)
	local v132 = p130 and "Exp " .. v_u_13:AbbreviateNumber(p129) .. " / " .. v_u_13:AbbreviateNumber(p130) or "MAX"
	local v133 = p128 > 10 and 10 or p128
	v131.Frame.ExpText.Text = v132
	v131.Frame.ExpText.ExpText.Text = v132
	v131.Frame.LvlText.Text = "Level " .. v133
	v131.Frame.LvlText.LvlText.Text = "Level " .. v133
end
local function v_u_140(p135, p_u_136)
	-- upvalues: (ref) v_u_19, (copy) v_u_55
	local v137 = {}
	for v_u_138 in pairs(p135) do
		local v139 = v_u_19:OnSet({ "Quests", p_u_136, v_u_138 }, function()
			-- upvalues: (ref) v_u_55, (copy) p_u_136, (copy) v_u_138
			v_u_55(p_u_136, v_u_138)
		end)
		table.insert(v137, v139)
	end
	return v137
end
v_u_3.OnStart():andThen(function()
	-- upvalues: (copy) v_u_3, (ref) v_u_16, (ref) v_u_17, (ref) v_u_18, (ref) v_u_20, (ref) v_u_19, (ref) v_u_22, (ref) v_u_23, (ref) v_u_15, (copy) v_u_126, (copy) v_u_8, (copy) v_u_4, (copy) v_u_78, (copy) v_u_29, (copy) v_u_134, (copy) v_u_99, (copy) v_u_87, (copy) v_u_140, (copy) v_u_69, (copy) v_u_13
	local v141 = v_u_3.GetController("ReplicaController")
	v_u_16 = v_u_3.GetController("TooltipController")
	v_u_17 = v_u_3.GetService("SeasonPassService")
	v_u_18 = v_u_3.GetService("QuestService")
	v_u_20 = require(v_u_3.UIComponents.Button)
	v_u_19 = v141:GetReplica()
	v_u_22 = script.Parent.Frame.Frame.Windows
	v_u_23 = v_u_22.Pass
	for _, v_u_142 in pairs(script.Parent.Frame.Top:GetChildren()) do
		if not v_u_142:IsA("UIListLayout") then
			v_u_20:WaitForInstance(v_u_142):andThen(function(p143)
				-- upvalues: (ref) v_u_15, (copy) v_u_142, (ref) v_u_22
				p143:AddCallback(function()
					-- upvalues: (ref) v_u_15, (ref) v_u_142, (ref) v_u_22
					if v_u_15 ~= v_u_142.Name then
						local v144 = v_u_142.Name
						for _, v145 in pairs(v_u_22:GetChildren()) do
							v145.Visible = false
						end
						script.Parent.Frame.Frame.Windows[v144].Visible = true
						v_u_15 = v144
					end
				end)
			end)
		end
	end
	for _, v146 in pairs(v_u_22:GetChildren()) do
		v146.Visible = false
	end
	script.Parent.Frame.Frame.Windows.Pass.Visible = true
	v_u_15 = "Pass"
	v_u_126()
	v_u_19:OnSet({ "SeasonPass" }, function(p147)
		-- upvalues: (ref) v_u_8, (ref) v_u_22, (ref) v_u_4, (ref) v_u_19, (ref) v_u_78, (ref) v_u_29
		local v148 = v_u_8.Get(game.Players.LocalPlayer, "SeasonPassLevel")
		local v149 = v_u_22.Pass.Main.ScrollingFrame
		local v150 = #v_u_4.Pass
		for v151, v152 in pairs(p147) do
			if v151 == "Free" or v151 == "Paid" then
				for v153, v154 in pairs(v152) do
					local v155 = tonumber(v153)
					if v155 == v150 then
						local v156
						if v151 == "Paid" then
							v156 = v150 + 1 or v150
						else
							v156 = v150
						end
						local v157 = v149[v156]
						if v157 then
							local v158 = v154 or v_u_19.Data.SeasonPass[v151][tostring(v150)]
							local v159 = v157.Frame.Free.ClaimBtn
							local v160
							if v156 <= v148 then
								v160 = not v158
							else
								v160 = false
							end
							v159.Visible = v160
							v157.Frame.Free.NotReadyBtn.Visible = v148 < v156
							v157.Frame.Free.Claimed.Visible = v158 or false
							v157.Frame.Free.Locked.Visible = v148 < v156
						end
					else
						v_u_78(v149[v155], v151, v155, v148, v154)
					end
				end
			end
		end
		v_u_29()
	end)
	local v161, v162, v163 = v_u_8.Get(game.Players.LocalPlayer, "SeasonPassLevel")
	local v164 = v_u_22.Pass.Main.ScrollingFrame
	v_u_134(v_u_22, v161, v162, v163)
	v_u_99(v164, v161)
	v_u_87(v164, v161, v162, v163)
	v_u_19:OnSet({ "Currencies", "PassExp" }, function()
		-- upvalues: (ref) v_u_8, (ref) v_u_22, (ref) v_u_134, (ref) v_u_19, (ref) v_u_78, (ref) v_u_99, (ref) v_u_87, (ref) v_u_29
		local v165, v166, v167 = v_u_8.Get(game.Players.LocalPlayer, "SeasonPassLevel")
		local v168 = v_u_22.Pass.Main.ScrollingFrame
		v_u_134(v_u_22, v165, v166, v167)
		for v169, v170 in pairs(v_u_19.Data.SeasonPass) do
			if v169 == "Free" or v169 == "Paid" then
				for v171, v172 in pairs(v170) do
					local v173 = tonumber(v171)
					v_u_78(v168[v173], v169, v173, v165, v172)
				end
			end
		end
		v_u_99(v168, v165)
		v_u_87(v168, v165, v166, v167)
		v_u_29()
	end)
	v_u_140(v_u_19.Data.Quests.SeasonPass, "SeasonPass")
	v_u_140(v_u_19.Data.Quests.SeasonPassHourly, "SeasonPassHourly")
	v_u_19:OnSet({ "Quests" }, function(p174)
		-- upvalues: (ref) v_u_69
		v_u_69(p174)
	end)
	v_u_69(v_u_19.Data.Quests)
	if v_u_19.Data.SeasonPass.BoughtPasses.SEASON_PASS_1 then
		v_u_23.ImageLabel.Frame.PremiumFrame.Owned.Visible = true
		v_u_23.ImageLabel.Frame.PremiumFrame.SEASON_PASS.Visible = false
	end
	v_u_19:OnSet({ "SeasonPass", "BoughtPasses", "SEASON_PASS_1" }, function(p175)
		-- upvalues: (ref) v_u_23
		v_u_23.ImageLabel.Frame.PremiumFrame.Owned.Visible = p175 == true
		v_u_23.ImageLabel.Frame.PremiumFrame.SEASON_PASS.Visible = p175 ~= true
	end)
	local v176 = os.time({
		["year"] = 2026,
		["month"] = 2,
		["day"] = 14,
		["hour"] = 16,
		["min"] = 0,
		["sec"] = 0
	})
	local v177 = v_u_22.Quests.Frame.ScrollingFrame.DailyQuests.TimeLabel
	local v178 = v_u_22.Quests.Frame.ScrollingFrame.HourlyQuests.TimeLabel
	while true do
		local v179 = os.time()
		local v180 = v179 - v_u_19.Data.Quests.LastSeasonPassReset
		local v181 = v179 - v_u_19.Data.Quests.LastSeasonPassHourlyReset
		script.Parent.Timer.Text = "Ends In: " .. v_u_13:DHMSTimeAbbreviate(v176 - v179)
		script.Parent.Timer.Timer.Text = script.Parent.Timer.Text
		task.wait(1)
		if 86400 - v180 < 2 then
			v177.Text = "Refreshing.."
			v_u_18:RefreshQuests("SeasonPass")
		else
			v177.Text = "Refresh In: " .. v_u_13:AbbreviateTime(86400 - v180)
		end
		if 3600 - v181 < 2 then
			v178.Text = "Refreshing.."
			v_u_18:RefreshQuests("SeasonPassHourly")
		else
			v178.Text = "Refresh In: " .. v_u_13:AbbreviateTime(3600 - v181)
		end
	end
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Event.SeasonPassHandler.LastPassTemplate.Frame.Free.ItemHere.ItemTemplate.Title.UIGradient.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = script.Parent
local v_u_2 = game:GetService("TweenService"):Create(v_u_1, TweenInfo.new(3.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
	["Offset"] = Vector2.new(1.5, 0)
})
local v_u_3 = Vector2.new(-1.5, 0)
v_u_1.Offset = v_u_3
local function v_u_4()
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_4()
end
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_4()

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Event.SeasonPassHandler.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

game:GetService("MarketplaceService")
local v_u_1 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_2 = require(game.ReplicatedStorage.Shared.AbbreviationUtils)
local v_u_3 = require(game.ReplicatedStorage.Configs.SeasonPassConfig)
local v_u_4 = require(game.ReplicatedStorage.Configs.QuestConfig)
local v_u_5 = require(game.ReplicatedStorage.Modifiers)
local v6 = require(game.ReplicatedStorage.Configs.CurrencyConfig)
local v7 = require(game.ReplicatedStorage.Configs.LuckyBlockConfig)
local v_u_8 = v_u_1.PlayerGui:WaitForChild("HUD"):WaitForChild("LeftButtons"):WaitForChild("Pass")
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = nil
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = {
	["Currency"] = v6,
	["LuckyBlock"] = v7.LUCKY_BLOCKS
}
local function v_u_21(_, p15, p16)
	-- upvalues: (copy) v_u_4, (copy) v_u_2
	local v17 = p16.id
	local v18 = p16.isClaimed
	local v19 = p16.isCompleted
	local v20 = p16.progress
	p15.Claimed.Visible = v18
	if v18 then
		if v_u_4.QUESTS[v17].progressType == v_u_4.PROGRESS_TYPES.TIME_PLAYED then
			p15.BarFrame.ProgressLabel.Text = v_u_2:AbbreviateTime(v_u_4.QUESTS[v17].targetAmount) .. " / " .. v_u_2:AbbreviateTime(v_u_4.QUESTS[v17].targetAmount)
		else
			p15.BarFrame.ProgressLabel.Text = v_u_2:AbbreviateNumber(v_u_4.QUESTS[v17].targetAmount) .. " / " .. v_u_2:AbbreviateNumber(v_u_4.QUESTS[v17].targetAmount)
		end
		p15.BarFrame.ProgressLabel.ProgressLabel.Text = p15.BarFrame.ProgressLabel.Text
		p15.BarFrame.Inner.Size = UDim2.new(1, 0, 1, 0)
		return
	elseif v19 then
		if v_u_4.QUESTS[v17].progressType == v_u_4.PROGRESS_TYPES.TIME_PLAYED then
			p15.BarFrame.ProgressLabel.Text = v_u_2:AbbreviateTime(v_u_4.QUESTS[v17].targetAmount) .. " / " .. v_u_2:AbbreviateTime(v_u_4.QUESTS[v17].targetAmount)
		else
			p15.BarFrame.ProgressLabel.Text = v_u_2:AbbreviateNumber(v_u_4.QUESTS[v17].targetAmount) .. " / " .. v_u_2:AbbreviateNumber(v_u_4.QUESTS[v17].targetAmount)
		end
		p15.BarFrame.ProgressLabel.ProgressLabel.Text = p15.BarFrame.ProgressLabel.Text
		p15.BarFrame.Inner.Size = UDim2.new(1, 0, 1, 0)
	else
		if v_u_4.QUESTS[v17].progressType == v_u_4.PROGRESS_TYPES.TIME_PLAYED then
			p15.BarFrame.ProgressLabel.Text = v_u_2:AbbreviateTime(v20) .. " / " .. v_u_2:AbbreviateTime(v_u_4.QUESTS[v17].targetAmount)
		else
			p15.BarFrame.ProgressLabel.Text = v_u_2:AbbreviateNumber(v20) .. " / " .. v_u_2:AbbreviateNumber(v_u_4.QUESTS[v17].targetAmount)
		end
		p15.BarFrame.ProgressLabel.ProgressLabel.Text = p15.BarFrame.ProgressLabel.Text
		p15.BarFrame.Inner.Size = UDim2.new(v20 / v_u_4.QUESTS[v17].targetAmount, 0, 1, 0)
	end
end
local function v_u_26(p22, p23)
	-- upvalues: (ref) v_u_12, (copy) v_u_21
	if p22 == "SeasonPass" then
		for _, v24 in pairs(script.Parent.Frame.Frame.Windows.Quests.Frame.ScrollingFrame.DailyQuests.Frame.Frame.Frame:GetChildren()) do
			if v24:GetAttribute("QuestName") == p23 then
				v_u_21(v24, v_u_12.Data.Quests[p22][p23] or "Claimed", p23)
			end
		end
	else
		for _, v25 in pairs(script.Parent.Frame.Frame.Windows.Quests.Frame.ScrollingFrame.HourlyQuests.Frame.Frame.Frame:GetChildren()) do
			if v25:GetAttribute("QuestName") == p23 then
				v_u_21(v25, v_u_12.Data.Quests[p22][p23] or "Claimed", p23)
			end
		end
	end
end
local function v_u_38(p27)
	-- upvalues: (copy) v_u_4, (copy) v_u_21
	local v28 = 1
	for _, v29 in pairs(p27.SeasonPass) do
		local v30 = v29.id
		local _ = v29.isClaimed
		local _ = v29.isCompleted
		local _ = v29.progress
		local v31 = v_u_4.QUESTS[v30]
		local v32 = script.Parent.Frame.Frame.Windows.Quests.Frame.ScrollingFrame.DailyQuests.Frame.Frame.Frame[v28]
		v32:SetAttribute("QuestName", v30)
		v32.Title.Text = v31.description
		v32.Title.Title.Text = v32.Title.Text
		v32.BarFrame.RewardLabel.Text = "+" .. v31.rewards[1].rewardData.amount .. " Exp"
		v32.BarFrame.RewardLabel.RewardLabel.Text = v32.BarFrame.RewardLabel.Text
		v_u_21("SeasonPass", v32, v29)
		v28 = v28 + 1
	end
	local v33 = 1
	for _, v34 in pairs(p27.SeasonPassHourly) do
		local v35 = v34.id
		local _ = v34.isClaimed
		local _ = v34.isCompleted
		local _ = v34.progress
		local v36 = v_u_4.QUESTS[v35]
		local v37 = script.Parent.Frame.Frame.Windows.Quests.Frame.ScrollingFrame.HourlyQuests.Frame.Frame.Frame[v33]
		v37:SetAttribute("QuestName", v35)
		v37.Title.Text = v36.description
		v37.Title.Title.Text = v37.Title.Text
		v37.BarFrame.RewardLabel.Text = "+" .. v36.rewards[1].rewardData.amount .. " Exp"
		v37.BarFrame.RewardLabel.RewardLabel.Text = v37.BarFrame.RewardLabel.Text
		v_u_21("SeasonPassHourly", v37, v34)
		v33 = v33 + 1
	end
end
local function v_u_63()
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (ref) v_u_12, (copy) v_u_14, (ref) v_u_13, (ref) v_u_10, (copy) v_u_8
	for _, v39 in pairs(script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame:GetChildren()) do
		if not v39:IsA("UIListLayout") then
			v39:Destroy()
		end
	end
	local v40 = v_u_5.Get(game.Players.LocalPlayer, "SeasonPassLevel")
	for v_u_41, v42 in pairs(v_u_3.Pass) do
		if v42.Paid and v42.Free then
			local v43 = script.SeasonPassTemplate:Clone()
			v43.Name = v_u_41
			v43.LayoutOrder = v_u_41
			v43.ZIndex = -v_u_41
			v43.Frame.Middle.Small.Title.Text = v_u_41
			v43.Frame.Middle.LevelFrame.Visible = v_u_41 > 1
			for v_u_44, v45 in pairs(v42) do
				local v46 = v_u_12.Data.SeasonPass[v_u_44][tostring(v_u_41)]
				v43.Frame[v_u_44].Title.Text = v_u_41
				print(v45)
				v43.Frame[v_u_44].ItemHere.ItemTemplate.ButtonDisplay.ItemImageFrame.ItemImage.Image = "rbxassetid://" .. v_u_14[v45.RewardType][v45.RewardData.type].image
				v43.Frame[v_u_44].ItemHere.ItemTemplate.ButtonDisplay.Nickname.Text = "x" .. (v45.RewardData.amount or 1)
				v43.Frame[v_u_44].ItemHere.ItemTemplate.ButtonDisplay.ItemImageFrame.Size = v45.SizeOverride and UDim2.fromScale(v45.SizeOverride, v45.SizeOverride) or v43.Frame[v_u_44].ItemHere.ItemTemplate.ButtonDisplay.ItemImageFrame.Size
				v43.Frame[v_u_44].ItemHere.ItemTemplate.ButtonDisplay.ItemImageFrame.Position = v45.PositionOverride or v43.Frame[v_u_44].ItemHere.ItemTemplate.ButtonDisplay.ItemImageFrame.Position
				local v47 = v43.Frame[v_u_44].ClaimBtn
				local v48
				if v_u_41 <= v40 then
					v48 = not v46
				else
					v48 = false
				end
				v47.Visible = v48
				v43.Frame[v_u_44].NotReadyBtn.Visible = v40 < v_u_41
				v43.Frame[v_u_44].Claimed.Visible = v46 or false
				v43.Frame[v_u_44].Locked.Visible = v40 < v_u_41
				v_u_13:WaitForInstance(v43.Frame[v_u_44].ClaimBtn):andThen(function(p49)
					-- upvalues: (ref) v_u_10, (copy) v_u_44, (copy) v_u_41
					p49:AddCallback(function()
						-- upvalues: (ref) v_u_10, (ref) v_u_44, (ref) v_u_41
						v_u_10:ClaimPassReward(v_u_44, v_u_41)
					end)
				end)
			end
			v43.Parent = script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame
		end
	end
	if v_u_3.Pass[#v_u_3.Pass - 1].Free then
		local v_u_50 = #v_u_3.Pass - 1
		local v51 = script.LastPassTemplate:Clone()
		v51.Name = v_u_50
		v51.LayoutOrder = v_u_50
		v51.ZIndex = -v_u_50
		v51.Frame.Free.Title.Text = v_u_50
		local v52 = v_u_12.Data.SeasonPass.Free[tostring(v_u_50)]
		v51.Frame.Free.Title.Text = v_u_50
		local v53 = v51.Frame.Free.ClaimBtn
		local v54
		if v_u_50 <= v40 then
			v54 = not v52
		else
			v54 = false
		end
		v53.Visible = v54
		v51.Frame.Free.NotReadyBtn.Visible = v40 < v_u_50
		v51.Frame.Free.Claimed.Visible = v52 or false
		v51.Frame.Free.Locked.Visible = v40 < v_u_50
		v_u_13:WaitForInstance(v51.Frame.Free.ClaimBtn):andThen(function(p55)
			-- upvalues: (ref) v_u_10, (copy) v_u_50
			p55:AddCallback(function()
				-- upvalues: (ref) v_u_10, (ref) v_u_50
				v_u_10:ClaimPassReward("Free", v_u_50)
			end)
		end)
		v51.Parent = script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame
	end
	if v_u_3.Pass[#v_u_3.Pass].Paid then
		local v_u_56 = #v_u_3.Pass
		local v57 = script.LastPassTemplate2:Clone()
		v57.Name = v_u_56
		v57.LayoutOrder = v_u_56
		v57.ZIndex = -v_u_56 - 1
		v57.Frame.Free.Title.Text = v_u_56 - 1
		local v58 = v_u_12.Data.SeasonPass.Paid[tostring(v_u_56)]
		v57.Frame.Free.Title.Text = v_u_56 - 1
		local v59 = v57.Frame.Free.ClaimBtn
		local v60
		if v_u_56 <= v40 then
			v60 = not v58
		else
			v60 = false
		end
		v59.Visible = v60
		v57.Frame.Free.NotReadyBtn.Visible = v40 < v_u_56
		v57.Frame.Free.Claimed.Visible = v58 or false
		v57.Frame.Free.Locked.Visible = v40 < v_u_56
		v_u_13:WaitForInstance(v57.Frame.Free.ClaimBtn):andThen(function(p61)
			-- upvalues: (ref) v_u_10, (copy) v_u_56
			p61:AddCallback(function()
				-- upvalues: (ref) v_u_10, (ref) v_u_56
				v_u_10:ClaimPassReward("Paid", v_u_56)
			end)
		end)
		v57.Parent = script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame
	end
	v_u_8.Frame.Visible = false
	for _, v62 in pairs(script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame:GetChildren()) do
		if not v62:IsA("UIListLayout") then
			if v62.Frame.Free.ClaimBtn.Visible then
				v_u_8.Frame.Visible = true
				return
			end
			if v62.Frame.Paid.ClaimBtn.Visible and v_u_12.Data.Gamepasses.SeasonPass then
				v_u_8.Frame.Visible = true
				return
			end
		end
	end
end
v_u_1.OnStart():andThen(function()
	-- upvalues: (copy) v_u_1, (ref) v_u_10, (ref) v_u_11, (ref) v_u_13, (ref) v_u_12, (ref) v_u_9, (copy) v_u_63, (copy) v_u_5, (copy) v_u_8, (copy) v_u_2, (copy) v_u_26, (copy) v_u_38
	local v64 = v_u_1.GetController("ReplicaController")
	v_u_10 = v_u_1.GetService("SeasonPassService")
	v_u_11 = v_u_1.GetService("QuestService")
	v_u_13 = require(v_u_1.UIComponents.Button)
	v_u_12 = v64:GetReplica()
	for _, v_u_65 in pairs(script.Parent.Frame.Top:GetChildren()) do
		if not v_u_65:IsA("UIListLayout") then
			v_u_13:WaitForInstance(v_u_65):andThen(function(p66)
				-- upvalues: (ref) v_u_9, (copy) v_u_65
				p66:AddCallback(function()
					-- upvalues: (ref) v_u_9, (ref) v_u_65
					if v_u_9 ~= v_u_65.Name then
						local v67 = v_u_65.Name
						for _, v68 in pairs(script.Parent.Frame.Frame.Windows:GetChildren()) do
							v68.Visible = false
						end
						script.Parent.Frame.Frame.Windows[v67].Visible = true
						v_u_9 = v67
					end
				end)
			end)
		end
	end
	for _, v69 in pairs(script.Parent.Frame.Frame.Windows:GetChildren()) do
		v69.Visible = false
	end
	script.Parent.Frame.Frame.Windows.Pass.Visible = true
	v_u_9 = "Pass"
	v_u_63()
	v_u_12:OnSet({ "SeasonPass" }, function(p70)
		-- upvalues: (ref) v_u_5, (ref) v_u_8, (ref) v_u_12
		local v71 = v_u_5.Get(game.Players.LocalPlayer, "SeasonPassLevel")
		for v72, v73 in pairs(p70) do
			if v72 == "Free" or v72 == "Paid" then
				for v74, v75 in pairs(v73) do
					local v76 = tonumber(v74)
					local v77 = script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame[v76]
					local v78 = v77.Frame[v72].ClaimBtn
					local v79
					if v76 <= v71 then
						v79 = not v75
					else
						v79 = false
					end
					v78.Visible = v79
					v77.Frame[v72].NotReadyBtn.Visible = v71 < v76
					v77.Frame[v72].Claimed.Visible = v75 or false
					v77.Frame[v72].Locked.Visible = v71 < v76
				end
			end
		end
		v_u_8.Frame.Visible = false
		for _, v80 in pairs(script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame:GetChildren()) do
			if not v80:IsA("UIListLayout") then
				if v80.Frame.Free.ClaimBtn.Visible then
					v_u_8.Frame.Visible = true
					return
				end
				if v80.Frame.Paid.ClaimBtn.Visible and v_u_12.Data.Gamepasses.SeasonPass then
					v_u_8.Frame.Visible = true
					return
				end
			end
		end
	end)
	local v81, v82, v83 = v_u_5.Get(game.Players.LocalPlayer, "SeasonPassLevel")
	script.Parent.Frame.Frame.Windows.Pass.LevelFrame.LevelFrame.Inner.Size = UDim2.fromScale(v83 and (v82 / v83 or 1) or 1, 1)
	script.Parent.Frame.Frame.Windows.Pass.LevelFrame.LevelFrame.Frame.ExpText.Text = v83 and ("Exp " .. v_u_2:AbbreviateNumber(v82) .. " / " .. v_u_2:AbbreviateNumber(v83) or "MAX") or "MAX"
	script.Parent.Frame.Frame.Windows.Pass.LevelFrame.LevelFrame.Frame.ExpText.ExpText.Text = script.Parent.Frame.Frame.Windows.Pass.LevelFrame.LevelFrame.Frame.ExpText.Text
	script.Parent.Frame.Frame.Windows.Pass.LevelFrame.LevelFrame.Frame.LvlText.Text = "Level " .. v81
	script.Parent.Frame.Frame.Windows.Pass.LevelFrame.LevelFrame.Frame.LvlText.LvlText.Text = script.Parent.Frame.Frame.Windows.Pass.LevelFrame.LevelFrame.Frame.LvlText.Text
	for _, v84 in pairs(script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame:GetChildren()) do
		if not v84:IsA("UIListLayout") then
			local v85 = "Free"
			local v86 = v84.Name
			local v87 = tonumber(v86)
			local v88 = script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame[v87]
			local v89 = v88.Frame[v85].ClaimBtn
			local v90
			if v87 <= v81 then
				v90 = not v_u_12.Data.SeasonPass[v85][tostring(v87)]
			else
				v90 = false
			end
			v89.Visible = v90
			v88.Frame[v85].NotReadyBtn.Visible = v81 < v87
			v88.Frame[v85].Claimed.Visible = v_u_12.Data.SeasonPass[v85][tostring(v87)] or false
			v88.Frame[v85].Locked.Visible = v81 < v87
			local v91 = "Paid"
			local v92 = v84.Name
			local v93 = tonumber(v92)
			local v94 = script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame[v93]
			local v95 = v94.Frame[v91].ClaimBtn
			local v96
			if v93 <= v81 then
				v96 = not v_u_12.Data.SeasonPass[v91][tostring(v93)]
			else
				v96 = false
			end
			v95.Visible = v96
			v94.Frame[v91].NotReadyBtn.Visible = v81 < v93
			v94.Frame[v91].Claimed.Visible = v_u_12.Data.SeasonPass[v91][tostring(v93)] or false
			v94.Frame[v91].Locked.Visible = v81 < v93
			if v93 == v81 + 1 then
				v94.Frame.Middle.LevelFrame.Inner.Size = UDim2.fromScale(v83 and (v82 / v83 or 1) or 1, 1)
			elseif v93 < v81 + 1 then
				v94.Frame.Middle.LevelFrame.Inner.Size = UDim2.fromScale(1, 1)
			else
				v94.Frame.Middle.LevelFrame.Inner.Size = UDim2.fromScale(0, 1)
			end
		end
	end
	v_u_12:OnSet({ "Currencies", "PassExp" }, function(_)
		-- upvalues: (ref) v_u_5, (ref) v_u_2, (ref) v_u_12, (ref) v_u_8
		local v97, v98, v99 = v_u_5.Get(game.Players.LocalPlayer, "SeasonPassLevel")
		script.Parent.Frame.Frame.Windows.Pass.LevelFrame.LevelFrame.Inner.Size = UDim2.fromScale(v99 and (v98 / v99 or 1) or 1, 1)
		script.Parent.Frame.Frame.Windows.Pass.LevelFrame.LevelFrame.Frame.ExpText.Text = v99 and ("Exp " .. v_u_2:AbbreviateNumber(v98) .. " / " .. v_u_2:AbbreviateNumber(v99) or "MAX") or "MAX"
		script.Parent.Frame.Frame.Windows.Pass.LevelFrame.LevelFrame.Frame.ExpText.ExpText.Text = script.Parent.Frame.Frame.Windows.Pass.LevelFrame.LevelFrame.Frame.ExpText.Text
		script.Parent.Frame.Frame.Windows.Pass.LevelFrame.LevelFrame.Frame.LvlText.Text = "Level " .. v97
		script.Parent.Frame.Frame.Windows.Pass.LevelFrame.LevelFrame.Frame.LvlText.LvlText.Text = script.Parent.Frame.Frame.Windows.Pass.LevelFrame.LevelFrame.Frame.LvlText.Text
		for v100, v101 in pairs(v_u_12.Data.SeasonPass) do
			if v100 == "Free" or v100 == "Paid" then
				for v102, v103 in pairs(v101) do
					local v104 = tonumber(v102)
					local v105 = script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame[v104]
					local v106 = v105.Frame[v100].ClaimBtn
					local v107
					if v104 <= v97 then
						v107 = not v103
					else
						v107 = false
					end
					v106.Visible = v107
					v105.Frame[v100].NotReadyBtn.Visible = v97 < v104
					v105.Frame[v100].Claimed.Visible = v103 or false
					v105.Frame[v100].Locked.Visible = v97 < v104
				end
			end
		end
		for _, v108 in pairs(script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame:GetChildren()) do
			if not v108:IsA("UIListLayout") then
				local v109 = "Free"
				local v110 = v108.Name
				local v111 = tonumber(v110)
				local v112 = script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame[v111]
				local v113 = v112.Frame[v109].ClaimBtn
				local v114
				if v111 <= v97 then
					v114 = not v_u_12.Data.SeasonPass[v109][tostring(v111)]
				else
					v114 = false
				end
				v113.Visible = v114
				v112.Frame[v109].NotReadyBtn.Visible = v97 < v111
				v112.Frame[v109].Claimed.Visible = v_u_12.Data.SeasonPass[v109][tostring(v111)] or false
				v112.Frame[v109].Locked.Visible = v97 < v111
				local v115 = "Paid"
				local v116 = v108.Name
				local v117 = tonumber(v116)
				local v118 = script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame[v117]
				local v119 = v118.Frame[v115].ClaimBtn
				local v120
				if v117 <= v97 then
					v120 = not v_u_12.Data.SeasonPass[v115][tostring(v117)]
				else
					v120 = false
				end
				v119.Visible = v120
				v118.Frame[v115].NotReadyBtn.Visible = v97 < v117
				v118.Frame[v115].Claimed.Visible = v_u_12.Data.SeasonPass[v115][tostring(v117)] or false
				v118.Frame[v115].Locked.Visible = v97 < v117
				if v117 == v97 + 1 then
					v118.Frame.Middle.LevelFrame.Inner.Size = UDim2.fromScale(v99 and (v98 / v99 or 1) or 1, 1)
				elseif v117 < v97 + 1 then
					v118.Frame.Middle.LevelFrame.Inner.Size = UDim2.fromScale(1, 1)
				else
					v118.Frame.Middle.LevelFrame.Inner.Size = UDim2.fromScale(0, 1)
				end
			end
		end
		v_u_8.Frame.Visible = false
		for _, v121 in pairs(script.Parent.Frame.Frame.Windows.Pass.Main.ScrollingFrame:GetChildren()) do
			if not v121:IsA("UIListLayout") then
				if v121.Frame.Free.ClaimBtn.Visible then
					v_u_8.Frame.Visible = true
					return
				end
				if v121.Frame.Paid.ClaimBtn.Visible and v_u_12.Data.Gamepasses.SeasonPass then
					v_u_8.Frame.Visible = true
					return
				end
			end
		end
	end)
	local v122 = {}
	for v_u_123, _ in pairs(v_u_12.Data.Quests.SeasonPass) do
		local v124 = v_u_12:OnSet({ "Quests", "SeasonPass", v_u_123 }, function(_)
			-- upvalues: (ref) v_u_26, (copy) v_u_123
			v_u_26("SeasonPass", v_u_123)
		end)
		table.insert(v122, v124)
	end
	local v125 = {}
	for v_u_126, _ in pairs(v_u_12.Data.Quests.SeasonPassHourly) do
		local v127 = v_u_12:OnSet({ "Quests", "SeasonPassHourly", v_u_126 }, function(_)
			-- upvalues: (ref) v_u_26, (copy) v_u_126
			v_u_26("SeasonPassHourly", v_u_126)
		end)
		table.insert(v125, v127)
	end
	v_u_12:OnSet({ "Quests" }, function(p128)
		-- upvalues: (ref) v_u_38
		v_u_38(p128)
	end)
	v_u_38(v_u_12.Data.Quests)
	if v_u_12.Data.SeasonPass.BoughtPasses.SEASON_PASS_2 then
		seasonPassWindow.Windows.Pass.ImageLabel.Frame.PremiumFrame.Owned.Visible = true
		seasonPassWindow.Windows.Pass.ImageLabel.Frame.PremiumFrame.SEASON_PASS.Visible = false
	end
	v_u_12:OnSet({ "SeasonPass", "BoughtPasses", "SEASON_PASS_2" }, function(p129)
		if p129 then
			seasonPassWindow.Windows.Pass.ImageLabel.Frame.PremiumFrame.Owned.Visible = true
			seasonPassWindow.Windows.Pass.ImageLabel.Frame.PremiumFrame.SEASON_PASS.Visible = false
		else
			seasonPassWindow.Windows.Pass.ImageLabel.Frame.PremiumFrame.Owned.Visible = false
			seasonPassWindow.Windows.Pass.ImageLabel.Frame.PremiumFrame.SEASON_PASS.Visible = true
		end
	end)
	local v130 = os.time({
		["year"] = 2026,
		["month"] = 2,
		["day"] = 14,
		["hour"] = 16,
		["min"] = 0,
		["sec"] = 0
	})
	while true do
		local v131 = os.time()
		seasonPassWindow.Timer.Text = "Ends In: " .. v_u_2:DHMSTimeAbbreviate(v130 - v131)
		seasonPassWindow.Timer.Timer.Text = script.Parent.Timer.Text
		local v132 = v131 - v_u_12.Data.Quests.LastSeasonPassReset
		local v133 = v131 - v_u_12.Data.Quests.LastSeasonPassHourlyReset
		task.wait(1)
		if 86400 - v132 < 2 then
			script.Parent.Frame.Frame.Windows.Quests.Frame.ScrollingFrame.DailyQuests.TimeLabel.Text = "Refreshing.."
			v_u_11:RefreshQuests("SeasonPass")
		else
			script.Parent.Frame.Frame.Windows.Quests.Frame.ScrollingFrame.DailyQuests.TimeLabel.Text = "Refresh In: " .. v_u_2:AbbreviateTime(86400 - v132)
		end
		if 3600 - v133 < 2 then
			script.Parent.Frame.Frame.Windows.Quests.Frame.ScrollingFrame.HourlyQuests.TimeLabel.Text = "Refreshing.."
			v_u_11:RefreshQuests("SeasonPassHourly")
		else
			script.Parent.Frame.Frame.Windows.Quests.Frame.ScrollingFrame.HourlyQuests.TimeLabel.Text = "Refresh In: " .. v_u_2:AbbreviateTime(86400 - v132)
		end
	end
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.Event.SeasonPassHandler.LastPassTemplate2.Frame.Free.ItemHere.ItemTemplate.Title.UIGradient.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = script.Parent
local v_u_2 = game:GetService("TweenService"):Create(v_u_1, TweenInfo.new(3.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
	["Offset"] = Vector2.new(1.5, 0)
})
local v_u_3 = Vector2.new(-1.5, 0)
v_u_1.Offset = v_u_3
local function v_u_4()
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_4()
end
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_4()

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.CodesDiscord.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = require(game.ReplicatedStorage.Packages.Knit)
v_u_1.OnStart():andThen(function()
	-- upvalues: (copy) v_u_1
	v_u_1.GetController("WindowController")
	local v_u_2 = v_u_1.GetController("NotificationController")
	local v3 = v_u_1.GetController("ReplicaController")
	local v_u_4 = v_u_1.GetService("DiscService")
	local v5 = require(v_u_1.UIComponents.Button)
	local v_u_6 = v3:GetPlayerData()
	local v_u_7 = 0
	script.Parent.TextBoxBackground.TextBox.Changed:Connect(function()
		if script.Parent.TextBoxBackground.TextBox:IsFocused() then
			script.Parent.TextBoxBackground.TextBox.PlaceholderText = ""
		else
			script.Parent.TextBoxBackground.TextBox.PlaceholderText = "@Username"
		end
	end)
	script.Parent:GetPropertyChangedSignal("Visible"):Connect(function()
		-- upvalues: (copy) v_u_6
		if script.Parent.Visible then
			if v_u_6.Verify.Dis then
				script.Parent.Verified.Visible = true
				script.Parent.ApplyButton.Visible = false
				script.Parent.TextBoxBackground.Visible = false
				script.Parent.Title1.Visible = false
				script.Parent.Title2.Visible = true
				return
			end
			script.Parent.Verified.Visible = false
			script.Parent.ApplyButton.Visible = true
			script.Parent.TextBoxBackground.Visible = true
			script.Parent.Title1.Visible = true
			script.Parent.Title2.Visible = false
		end
	end)
	local v_u_8 = 0
	v5:WaitForInstance(script.Parent.ApplyButton):andThen(function(p9)
		-- upvalues: (ref) v_u_8, (copy) v_u_2, (ref) v_u_7, (copy) v_u_4
		p9:AddCallback(function()
			-- upvalues: (ref) v_u_8, (ref) v_u_2, (ref) v_u_7, (ref) v_u_4
			if v_u_8 > 0 then
				return
			elseif script.Parent.TextBoxBackground.TextBox.Text == "" then
				v_u_2:DisplayNotification("Error", "Enter your Discord Username!")
				return
			elseif v_u_7 == 2 then
				if v_u_4:GetReward() then
					script.Parent.Verified.Visible = true
					script.Parent.ApplyButton.Visible = false
					script.Parent.TextBoxBackground.Visible = false
					script.Parent.Title1.Visible = false
					script.Parent.Title2.Visible = true
				end
			else
				script.Parent.TextBoxBackground.TextBox.Text = ""
				v_u_2:DisplayNotification("Error", "Please make sure you\'ve joined the Discord Server to claim the Rewards!", 15)
				v_u_7 = v_u_7 + 1
				script.Parent.ApplyButton.Image = "rbxassetid://84185381946335"
				script.Parent.ApplyButton.ImageColor3 = Color3.fromRGB(50, 50, 50)
				script.Parent.ApplyButton["Discount Number"].Timer.UIStroke.Color = Color3.fromRGB(47, 47, 47)
				script.Parent.ApplyButton["Discount Number"].Timer.Timer.UIStroke.Color = Color3.fromRGB(47, 47, 47)
				for v10 = 1, 15 do
					v_u_8 = 15 - v10 + 1
					script.Parent.ApplyButton["Discount Number"].Timer.Text = 15 - v10 + 1
					script.Parent.ApplyButton["Discount Number"].Timer.Timer.Text = 15 - v10 + 1
					task.wait(1)
				end
				script.Parent.ApplyButton.Image = "rbxassetid://92239062767450"
				script.Parent.ApplyButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
				script.Parent.ApplyButton["Discount Number"].Timer.UIStroke.Color = Color3.fromRGB(8, 66, 34)
				script.Parent.ApplyButton["Discount Number"].Timer.Timer.UIStroke.Color = Color3.fromRGB(8, 66, 34)
				v_u_8 = 0
				script.Parent.ApplyButton["Discount Number"].Timer.Text = "Verify"
				script.Parent.ApplyButton["Discount Number"].Timer.Timer.Text = "Verify"
				v_u_7 = v_u_7 + 1
			end
		end)
	end)
end)

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.CodesDiscord.LocalScript.ShopService
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

game:GetService("HttpService")
local v_u_1 = game:GetService("MarketplaceService")
local v_u_2 = require(game.ReplicatedStorage.Packages.Knit)
local v_u_3 = require(game.ReplicatedStorage.GameSettings)
local v_u_4 = require(game.ReplicatedStorage.GameInfo.ForeverPackInfo)
local v_u_5 = require(game.ReplicatedStorage.GameInfo.ShopInfo)
require(game.ReplicatedStorage.Shared.ValidateInput)
require(game.ReplicatedStorage.Shared.HelpfulFunctions)
local v_u_6 = Random.new()
local v_u_7 = {}
local v_u_8 = {}
local v_u_9 = {}
local v_u_10 = nil
local v_u_11 = nil
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = nil
for v16, v17 in pairs(v_u_4) do
	v_u_7[v16] = {}
	for v18, v19 in pairs(v17) do
		local v20 = v_u_3.ElementData[v19.Element].Service
		if not v_u_8[v20] then
			v_u_8[v20] = v20
		end
		local v21 = v_u_7[v16]
		table.insert(v21, v18)
	end
end
for v22, v23 in pairs(v_u_5.Products) do
	if v23.Name == "Forever Pack" then
		v_u_9[v23.Index] = v22
	end
end
local v24 = v_u_2.CreateService
local v25 = {
	["Name"] = "ShopService",
	["Client"] = {
		["UpdateLimitedQuantity"] = v_u_2.CreateSignal()
	}
}
local v_u_26 = v24(v25)
local function v_u_30(p27)
	-- upvalues: (copy) v_u_6
	local v28 = v_u_6:NextNumber(1, 100)
	local v29
	if v28 <= 67 and p27 < 15 then
		v29 = 1
	elseif v28 <= 87 then
		v29 = 2
	elseif v28 <= 97 then
		v29 = p27 < 10 and 2 or 3
	elseif v28 <= 99 then
		v29 = p27 < 15 and 3 or 4
	else
		v29 = p27 < 15 and 3 or 5
	end
	return v29 + 1
end
local v_u_31 = {
	[2] = 1,
	[6] = 2,
	[11] = 3,
	[15] = 4,
	[19] = 5,
	[24] = 6,
	[30] = 7,
	[36] = 8,
	[43] = 9
}
function v_u_26.ProductForeverPack(_, p32)
	-- upvalues: (ref) v_u_12, (copy) v_u_4, (copy) v_u_8, (copy) v_u_3, (copy) v_u_26
	local v33 = v_u_12:Get(p32)
	local v34 = v33.ForeverPack.Items[1]
	local v35 = v_u_4[v34.Tier][v34.Name]
	v_u_8[v_u_3.ElementData[v35.Element].Service]:CollectReward(p32, v35)
	local v36 = v33.ForeverPack
	v36.Times = v36.Times + 1
	table.remove(v33.ForeverPack.Items, 1)
	v_u_26:UpdateForeverPack(p32)
end
function v_u_26.Client.ClaimForeverPack(_, p_u_37)
	-- upvalues: (ref) v_u_12, (copy) v_u_4, (copy) v_u_3, (copy) v_u_8, (copy) v_u_26, (ref) v_u_13, (copy) v_u_1, (copy) v_u_9
	local v38 = v_u_12:Get(p_u_37)
	local v39 = v38.ForeverPack.Items[1]
	local v40 = v_u_4[v39.Tier][v39.Name]
	local v41 = v_u_3.ElementData[v40.Element].Service
	if p_u_37:GetAttribute("PackDebounce") then
		return
	else
		p_u_37:SetAttribute("PackDebounce", true)
		task.spawn(function()
			-- upvalues: (copy) p_u_37
			task.wait(0.5)
			p_u_37:SetAttribute("PackDebounce", false)
		end)
		if v39.IsFree == 0 then
			table.remove(v38.ForeverPack.Items, 1)
			local v42 = v38.ForeverPack
			v42.Times = v42.Times + 1
			v_u_8[v41]:CollectReward(p_u_37, v40)
			v_u_26:UpdateForeverPack(p_u_37)
		else
			v_u_13:PlaySound(p_u_37, "PromotAnItem")
			v_u_1:PromptProductPurchase(p_u_37, v_u_9[v39.IsFree])
		end
	end
end
function v_u_26.Client.GroupThing(_, p43)
	-- upvalues: (ref) v_u_12, (ref) v_u_10, (copy) v_u_26
	local v44 = v_u_12:Get(p43)
	if p43:IsInGroup(35325835) then
		if not table.find(v44.CodesRedeemed, "GROUPREWARD111") then
			v_u_26.Client:SubmitCode(p43, "GROUPREWARD111")
			return true
		end
		v_u_10:NotifyPlayer(p43, {
			["Message"] = "You\'ve already claimed this reward!",
			["Color"] = "Red"
		})
	else
		v_u_10:NotifyPlayer(p43, {
			["Message"] = "Join the group!",
			["Color"] = "Red"
		})
	end
end
function v_u_26.Client.NextEvent(_, p45)
	-- upvalues: (ref) v_u_12, (ref) v_u_11
	local v46 = v_u_12:Get(p45)
	if not v46.Verify["5130338230138045146"] then
		v46.Verify["5130338230138045146"] = true
		v_u_12:Set(p45, { "Verify" }, function(p47)
			p47["5130338230138045146"] = true
			return p47
		end)
		v_u_11:CollectReward(p45, {
			["Element"] = "Crates",
			["Name"] = "Los Alessio Crate",
			["Amount"] = 2
		})
		return true
	end
end
function v_u_26.Client.DiscoThing(_, p48)
	-- upvalues: (ref) v_u_12, (ref) v_u_14, (ref) v_u_11
	local v49 = v_u_12:Get(p48)
	if not v49.Verify.Dis then
		v49.Verify.Dis = true
		v_u_12:Set(p48, { "Verify" }, function(p50)
			p50.Dis = true
			return p50
		end)
		v_u_14:CollectReward(p48, {
			["Element"] = "Items",
			["Name"] = "Wins Potion",
			["Tier"] = 1,
			["Amount"] = 3
		})
		v_u_14:CollectReward(p48, {
			["Element"] = "Items",
			["Name"] = "Exp Potion",
			["Tier"] = 1,
			["Amount"] = 3
		})
		v_u_11:CollectReward(p48, {
			["Element"] = "Crates",
			["Name"] = "Vault Crate",
			["Amount"] = 2
		})
		return true
	end
end
function v_u_26.Client.XThing(_, p51)
	-- upvalues: (ref) v_u_12, (ref) v_u_14, (ref) v_u_11
	local v52 = v_u_12:Get(p51)
	if not v52.Verify.X then
		v52.Verify.X = true
		v_u_12:Set(p51, { "Verify" }, function(p53)
			p53.X = true
			return p53
		end)
		v_u_14:CollectReward(p51, {
			["Element"] = "Items",
			["Name"] = "Wins Potion",
			["Tier"] = 1,
			["Amount"] = 3
		})
		v_u_14:CollectReward(p51, {
			["Element"] = "Items",
			["Name"] = "Exp Potion",
			["Tier"] = 1,
			["Amount"] = 3
		})
		v_u_11:CollectReward(p51, {
			["Element"] = "Crates",
			["Name"] = "Lolo Crate",
			["Amount"] = 2
		})
		return true
	end
end
function v_u_26.Client.YTThing(_, p54)
	-- upvalues: (ref) v_u_12, (ref) v_u_14, (ref) v_u_11
	local v55 = v_u_12:Get(p54)
	if not v55.Verify.YT then
		v55.Verify.YT = true
		v_u_12:Set(p54, { "Verify" }, function(p56)
			p56.YT = true
			return p56
		end)
		v_u_14:CollectReward(p54, {
			["Element"] = "Items",
			["Name"] = "Wins Potion",
			["Tier"] = 1,
			["Amount"] = 3
		})
		v_u_14:CollectReward(p54, {
			["Element"] = "Items",
			["Name"] = "Exp Potion",
			["Tier"] = 1,
			["Amount"] = 3
		})
		v_u_11:CollectReward(p54, {
			["Element"] = "Crates",
			["Name"] = "Vault Crate",
			["Amount"] = 2
		})
		return true
	end
end
function v_u_26.Client.SubmitCode(_, p57, p58)
	-- upvalues: (copy) v_u_3, (ref) v_u_10, (ref) v_u_12, (copy) v_u_2
	local v59 = nil
	for v60, v61 in pairs(v_u_3.ActiveCodes) do
		if string.lower(v60) == string.lower(p58) then
			v59 = v61
			break
		end
	end
	if v59 then
		local v62 = v_u_12:Get(p57)
		if table.find(v62.CodesRedeemed, string.lower(p58)) then
			v_u_10:NotifyPlayer(p57, {
				["Message"] = "You\'ve already redeemed this code!",
				["Color"] = "Red"
			})
		else
			local v63 = v62.CodesRedeemed
			local v64 = string.lower
			table.insert(v63, v64(p58))
			local v65 = v_u_3.ElementData[v59.Element].Service
			v_u_2.GetService(v65):CollectReward(p57, v59)
		end
	else
		v_u_10:NotifyPlayer(p57, {
			["Message"] = p58 == "" and "\226\157\140 Please enter a code!" or "\226\157\140 This code doesn\'t exist!",
			["Color"] = "Red"
		})
		return
	end
end
function v_u_26.UpdateForeverPack(_, p66)
	-- upvalues: (ref) v_u_12, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7, (copy) v_u_31, (copy) v_u_30
	local v67 = v_u_12:Get(p66)
	if v67.ForeverPack.Update then
		if v67.ForeverPack.Update ~= 45 then
			v67.ForeverPack.Update = 45
			v67.ForeverPack.Times = 0
			table.clear(v67.ForeverPack.Items)
		end
	else
		v67.ForeverPack.Update = 45
		v67.ForeverPack.Times = 0
		table.clear(v67.ForeverPack.Items)
	end
	for _, v68 in pairs(v67.ForeverPack.Items) do
		if not v_u_4[v68.Tier][v68.Name] then
			local v69 = v_u_6:NextNumber(1, 100)
			local v70
			if v69 <= 67 then
				v70 = 1
			elseif v69 <= 87 or v69 <= 97 then
				v70 = 2
			else
				local _ = v69 <= 99
				v70 = 3
			end
			local v71 = v70 + 1
			local v72 = v_u_7[v71][math.random(1, #v_u_7[v71])]
			local v73 = #v67.ForeverPack.Items + 1
			local v74 = v67.ForeverPack.Items
			local v75 = {
				["Tier"] = v71,
				["Name"] = v72
			}
			local v76 = v73 + v67.ForeverPack.Times
			local v77
			if v_u_31[v76] then
				v77 = v_u_31[v76]
			else
				v77 = v76 > 44 and (v76 - 1) % 7 == 0 and 9 or 0
			end
			v75.IsFree = v77
			table.insert(v74, v75)
		end
	end
	while true do
		if #v67.ForeverPack.Items >= 6 then
			v_u_12:Set(p66, { "ForeverPack" }, function(p78)
				return p78
			end)
			return
		end
		local v79 = #v67.ForeverPack.Items + 1
		local v80 = v79 + v67.ForeverPack.Times == 1 and 1 or v_u_30(v79 + v67.ForeverPack.Times)
		local v81 = v_u_7[v80][math.random(1, #v_u_7[v80])]
		if v_u_4[v80][v81].Element == "Monsters" then
			for _, v82 in pairs(v67.ForeverPack.Items) do
				if v82.Tier == v80 and v82.Name == v81 then
					for _, v83 in pairs(v_u_4[v80]) do
						if v83.Element == "Pets" then
							v81 = v83.Name
							break
						end
					end
				end
			end
			if table.find(v67.MonsterService.MonstersUnlocked, v_u_4[v80][v81].Name) then
				for v84, v85 in pairs(v_u_4[v80]) do
					if v85.Element == "Pets" then
						v81 = v84
						break
					end
				end
			end
		end
		local v86 = v67.ForeverPack.Items
		local v87 = {
			["Tier"] = v80,
			["Name"] = v81
		}
		local v88 = v79 + v67.ForeverPack.Times
		local v89
		if v_u_31[v88] then
			v89 = v_u_31[v88]
		else
			v89 = v88 > 44 and (v88 - 1) % 7 == 0 and 9 or 0
		end
		v87.IsFree = v89
		table.insert(v86, v87)
	end
end
function v_u_26.ClaimSpecific(_, p90, p91)
	-- upvalues: (copy) v_u_5, (ref) v_u_12, (copy) v_u_3, (copy) v_u_2
	local v92 = p91.ProductId
	local v93 = v_u_5.Products[v92]
	v_u_12:Set(p90, { "Gamepasses", v93.Name }, function()
		return true
	end)
	for _, v94 in pairs(v93.List) do
		local v95 = v_u_3.ElementData[v94.Element].Service
		v_u_2.GetService(v95):CollectReward(p90, v94)
	end
end
function v_u_26.LimitedPet(_, p96, p97)
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_2, (copy) v_u_26
	local v98 = p97.ProductId
	local v99 = v_u_5.Products[v98]
	local _ = v99.Name
	for _, v100 in pairs(v99.List) do
		local v101 = v_u_3.ElementData[v100.Element].Service
		v_u_2.GetService(v101):CollectReward(p96, v100)
		v_u_26.Client.UpdateLimitedQuantity:FireAll(v100.Index)
	end
end
function v_u_26.AddStorage(_, p_u_102, p103)
	-- upvalues: (copy) v_u_5, (ref) v_u_12, (ref) v_u_15
	local v104 = p103.ProductId
	local v_u_105 = v_u_5.Products[v104].Name
	v_u_12:Set(p_u_102, { "Products" }, function(p106)
		-- upvalues: (copy) v_u_105
		p106[v_u_105] = p106[v_u_105] and (p106[v_u_105] + 1 or 1) or 1
		return p106
	end)
	v_u_12:Set(p_u_102, { "PetsService", "MaxStorage" }, function()
		-- upvalues: (ref) v_u_15, (copy) p_u_102
		return v_u_15:GetMultiplier(p_u_102, "PetStorage")
	end)
end
function v_u_26.Client.NewTime(_, p107)
	-- upvalues: (ref) v_u_12
	v_u_12:Set(p107, { "TopRightOffer" }, function(p108)
		p108.StartingTime = os.time()
		p108.BonusTime = math.random(0, 18000)
		return p108
	end)
end
function v_u_26.KnitStart(p_u_109)
	-- upvalues: (copy) v_u_2, (ref) v_u_14, (ref) v_u_11, (ref) v_u_12, (ref) v_u_10, (ref) v_u_15, (ref) v_u_13, (copy) v_u_8
	local v110 = v_u_2.GetService("PlayerAddedService")
	v_u_14 = v_u_2.GetService("ItemsService")
	v_u_11 = v_u_2.GetService("CratesService")
	v110:AddPlayerCallback(function(p111)
		-- upvalues: (copy) p_u_109
		p_u_109:UpdateForeverPack(p111)
	end)
	v_u_12 = v_u_2.GetService("DataService")
	v_u_10 = v_u_2.GetService("NotificationService")
	v_u_15 = v_u_2.GetService("MultiplierService")
	v_u_13 = v_u_2.GetService("SoundService")
	for v112, v113 in pairs(v_u_8) do
		v_u_8[v112] = v_u_2.GetService(v113)
	end
end
return v_u_26

-- ================================================================
-- PATH:  Players.Cleanedbyll.PlayerGui.Windows.CodesDiscord.Free.ItemHere.ItemTemplate.Title.UIGradient.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = script.Parent
local v_u_2 = game:GetService("TweenService"):Create(v_u_1, TweenInfo.new(3.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
	["Offset"] = Vector2.new(1.5, 0)
})
local v_u_3 = Vector2.new(-1.5, 0)
v_u_1.Offset = v_u_3
local function v_u_4()
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_2:Play()
	v_u_2.Completed:Wait()
	v_u_1.Offset = v_u_3
	v_u_4()
end
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_2:Play()
v_u_2.Completed:Wait()
v_u_1.Offset = v_u_3
v_u_4()

-- ================================================================
-- PATH:  Workspace.Cleanedbyll.RagdollClient
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = workspace.CurrentCamera
local v2 = game.Players.LocalPlayer.Character
local v_u_3 = v2:WaitForChild("Head")
local v_u_4 = v2:WaitForChild("Humanoid")
game.ReplicatedStorage.Ragdoll.OnClientEvent:Connect(function(p5, p6)
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_3
	if v_u_4 then
		if p5 == "Make" then
			v_u_4:ChangeState(Enum.HumanoidStateType.Physics)
			v_u_1.CameraSubject = v_u_3
			v_u_4.RootPart.CanCollide = false
		elseif p5 == "Destroy" then
			v_u_4:ChangeState(Enum.HumanoidStateType.GettingUp)
			v_u_1.CameraSubject = v_u_4
			v_u_4.RootPart.CanCollide = true
		end
		if p5 == nil and p6 == "manualM" then
			v_u_4:ChangeState(Enum.HumanoidStateType.Physics)
			v_u_1.CameraSubject = v_u_3
			v_u_4.RootPart.CanCollide = false
		end
		if p5 == nil and p6 == "manualD" then
			v_u_4:ChangeState(Enum.HumanoidStateType.GettingUp)
			v_u_1.CameraSubject = v_u_4
			v_u_4.RootPart.CanCollide = true
		end
	end
end)
if script.Parent == game.Workspace then
	error("Dude wont run dumbass, and this print neither XD")
end

-- ================================================================
-- PATH:  Workspace.Cleanedbyll.PreventFalling
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

script.Parent:WaitForChild("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)

-- ================================================================
-- PATH:  ReplicatedStorage.Assets.BackpackSlotTemplates.BackpackButtonsContainer.EquipBestBrainrot.LocalScript
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Knit)
v_u_2.OnStart():andThen(function()
	-- upvalues: (copy) v_u_2
	local v_u_3 = v_u_2.GetController("BackpackController")
	require(v_u_2.UIComponents.Button):WaitForInstance(script.Parent):andThen(function(p4)
		-- upvalues: (copy) v_u_3
		p4:AddCallback(function()
			-- upvalues: (ref) v_u_3
			v_u_3:PlaceBestBrainrots()
		end)
	end)
end)

-- ================================================================
-- PATH:  ReplicatedStorage.Assets.BackpackSlotTemplates.SpecialPickaxeTooltip.SpecialModifier.SpecialModifier.Rainbow
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("TweenService")
while true do
	for _, v2 in {
		Color3.fromRGB(221, 255, 69),
		Color3.fromRGB(255, 102, 105),
		Color3.fromRGB(111, 198, 94),
		Color3.fromRGB(255, 104, 29),
		Color3.fromRGB(255, 200, 61),
		Color3.fromRGB(85, 255, 255),
		Color3.fromRGB(255, 170, 255)
	} do
		v1:Create(script.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["TextColor3"] = v2
		}):Play()
		task.wait(1)
	end
end

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.AbbreviationUtils
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {}
local v_u_2 = {
	{ 1000, "K" },
	{ 1000000, "M" },
	{ 1000000000, "B" },
	{ 1000000000000, "T" },
	{ 1000000000000000, "Qa" },
	{ 1e18, "Qi" },
	{ 1e21, "Sx" },
	{ 1e24, "Sp" },
	{ 1e27, "Oc" },
	{ 1e30, "No" },
	{ 1e33, "Dc" }
}
function v1.AbbreviateNumber(_, p3, p4)
	-- upvalues: (copy) v_u_2
	local v5 = math.abs(p3)
	local v6 = p4 or 1
	for v7 = #v_u_2, 1, -1 do
		local v8 = v_u_2[v7]
		local v9, v10 = unpack(v8)
		if v9 <= v5 then
			local v11 = 10 ^ v6
			local v12 = p3 / v9 * v11 + 0.5
			local v13 = math.floor(v12) / v11
			if v6 > 0 and v13 == math.floor(v13) then
				v13 = math.floor(v13)
			end
			return tostring(v13) .. v10
		end
	end
	local v14 = 10 ^ v6
	local v15 = p3 * v14
	local v16 = math.round(v15) / v14
	if v6 > 0 and v16 == math.floor(v16) then
		v16 = math.floor(v16)
	end
	return tostring(v16)
end
function v1.AbbreviateTime(_, p17)
	local v18 = p17 / 3600
	local v19 = math.floor(v18)
	local v20 = p17 % 3600 / 60
	local v21 = math.floor(v20)
	local v22 = p17 % 60
	local v23 = math.floor(v22)
	local v24 = string.format("%02d:%02d:%02d", v19, v21, v23)
	if v19 <= 0 then
		v24 = string.format("%02d:%02d", v21, v23)
	end
	return v24
end
function v1.DHMSTimeAbbreviate(_, p25)
	local v26 = {}
	local v27 = p25 / 86400
	local v28 = math.floor(v27)
	if v28 > 0 then
		local v29 = v28 .. "d"
		table.insert(v26, v29)
	end
	local v30 = p25 % 86400 / 3600
	local v31 = math.floor(v30)
	if v31 > 0 then
		local v32 = v31 .. "h"
		table.insert(v26, v32)
	end
	local v33 = p25 % 3600 / 60
	local v34 = math.floor(v33)
	if v34 > 0 then
		local v35 = v34 .. "m"
		table.insert(v26, v35)
	end
	local v36 = p25 % 60
	local v37 = math.floor(v36)
	if v37 > 0 or #v26 == 0 then
		local v38 = v37 .. "s"
		table.insert(v26, v38)
	end
	return table.concat(v26, " ")
end
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.AnimationUtils
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = require(game.ReplicatedStorage.Packages.promise)
return {
	["AnimatePopOut"] = function(_, p3, p4, p5, p6)
		-- upvalues: (copy) v_u_1
		local v7 = p4 or 0.5
		local v8 = p5 or Enum.EasingStyle.Back
		local v9 = p6 or Enum.EasingDirection.Out
		local v10 = p3:FindFirstChildOfClass("UIScale")
		if not v10 then
			v10 = Instance.new("UIScale")
			v10.Parent = p3
		end
		v10.Scale = 0
		local v11 = v_u_1:Create(v10, TweenInfo.new(v7, v8, v9, 0, false, 0), {
			["Scale"] = 1
		})
		v11:Play()
		return v11
	end,
	["PopAndShrink"] = function(_, p12, p_u_13)
		-- upvalues: (copy) v_u_1
		if p12 then
			local v_u_14 = p12:FindFirstChild("UIScale")
			if v_u_14 then
				v_u_14.Scale = 1
			else
				v_u_14 = Instance.new("UIScale")
				v_u_14.Scale = 1
				v_u_14.Parent = p12
			end
			local v15 = v_u_1:Create(v_u_14, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["Scale"] = 1.1
			})
			local v_u_16 = v_u_1:Create(v_u_14, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				["Scale"] = 0
			})
			v15.Completed:Once(function()
				-- upvalues: (copy) v_u_16
				v_u_16:Play()
			end)
			v_u_16.Completed:Once(function()
				-- upvalues: (ref) v_u_14, (copy) p_u_13
				v_u_14:Destroy()
				if p_u_13 then
					p_u_13()
				end
			end)
			v15:Play()
		else
			p_u_13()
		end
	end,
	["WaitForTrack"] = function(_, p_u_17, p18, p19)
		-- upvalues: (copy) v_u_2
		local v_u_20 = p18 or 0.2
		local v_u_21 = p19 or 10
		return v_u_2.new(function(p22, p23, p24)
			-- upvalues: (copy) p_u_17, (copy) v_u_21, (copy) v_u_20
			local v25 = 0
			while p_u_17.Length == 0 do
				if p24() then
					return
				end
				if v_u_21 <= v25 then
					return p23()
				end
				task.wait(v_u_20)
				v25 = v25 + 1
			end
			p22()
		end)
	end
}

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.FormatUtils
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

return {
	["FormatNumberWithCommas"] = function(_, p1, p2)
		local v3 = 10 ^ (p2 or 2)
		local v4 = p1 * v3
		local v5 = math.round(v4) / v3
		local v6, v7 = tostring(v5):match("^(-?%d+)(%.?%d*)$")
		if v7 and v7 ~= "" then
			v7 = v7:gsub("0+$", ""):gsub("%.$", "")
		end
		return v6:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "") .. v7
	end
}

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.LoadingStatus
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v2 = {}
local v_u_3 = v1:FindFirstChild("LoadingFinishedFlag")
if not v_u_3 then
	v_u_3 = Instance.new("BoolValue")
	v_u_3.Name = "LoadingFinishedFlag"
	v_u_3.Value = false
	v_u_3.Parent = v1
end
function v2.SetFinished(_)
	-- upvalues: (ref) v_u_3
	v_u_3.Value = true
end
function v2.IsFinished(_)
	-- upvalues: (ref) v_u_3
	return v_u_3.Value
end
function v2.WhenFinished(_, p_u_4)
	-- upvalues: (ref) v_u_3
	if v_u_3.Value then
		p_u_4()
	else
		local v_u_5 = nil
		v_u_5 = v_u_3.Changed:Connect(function(p6)
			-- upvalues: (ref) v_u_5, (copy) p_u_4
			if p6 == true then
				v_u_5:Disconnect()
				p_u_4()
			end
		end)
	end
end
return v2

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.PlatformUtils
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("UserInputService")
local v_u_9 = {
	["IsMobile"] = function(_)
		-- upvalues: (copy) v_u_4
		local v5 = v_u_4.TouchEnabled
		if v5 then
			v5 = not v_u_4.MouseEnabled
		end
		return v5
	end,
	["GetDeviceType"] = function(_)
		-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
		if v_u_4.VREnabled then
			return "VR"
		end
		if not (v_u_2:IsStudio() and v_u_4.TouchEnabled) and (not v_u_4.TouchEnabled or v_u_4.MouseEnabled) then
			return v_u_4.GamepadEnabled and v_u_3:IsTenFootInterface() and "Console" or "PC"
		end
		local v6 = v_u_1.LocalPlayer:GetMouse()
		local v7 = v6.ViewSizeX
		local v8 = v6.ViewSizeY
		return (v7 >= 1024 or v8 >= 768) and "Tablet" or "Mobile"
	end,
	["GetConsoleType"] = function(_)
		-- upvalues: (copy) v_u_9
		if v_u_9:GetDeviceType() == "Console" then
			return v_u_9:GetGamepadType()
		else
			return nil
		end
	end,
	["GetGamepadType"] = function(_)
		-- upvalues: (copy) v_u_4
		return v_u_4.GamepadEnabled and (v_u_4:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonA" and "Xbox" or "Sony") or nil
	end
}
return v_u_9

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.RandomUtils
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = require(game.ReplicatedStorage.Shared.TableUtils)
local v_u_2 = game.HttpService
local v_u_29 = {
	["CreateRandomizer"] = function(_)
		-- upvalues: (copy) v_u_2
		local v3 = v_u_2:GenerateGUID(false)
		local v4 = 0
		for v5 = 1, #v3 do
			v4 = (v4 * 31 + string.byte(v3, v5)) % 1000000007
		end
		return Random.new(v4)
	end,
	["GetDeterministicRandom"] = function(_, ...)
		local v6 = { ... }
		local v7 = {}
		for v8 = 1, #v6 do
			local v9 = v6[v8]
			v7[v8] = tostring(v9)
		end
		local v10 = table.concat(v7, "_")
		local v11 = 0
		for v12 = 1, #v10 do
			v11 = (v11 * 31 + string.byte(v10, v12)) % 1000000007
		end
		return v11
	end,
	["GetWeightedChoice"] = function(_, p13, p14, p15)
		-- upvalues: (copy) v_u_1, (copy) v_u_29
		local v16 = v_u_1.Copy(p13)
		if p15 then
			local v17 = v_u_1.Keys(p13)[1]
			for v18, v19 in p13 do
				if p13[v17] < v19 then
					v17 = v18
				end
			end
			for v20, v21 in v16 do
				if v20 ~= v17 then
					v16[v20] = v21 * p15
				end
			end
		end
		local v24 = v_u_1.Reduce(v_u_1.Values(v16), function(p22, p23)
			return p22 + p23
		end, 0)
		local v25 = (p14 or v_u_29:CreateRandomizer()):NextNumber(0, v24)
		local v26 = 0
		for v27, v28 in v16 do
			v26 = v26 + v28
			if v25 <= v26 then
				return v27
			end
		end
		warn("Cumulative did not pick any random choice")
		return v_u_1.Keys(v16)[1]
	end
}
return v_u_29

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.RobloxUtils
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("Debris")
local v_u_65 = {
	["GetRobuxIconText"] = function(_)
		return "\238\128\130"
	end,
	["CalculateLerp"] = function(_, p2, p3, p4, p5)
		local v6 = (p3 - p2.Position).Magnitude
		if v6 ~= 0 then
			local v7 = p4 * p5 / v6
			local v8 = math.min(v7, 1)
			return p2:Lerp(CFrame.new(p3) * p2.Rotation, v8)
		end
	end,
	["GetClosestObject"] = function(_, p9, p10)
		local v11 = 0
		local v12 = nil
		for _, v13 in p10 do
			if v13 then
				local v14 = (p9 - v13:GetPivot().Position).Magnitude
				if v14 < v11 then
					v12 = v13
					v11 = v14
				end
			end
		end
		return v12
	end,
	["GetDistance"] = function(_, p15, p16)
		return (p15:GetPivot().Position - p16:GetPivot().Position).Magnitude
	end,
	["GetSize"] = function(_, p17)
		if not p17:IsA("Model") then
			return p17.Size
		end
		local _, v18 = p17:GetBoundingBox()
		return v18
	end,
	["GetPivotToPlaceholder"] = function(_, p19, p20, p21, p22)
		-- upvalues: (copy) v_u_65
		local v23 = p20:GetPivot()
		local v24 = v_u_65:GetSize(p20)
		local v25 = v_u_65
		if p19.PrimaryPart then
			p19 = p19.PrimaryPart or p19
		end
		local v26 = v25:GetSize(p19)
		local v27 = p21 and v23.Y + v24.Y / 2 + v26.Y / 2 or v23.Y - v24.Y / 2 + v26.Y / 2
		if p22 then
			v27 = v27 + p22.Y
		end
		local v28 = v23.X
		local v29 = v23.Z
		local v30 = Vector3.new(v28, v27, v29)
		return CFrame.new(v30) * (v23 - v23.Position)
	end,
	["PivotToPlaceholder"] = function(_, p31, p32, p33, p34)
		-- upvalues: (copy) v_u_65
		p31:PivotTo((v_u_65:GetPivotToPlaceholder(p31, p32, p33, p34)))
	end,
	["GetRandomPositionOnPart"] = function(_, p35, p36)
		local v37 = p35.Size
		local v38 = p35.Position
		local v39
		if p36:IsA("Model") then
			v39 = p36:GetExtentsSize()
		else
			v39 = p36.Size
		end
		local v40 = v37.X - v39.X
		local v41 = math.max(0, v40)
		local v42 = v37.Z - v39.Z
		local v43 = math.max(0, v42)
		local v44 = v38.X + (math.random() - 0.5) * v41
		local v45 = v38.Z + (math.random() - 0.5) * v43
		local v46
		if p36:IsA("Model") then
			v46 = v38.Y + v37.Y / 2 + p36.PrimaryPart.Size.Y / 2
		else
			v46 = v38.Y + v37.Y / 2 + p36.Size.Y / 2
		end
		return Vector3.new(v44, v46, v45)
	end,
	["ApplyKnockback"] = function(_, p47, p48, p49)
		-- upvalues: (copy) v_u_1
		if p47 and p48 then
			local v50 = p47:FindFirstChild("HumanoidRootPart")
			local v51 = p48:FindFirstChild("HumanoidRootPart")
			if v50 and v51 then
				local v52 = Instance.new("Attachment")
				v52.Name = "KnockbackAttachment"
				v52.Parent = v51
				local v53 = (v51.Position - v50.Position).Unit
				local v54 = Instance.new("LinearVelocity")
				v54.Name = "KnockbackForce"
				v54.Attachment0 = v52
				v54.MaxForce = (1 / 0)
				local v55 = v53 * p49.distance
				if p49.upwardVelocity and p49.upwardVelocity > 0 then
					local v56 = p49.upwardVelocity
					v55 = v55 + Vector3.new(0, v56, 0)
				end
				v54.VectorVelocity = v55
				v54.Parent = v52
				p48.HumanoidRootPart.Anchored = false
				v_u_1:AddItem(v52, p49.duration)
			end
		else
			return
		end
	end,
	["OnChildAddedOnce"] = function(p57, p_u_58, p_u_59, p60)
		local v61 = p57:FindFirstChild(p_u_58) or p57:FindFirstChildOfClass(p_u_58)
		if v61 then
			p_u_59(v61)
		else
			local v_u_62 = false
			local v_u_63 = nil
			v_u_63 = p57.ChildAdded:Connect(function(p64)
				-- upvalues: (copy) p_u_58, (ref) v_u_62, (ref) v_u_63, (copy) p_u_59
				if p64.Name == p_u_58 or p64:IsA(p_u_58) then
					v_u_62 = true
					v_u_63:Disconnect()
					p_u_59(p64)
				end
			end)
			if p60 and p60 > 0 then
				task.delay(p60, function()
					-- upvalues: (ref) v_u_63
					if v_u_63.Connected then
						v_u_63:Disconnect()
					end
				end)
			end
		end
	end
}
return v_u_65

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.SmoothScrollUtils
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("RunService")
local v_u_3 = {}
local v_u_4 = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false, 0)
function v_u_3.scrollToY(p_u_5, p6, p7, p_u_8)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_1
	if not (p_u_5 and p_u_5.Parent) then
		warn("SmoothScroll: Invalid scrolling frame provided")
		return {
			["cancel"] = function() end
		}
	end
	if v_u_3._activeScroll then
		v_u_3._activeScroll.cancel()
		v_u_3._activeScroll = nil
	end
	local v9 = p7 or v_u_4
	local v10 = p_u_5.CanvasPosition.Y
	local v11 = v10 - p6
	if math.abs(v11) < 1 then
		if p_u_8 then
			p_u_8()
		end
		return {
			["cancel"] = function() end
		}
	end
	local v_u_12 = Instance.new("NumberValue")
	v_u_12.Value = v10
	local v_u_13 = false
	local v_u_15 = v_u_12.Changed:Connect(function(p14)
		-- upvalues: (copy) p_u_5, (ref) v_u_13
		if p_u_5 and (p_u_5.Parent and not v_u_13) then
			p_u_5.CanvasPosition = Vector2.new(0, p14)
		end
	end)
	local v_u_16 = v_u_1:Create(v_u_12, v9, {
		["Value"] = p6
	})
	local v_u_17 = {
		["cancel"] = function()
			-- upvalues: (ref) v_u_13, (ref) v_u_16, (ref) v_u_15, (copy) v_u_12, (ref) v_u_3
			v_u_13 = true
			if v_u_16 then
				v_u_16:Cancel()
			end
			if v_u_15 then
				v_u_15:Disconnect()
			end
			if v_u_12 then
				v_u_12:Destroy()
			end
			if v_u_3._activeScroll == control then
				v_u_3._activeScroll = nil
			end
		end
	}
	v_u_3._activeScroll = v_u_17
	v_u_16.Completed:Connect(function(p18)
		-- upvalues: (ref) v_u_15, (copy) v_u_12, (ref) v_u_3, (copy) v_u_17, (copy) p_u_8
		if v_u_15 then
			v_u_15:Disconnect()
		end
		if v_u_12 then
			v_u_12:Destroy()
		end
		if v_u_3._activeScroll == v_u_17 then
			v_u_3._activeScroll = nil
		end
		if p_u_8 and p18 == Enum.PlaybackState.Completed then
			p_u_8()
		end
	end)
	v_u_16:Play()
	return v_u_17
end
function v_u_3.scrollToElement(p19, p20, p21, p22, p23)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if not (p19 and p20) then
		warn("SmoothScroll: Invalid scrolling frame or target element provided")
		return {
			["cancel"] = function() end
		}
	end
	local v24 = p23 or "top"
	v_u_2.Heartbeat:Wait()
	local v25 = p20.AbsolutePosition.Y - p19.AbsolutePosition.Y + p19.CanvasPosition.Y
	if v24 == "center" then
		v25 = v25 - p19.AbsoluteSize.Y / 2 + p20.AbsoluteSize.Y / 2
	elseif v24 == "bottom" then
		v25 = v25 - p19.AbsoluteSize.Y + p20.AbsoluteSize.Y
	end
	local v26 = p19.AbsoluteCanvasSize.Y - p19.AbsoluteSize.Y
	local v27 = math.max(0, v26)
	local v28 = math.min(v25, v27)
	local v29 = math.max(0, v28)
	return v_u_3.scrollToY(p19, v29, p21, p22)
end
v_u_3.Presets = {
	["Fast"] = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
	["Normal"] = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
	["Slow"] = TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
	["Bounce"] = TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out),
	["Elastic"] = TweenInfo.new(1.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
}
return v_u_3

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.TableUtils
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {}
local v_u_2 = game:GetService("HttpService")
local v_u_3 = Random.new()
local function v_u_24(p4, p5)
	-- upvalues: (copy) v_u_24
	local v6 = type(p4) == "table"
	assert(v6, "First argument must be a table")
	local v7 = type(p5) == "table"
	assert(v7, "Second argument must be a table")
	local v8 = table.clone(p4)
	for v9, v10 in pairs(v8) do
		local v11 = p5[v9]
		if v11 == nil then
			v8[v9] = nil
		elseif type(v10) == type(v11) then
			if type(v10) == "table" then
				v8[v9] = v_u_24(v10, v11)
			end
		elseif type(v11) == "table" then
			local function v_u_16(p12)
				-- upvalues: (copy) v_u_16
				local v13 = table.clone(p12)
				for v14, v15 in v13 do
					if type(v15) == "table" then
						v13[v14] = v_u_16(v15)
					end
				end
				return v13
			end
			v8[v9] = v_u_16(v11)
		else
			v8[v9] = v11
		end
	end
	for v17, v18 in pairs(p5) do
		if v8[v17] == nil then
			if type(v18) == "table" then
				local function v_u_23(p19)
					-- upvalues: (copy) v_u_23
					local v20 = table.clone(p19)
					for v21, v22 in v20 do
						if type(v22) == "table" then
							v20[v21] = v_u_23(v22)
						end
					end
					return v20
				end
				v8[v17] = v_u_23(v18)
			else
				v8[v17] = v18
			end
		end
	end
	return v8
end
local function v_u_43(p25, p26)
	-- upvalues: (copy) v_u_43
	local v27 = type(p25) == "table"
	assert(v27, "First argument must be a table")
	local v28 = type(p26) == "table"
	assert(v28, "Second argument must be a table")
	local v29 = table.clone(p25)
	for v30, v31 in p26 do
		local v32 = p25[v30]
		if v32 == nil then
			if type(v31) == "table" then
				local function v_u_37(p33)
					-- upvalues: (copy) v_u_37
					local v34 = table.clone(p33)
					for v35, v36 in v34 do
						if type(v36) == "table" then
							v34[v35] = v_u_37(v36)
						end
					end
					return v34
				end
				v29[v30] = v_u_37(v31)
			else
				v29[v30] = v31
			end
		elseif type(v32) == "table" then
			if type(v31) == "table" then
				v29[v30] = v_u_43(v32, v31)
			else
				local function v_u_42(p38)
					-- upvalues: (copy) v_u_42
					local v39 = table.clone(p38)
					for v40, v41 in v39 do
						if type(v41) == "table" then
							v39[v40] = v_u_42(v41)
						end
					end
					return v39
				end
				v29[v30] = v_u_42(v32)
			end
		end
	end
	return v29
end
local function v_u_51(p44, p45)
	local v46 = type(p44) == "table"
	assert(v46, "First argument must be a table")
	local v47 = type(p45) == "function"
	assert(v47, "Second argument must be a function")
	local v48 = table.create(#p44)
	for v49, v50 in p44 do
		v48[v49] = p45(v50, v49, p44)
	end
	return v48
end
function v1.Copy(p52, p53)
	if not p53 then
		return table.clone(p52)
	end
	local function v_u_58(p54)
		-- upvalues: (copy) v_u_58
		local v55 = table.clone(p54)
		for v56, v57 in v55 do
			if type(v57) == "table" then
				v55[v56] = v_u_58(v57)
			end
		end
		return v55
	end
	return v_u_58(p52)
end
v1.Sync = v_u_24
v1.Reconcile = v_u_43
function v1.SwapRemove(p59, p60)
	local v61 = #p59
	p59[p60] = p59[v61]
	p59[v61] = nil
end
function v1.SwapRemoveFirstValue(p62, p63)
	local v64 = table.find(p62, p63)
	if v64 then
		local v65 = #p62
		p62[v64] = p62[v65]
		p62[v65] = nil
	end
	return v64
end
v1.Map = v_u_51
function v1.Filter(p66, p67)
	local v68 = type(p66) == "table"
	assert(v68, "First argument must be a table")
	local v69 = type(p67) == "function"
	assert(v69, "Second argument must be a function")
	local v70 = table.create(#p66)
	if #p66 <= 0 then
		for v71, v72 in p66 do
			if p67(v72, v71, p66) then
				v70[v71] = v72
			end
		end
		return v70
	end
	local v73 = 0
	for v74, v75 in p66 do
		if p67(v75, v74, p66) then
			v73 = v73 + 1
			v70[v73] = v75
		end
	end
	return v70
end
function v1.Reduce(p76, p77, p78)
	local v79 = type(p76) == "table"
	assert(v79, "First argument must be a table")
	local v80 = type(p77) == "function"
	assert(v80, "Second argument must be a function")
	if #p76 > 0 then
		local v81
		if p78 == nil then
			p78 = p76[1]
			v81 = 2
		else
			v81 = 1
		end
		for v82 = v81, #p76 do
			p78 = p77(p78, p76[v82], v82, p76)
		end
		return p78
	else
		local v83
		if p78 == nil then
			v83 = next(p76)
			p78 = v83
		else
			v83 = nil
		end
		for v84, v85 in next, p76, v83 do
			p78 = p77(p78, v85, v84, p76)
		end
		return p78
	end
end
function v1.Assign(p86, ...)
	local v87 = table.clone(p86)
	for _, v88 in { ... } do
		for v89, v90 in v88 do
			v87[v89] = v90
		end
	end
	return v87
end
function v1.Extend(p91, p92)
	local v93 = table.clone(p91)
	for _, v94 in p92 do
		table.insert(v93, v94)
	end
	return v93
end
function v1.Reverse(p95)
	local v96 = #p95
	local v97 = table.create(v96)
	for v98 = 1, v96 do
		v97[v98] = p95[v96 - v98 + 1]
	end
	return v97
end
function v1.Shuffle(p99, p100)
	-- upvalues: (copy) v_u_3
	local v101 = type(p99) == "table"
	assert(v101, "First argument must be a table")
	local v102 = table.clone(p99)
	if typeof(p100) ~= "Random" then
		p100 = v_u_3
	end
	for v103 = #p99, 2, -1 do
		local v104 = p100:NextInteger(1, v103)
		local v105 = v102[v104]
		local v106 = v102[v103]
		v102[v103] = v105
		v102[v104] = v106
	end
	return v102
end
function v1.Sample(p107, p108, p109)
	-- upvalues: (copy) v_u_3
	local v110 = type(p107) == "table"
	assert(v110, "First argument must be a table")
	local v111 = type(p108) == "number"
	assert(v111, "Second argument must be a number")
	local v112 = #p107
	if v112 == 0 then
		return {}
	end
	local v113 = table.clone(p107)
	local v114 = table.create(p108)
	if typeof(p109) ~= "Random" then
		p109 = v_u_3
	end
	local v115 = math.clamp(p108, 1, v112)
	for v116 = 1, v115 do
		local v117 = p109:NextInteger(v116, v112)
		local v118 = v113[v117]
		local v119 = v113[v116]
		v113[v116] = v118
		v113[v117] = v119
	end
	table.move(v113, 1, v115, 1, v114)
	return v114
end
function v1.Flat(p120, p121)
	local v_u_122 = type(p121) ~= "number" and 1 or p121
	local v_u_123 = table.create(#p120)
	local function v_u_128(p124, p125)
		-- upvalues: (copy) v_u_122, (copy) v_u_128, (copy) v_u_123
		for _, v126 in p124 do
			if type(v126) == "table" and p125 < v_u_122 then
				v_u_128(v126, p125 + 1)
			else
				local v127 = v_u_123
				table.insert(v127, v126)
			end
		end
	end
	v_u_128(p120, 0)
	return v_u_123
end
function v1.FlatMap(p129, p130)
	-- upvalues: (copy) v_u_51
	local v131 = v_u_51(p129, p130)
	local v_u_132 = table.create(#v131)
	local v_u_133 = 1
	local function v_u_138(p134, p135)
		-- upvalues: (copy) v_u_133, (copy) v_u_138, (copy) v_u_132
		for _, v136 in p134 do
			if type(v136) == "table" and p135 < v_u_133 then
				v_u_138(v136, p135 + 1)
			else
				local v137 = v_u_132
				table.insert(v137, v136)
			end
		end
	end
	v_u_138(v131, 0)
	return v_u_132
end
function v1.Keys(p139)
	local v140 = table.create(#p139)
	for v141 in p139 do
		table.insert(v140, v141)
	end
	return v140
end
function v1.Values(p142)
	local v143 = table.create(#p142)
	for _, v144 in p142 do
		table.insert(v143, v144)
	end
	return v143
end
function v1.Find(p145, p146)
	for v147, v148 in p145 do
		if p146(v148, v147, p145) then
			return v148, v147
		end
	end
	return nil, nil
end
function v1.Every(p149, p150)
	for v151, v152 in p149 do
		if not p150(v152, v151, p149) then
			return false
		end
	end
	return true
end
function v1.Some(p153, p154)
	for v155, v156 in p153 do
		if p154(v156, v155, p153) then
			return true
		end
	end
	return false
end
function v1.Truncate(p157, p158)
	local v159 = #p157
	local v160 = math.clamp(p158, 1, v159)
	if v160 == v159 then
		return table.clone(p157)
	else
		return table.move(p157, 1, v160, 1, table.create(v160))
	end
end
function v1.Zip(...)
	local v161 = select("#", ...) > 0
	assert(v161, "Must supply at least 1 table")
	local function v169(p162, p163)
		local v164 = p163 + 1
		local v165 = {}
		for v166, v167 in p162 do
			local v168 = v167[v164]
			if v168 == nil then
				return nil, nil
			end
			v165[v166] = v168
		end
		return v164, v165
	end
	local function v176(p170, p171)
		local v172 = {}
		for v173, v174 in p170 do
			local v175 = next(v174, p171)
			if v175 == nil then
				return nil, nil
			end
			v172[v173] = v175
		end
		return p171, v172
	end
	local v177 = { ... }
	if #v177[1] > 0 then
		return v169, v177, 0
	else
		return v176, v177, nil
	end
end
function v1.Lock(p178)
	local function v_u_182(p179)
		-- upvalues: (copy) v_u_182
		for v180, v181 in pairs(p179) do
			if type(v181) == "table" then
				p179[v180] = v_u_182(v181)
			end
		end
		return table.freeze(p179)
	end
	return v_u_182(p178)
end
function v1.IsEmpty(p183)
	return next(p183) == nil
end
function v1.EncodeJSON(p184)
	-- upvalues: (copy) v_u_2
	return v_u_2:JSONEncode(p184)
end
function v1.DecodeJSON(p185)
	-- upvalues: (copy) v_u_2
	return v_u_2:JSONDecode(p185)
end
function v1.GetLength(p186)
	local v187 = 0
	for _, _ in pairs(p186) do
		v187 = v187 + 1
	end
	return v187
end
function v1.Join(p188, p189)
	local v190 = {}
	for v191, v192 in pairs(p188) do
		v190[v191] = v192
	end
	if p189 then
		for v193, v194 in pairs(p189) do
			v190[v193] = v194
		end
	end
	return v190
end
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.Chalk
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = {
	["FONT_COLOR_RGB"] = {
		["Start"] = "<font color=\"rgb(%s,%s,%s)\">",
		["End"] = "</font>"
	},
	["FONT_COLOR_HEX"] = {
		["Start"] = "<font color=\"#%s\">",
		["End"] = "</font>"
	},
	["FONT_SIZE"] = {
		["Start"] = "<font size=\"%d\">",
		["End"] = "</font>"
	},
	["FONT_FACE"] = {
		["Start"] = "<font face=\"%s\">",
		["End"] = "</font>"
	},
	["FONT_FAMILY"] = {
		["Start"] = "<font family=\"%s\">",
		["End"] = "</font>"
	},
	["FONT_WEIGHT"] = {
		["Start"] = "<font weight=\"%s\">",
		["End"] = "</font>"
	},
	["FONT_TRANSPARENCY"] = {
		["Start"] = "<font transparency=\"%s\">",
		["End"] = "</font>"
	},
	["STROKE"] = {
		["Start"] = "<stroke color=\"#%s\" joins=\"%s\" thickness=\"%s\" transparency=\"%s\">",
		["End"] = "</stroke>"
	},
	["BOLD"] = {
		["Start"] = "<b>",
		["End"] = "</b>"
	},
	["ITALIC"] = {
		["Start"] = "<i>",
		["End"] = "</i>"
	},
	["UNDERLINE"] = {
		["Start"] = "<u>",
		["End"] = "</u>"
	},
	["STRIKETHROUGH"] = {
		["Start"] = "<s>",
		["End"] = "</s>"
	},
	["UPPERCASE"] = {
		["Start"] = "<uppercase>",
		["End"] = "</uppercase>"
	},
	["SMALLCAPS"] = {
		["Start"] = "<smallcaps>",
		["End"] = "</smallcaps>"
	}
}
local v_u_2 = {}
local v_u_3 = {}
v_u_3.__index = v_u_3
local v_u_4 = {}
local v_u_5 = "FONT_SIZE"
function v_u_4.size(p6)
	-- upvalues: (copy) v_u_1, (copy) v_u_5
	local v_u_7 = v_u_1[v_u_5].Start:format(p6)
	return function(p8)
		-- upvalues: (copy) v_u_7, (ref) v_u_1, (ref) v_u_5
		return ("%*%*%*"):format(v_u_7, p8, v_u_1[v_u_5].End)
	end
end
local v_u_9 = "FONT_FACE"
function v_u_4.face(p10)
	-- upvalues: (copy) v_u_1, (copy) v_u_9
	local v_u_11 = v_u_1[v_u_9].Start:format(p10)
	return function(p12)
		-- upvalues: (copy) v_u_11, (ref) v_u_1, (ref) v_u_9
		return ("%*%*%*"):format(v_u_11, p12, v_u_1[v_u_9].End)
	end
end
local v_u_13 = "FONT_FAMILY"
function v_u_4.family(p14)
	-- upvalues: (copy) v_u_1, (copy) v_u_13
	local v_u_15 = v_u_1[v_u_13].Start:format(p14)
	return function(p16)
		-- upvalues: (copy) v_u_15, (ref) v_u_1, (ref) v_u_13
		return ("%*%*%*"):format(v_u_15, p16, v_u_1[v_u_13].End)
	end
end
local v_u_17 = "FONT_WEIGHT"
function v_u_4.weight(p18)
	-- upvalues: (copy) v_u_1, (copy) v_u_17
	local v_u_19 = v_u_1[v_u_17].Start:format(p18)
	return function(p20)
		-- upvalues: (copy) v_u_19, (ref) v_u_1, (ref) v_u_17
		return ("%*%*%*"):format(v_u_19, p20, v_u_1[v_u_17].End)
	end
end
local v_u_21 = "FONT_TRANSPARENCY"
function v_u_4.transparency(p22)
	-- upvalues: (copy) v_u_1, (copy) v_u_21
	local v_u_23 = v_u_1[v_u_21].Start:format(p22)
	return function(p24)
		-- upvalues: (copy) v_u_23, (ref) v_u_1, (ref) v_u_21
		return ("%*%*%*"):format(v_u_23, p24, v_u_1[v_u_21].End)
	end
end
function v_u_4.stroke(p25)
	-- upvalues: (copy) v_u_1
	local v26 = p25.Color or "#FFFFFF"
	local v27 = p25.Joins or "Round"
	local v28 = p25.Thickness or 1
	local v29 = p25.Transparency or 0
	local v_u_30 = v_u_1.STROKE.Start:format(v26, v27, v28, v29)
	return function(p31)
		-- upvalues: (copy) v_u_30, (ref) v_u_1
		return ("%*%*%*"):format(v_u_30, p31, v_u_1.STROKE.End)
	end
end
function v_u_4.color(...)
	-- upvalues: (copy) v_u_1
	local v32 = { ... }
	local v33 = v32[1]
	local v34
	if typeof(v33) == "string" then
		local v35 = v33:gsub("#", "")
		v34 = string.match(v35, "^%x%x%x%x%x%x$")
	else
		v34 = nil
	end
	local v36 = v32[1]
	local v37 = typeof(v36) == "Color3"
	local v38 = v32[1]
	local v39 = v37 and v38 and v38 or (v34 and Color3.fromHex(v38) or Color3.fromRGB(v38, v32[2], v32[3]))
	local v_u_40 = v34 and v_u_1.FONT_COLOR_HEX.Start:format(v38:gsub("#", ""))
	if not v_u_40 then
		local v41 = v_u_1.FONT_COLOR_RGB.Start
		local v42 = v39.R * 255
		local v43 = math.floor(v42)
		local v44 = v39.G * 255
		local v45 = math.floor(v44)
		local v46 = v39.B * 255
		v_u_40 = v41:format(v43, v45, (math.floor(v46)))
	end
	return function(p47)
		-- upvalues: (copy) v_u_40, (ref) v_u_1
		return ("%*%*%*"):format(v_u_40, p47, v_u_1.FONT_COLOR_RGB.End)
	end
end
local v_u_48 = "BOLD"
function v_u_2.bold(p49)
	-- upvalues: (copy) v_u_1, (copy) v_u_48
	local v50 = v_u_1[v_u_48]
	return ("%*%*%*"):format(v50.Start, p49, v50.End)
end
local v_u_51 = "ITALIC"
function v_u_2.italic(p52)
	-- upvalues: (copy) v_u_1, (copy) v_u_51
	local v53 = v_u_1[v_u_51]
	return ("%*%*%*"):format(v53.Start, p52, v53.End)
end
local v_u_54 = "UNDERLINE"
function v_u_2.underline(p55)
	-- upvalues: (copy) v_u_1, (copy) v_u_54
	local v56 = v_u_1[v_u_54]
	return ("%*%*%*"):format(v56.Start, p55, v56.End)
end
local v_u_57 = "STRIKETHROUGH"
function v_u_2.strikethrough(p58)
	-- upvalues: (copy) v_u_1, (copy) v_u_57
	local v59 = v_u_1[v_u_57]
	return ("%*%*%*"):format(v59.Start, p58, v59.End)
end
local v_u_60 = "UPPERCASE"
function v_u_2.uppercase(p61)
	-- upvalues: (copy) v_u_1, (copy) v_u_60
	local v62 = v_u_1[v_u_60]
	return ("%*%*%*"):format(v62.Start, p61, v62.End)
end
local v_u_63 = "SMALLCAPS"
function v_u_2.smallcaps(p64)
	-- upvalues: (copy) v_u_1, (copy) v_u_63
	local v65 = v_u_1[v_u_63]
	return ("%*%*%*"):format(v65.Start, p64, v65.End)
end
for v66 = 1, 1032 do
	local v_u_67 = BrickColor.new(v66)
	local function v75(p68)
		-- upvalues: (copy) v_u_67, (copy) v_u_1
		local v69 = v_u_67.r * 255
		local v70 = math.floor(v69)
		local v71 = v_u_67.g * 255
		local v72 = math.floor(v71)
		local v73 = v_u_67.b * 255
		local v74 = math.floor(v73)
		return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v70, v72, v74), p68, v_u_1.FONT_COLOR_RGB.End)
	end
	v_u_2[v_u_67.Name:lower()] = v75
	v_u_2[v_u_67.Name] = v75
	v_u_2[v_u_67] = v75
end
local v_u_76 = Color3.fromRGB(255, 255, 255)
function v_u_2.white(p77)
	-- upvalues: (copy) v_u_76, (copy) v_u_1
	local v78 = v_u_76.r * 255
	local v79 = math.floor(v78)
	local v80 = v_u_76.g * 255
	local v81 = math.floor(v80)
	local v82 = v_u_76.b * 255
	local v83 = math.floor(v82)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v79, v81, v83), p77, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_84 = Color3.fromRGB(0, 0, 0)
function v_u_2.black(p85)
	-- upvalues: (copy) v_u_84, (copy) v_u_1
	local v86 = v_u_84.r * 255
	local v87 = math.floor(v86)
	local v88 = v_u_84.g * 255
	local v89 = math.floor(v88)
	local v90 = v_u_84.b * 255
	local v91 = math.floor(v90)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v87, v89, v91), p85, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_92 = Color3.fromRGB(255, 0, 0)
function v_u_2.red(p93)
	-- upvalues: (copy) v_u_92, (copy) v_u_1
	local v94 = v_u_92.r * 255
	local v95 = math.floor(v94)
	local v96 = v_u_92.g * 255
	local v97 = math.floor(v96)
	local v98 = v_u_92.b * 255
	local v99 = math.floor(v98)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v95, v97, v99), p93, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_100 = Color3.fromRGB(153, 51, 0)
function v_u_2.brown(p101)
	-- upvalues: (copy) v_u_100, (copy) v_u_1
	local v102 = v_u_100.r * 255
	local v103 = math.floor(v102)
	local v104 = v_u_100.g * 255
	local v105 = math.floor(v104)
	local v106 = v_u_100.b * 255
	local v107 = math.floor(v106)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v103, v105, v107), p101, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_108 = Color3.fromRGB(255, 153, 0)
function v_u_2.orange(p109)
	-- upvalues: (copy) v_u_108, (copy) v_u_1
	local v110 = v_u_108.r * 255
	local v111 = math.floor(v110)
	local v112 = v_u_108.g * 255
	local v113 = math.floor(v112)
	local v114 = v_u_108.b * 255
	local v115 = math.floor(v114)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v111, v113, v115), p109, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_116 = Color3.fromRGB(255, 255, 0)
function v_u_2.yellow(p117)
	-- upvalues: (copy) v_u_116, (copy) v_u_1
	local v118 = v_u_116.r * 255
	local v119 = math.floor(v118)
	local v120 = v_u_116.g * 255
	local v121 = math.floor(v120)
	local v122 = v_u_116.b * 255
	local v123 = math.floor(v122)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v119, v121, v123), p117, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_124 = Color3.fromRGB(153, 255, 0)
function v_u_2.lime(p125)
	-- upvalues: (copy) v_u_124, (copy) v_u_1
	local v126 = v_u_124.r * 255
	local v127 = math.floor(v126)
	local v128 = v_u_124.g * 255
	local v129 = math.floor(v128)
	local v130 = v_u_124.b * 255
	local v131 = math.floor(v130)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v127, v129, v131), p125, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_132 = Color3.fromRGB(0, 255, 0)
function v_u_2.green(p133)
	-- upvalues: (copy) v_u_132, (copy) v_u_1
	local v134 = v_u_132.r * 255
	local v135 = math.floor(v134)
	local v136 = v_u_132.g * 255
	local v137 = math.floor(v136)
	local v138 = v_u_132.b * 255
	local v139 = math.floor(v138)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v135, v137, v139), p133, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_140 = Color3.fromRGB(0, 0, 255)
function v_u_2.blue(p141)
	-- upvalues: (copy) v_u_140, (copy) v_u_1
	local v142 = v_u_140.r * 255
	local v143 = math.floor(v142)
	local v144 = v_u_140.g * 255
	local v145 = math.floor(v144)
	local v146 = v_u_140.b * 255
	local v147 = math.floor(v146)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v143, v145, v147), p141, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_148 = Color3.fromRGB(102, 0, 153)
function v_u_2.purple(p149)
	-- upvalues: (copy) v_u_148, (copy) v_u_1
	local v150 = v_u_148.r * 255
	local v151 = math.floor(v150)
	local v152 = v_u_148.g * 255
	local v153 = math.floor(v152)
	local v154 = v_u_148.b * 255
	local v155 = math.floor(v154)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v151, v153, v155), p149, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_156 = Color3.fromRGB(255, 0, 255)
function v_u_2.pink(p157)
	-- upvalues: (copy) v_u_156, (copy) v_u_1
	local v158 = v_u_156.r * 255
	local v159 = math.floor(v158)
	local v160 = v_u_156.g * 255
	local v161 = math.floor(v160)
	local v162 = v_u_156.b * 255
	local v163 = math.floor(v162)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v159, v161, v163), p157, v_u_1.FONT_COLOR_RGB.End)
end
function v_u_3.new(p164)
	-- upvalues: (copy) v_u_4, (copy) v_u_2
	local v165 = {}
	local v166 = {}
	local v_u_167 = {}
	v165.Formatters = v_u_167
	local v_u_168 = nil
	local v_u_169 = nil
	function v166.__call(_, ...)
		-- upvalues: (ref) v_u_168, (copy) v_u_167
		local v170 = { ... }
		if v_u_168 then
			local v171 = v_u_168
			v_u_168 = nil
			return v171(unpack(v170))
		else
			local v172 = {}
			for _, v175 in v170 do
				for _, v174 in v_u_167 do
					local v175 = v174(v175)
				end
				table.insert(v172, v175)
			end
			return unpack(v172)
		end
	end
	function v166.__index(p176, p177)
		-- upvalues: (ref) v_u_4, (ref) v_u_168, (copy) v_u_167, (ref) v_u_169, (ref) v_u_2
		local v_u_178 = v_u_4[p177]
		if v_u_178 then
			v_u_168 = function(...)
				-- upvalues: (copy) v_u_178, (ref) v_u_167, (ref) v_u_169
				local v179 = v_u_178(...)
				local v180 = v_u_167
				table.insert(v180, v179)
				return v_u_169
			end
			return v_u_169
		end
		local v181 = v_u_2[p177]
		local v182 = v_u_167
		table.insert(v182, v181)
		return p176
	end
	v166:__index(p164)
	v_u_169 = setmetatable(v165, v166)
	return v_u_169
end
return setmetatable({}, {
	["__index"] = function(_, p183)
		-- upvalues: (copy) v_u_3
		return v_u_3.new(p183)
	end,
	["__newindex"] = function()
		return error("Chalk is READONLY")
	end
})

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.SavedDesigns
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = require(game.ReplicatedStorage.Shared.HelpfulFunctions)
local v_u_2 = {}
local v3 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(59, 59, 59)
	},
	["Gradient"] = script.Gradients.Common
}
v_u_2.Common = v3
local v4 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(30, 63, 35)
	},
	["Gradient"] = script.Gradients.Uncommon
}
v_u_2.Uncommon = v4
local v5 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(38, 85, 100)
	},
	["Gradient"] = script.Gradients.Rare
}
v_u_2.Rare = v5
local v6 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(71, 42, 120)
	},
	["Gradient"] = script.Gradients.Epic
}
v_u_2.Epic = v6
local v7 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(100, 91, 55)
	},
	["Gradient"] = script.Gradients.Legendary
}
v_u_2.Legendary = v7
local v8 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(112, 63, 63)
	},
	["Gradient"] = script.Gradients.Mythic
}
v_u_2.Mythic = v8
local v9 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(89, 77, 32)
	},
	["Gradient"] = script.Gradients.Divine
}
v_u_2.Divine = v9
local v10 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(0, 0, 0)
	},
	["Gradient"] = script.Gradients.Secret
}
v_u_2.Secret = v10
local v11 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(71, 37, 130)
	},
	["Gradient"] = script.Gradients.Cosmic
}
v_u_2.Cosmic = v11
local v12 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(25, 30, 130)
	},
	["Gradient"] = script.Gradients.Eternal
}
v_u_2.Eternal = v12
local v13 = {
	["TextFont"] = Enum.Font.FredokaOne,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(3, 3, 3)
	},
	["Gradient"] = script.Gradients.SPECIAL
}
v_u_2.SPECIAL = v13
local v14 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 2.5,
		["StrokeColor"] = Color3.new(0, 0.223529, 0.223529)
	},
	["Gradient"] = script.Gradients.Exclusive
}
v_u_2.Normal = v14
local v15 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(112, 99, 36)
	},
	["Gradient"] = script.Gradients.Golden
}
v_u_2.Golden = v15
local v16 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(62, 54, 20)
	},
	["Gradient"] = script.Gradients.Golden
}
v_u_2.Gold = v16
local v17 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(85, 24, 91)
	},
	["Gradient"] = script.Gradients.Candy
}
v_u_2.Candy = v17
local v18 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(18, 48, 62)
	},
	["Gradient"] = script.Gradients.Diamond
}
v_u_2.Diamond = v18
local v19 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(63, 30, 91)
	},
	["Gradient"] = script.Gradients.Void
}
v_u_2.Void = v19
local v20 = {
	["TextFont"] = Enum.Font.Montserrat,
	["Stroke"] = {
		["StrokeThickness"] = 3.258,
		["StrokeColor"] = Color3.fromRGB(175, 153, 25)
	},
	["Gradient"] = script.Gradients.SUNGOD
}
v_u_2.SUNGOD = v20
local v21 = {
	["TextFont"] = Enum.Font.FredokaOne,
	["Stroke"] = {
		["StrokeThickness"] = 3,
		["StrokeColor"] = Color3.new(0.815686, 0.815686, 0.815686)
	},
	["Gradient"] = script.Gradients.Rainbow
}
v_u_2.Rainbow = v21
local v22 = {
	["TextFont"] = Enum.Font.FredokaOne,
	["Stroke"] = {
		["StrokeThickness"] = 3,
		["StrokeColor"] = Color3.new(0, 0, 0)
	},
	["Gradient"] = script.Gradients.TextRainbow
}
v_u_2.AnimatedRainbow = v22
local v_u_23 = {}
v_u_2.lowerCopy = v_u_23
for v24, v25 in v_u_2 do
	v_u_23[v24:lower()] = v25
end
function v_u_2.LoadDesign(_, p26, p27, p28)
	-- upvalues: (copy) v_u_2, (copy) v_u_23, (copy) v_u_1
	local v29 = v_u_2[p26] or v_u_23[p26:lower()]
	if v29 then
		local v30 = v_u_1.ShallowCopy(v29)
		for v31, v32 in pairs(p28 or {}) do
			v30[v31] = v32
		end
		p27.TextColor3 = v30.TextColor or Color3.new(1, 1, 1)
		local v33 = v30.Stroke and v30.Stroke.StrokeColor or Color3.new(0, 0, 0)
		local v34 = v_u_1.GetAllChildrenOfClass(p27, "UIStroke")
		if #v34 == 0 and v30.Stroke then
			local v35 = Instance.new("UIStroke")
			v35.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			v35.Color = v33
			v35.Parent = p27
		else
			for _, v36 in pairs(v34) do
				if v36 and v36.ApplyStrokeMode == Enum.ApplyStrokeMode.Contextual then
					if v36.Color ~= v33 then
						v36.Color = v33
					end
				elseif v30.Stroke then
					local v37 = Instance.new("UIStroke")
					v37.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
					v37.Color = v33
					v37.Parent = p27
				end
			end
		end
		local v38 = p27:FindFirstChildOfClass("UIGradient")
		if v38 then
			v38:Destroy()
		end
		if v30.Gradient then
			v30.Gradient:Clone().Parent = p27
		end
	end
end
function v_u_2.LoadImageDesign(_, p39, p40)
	-- upvalues: (copy) v_u_2
	local v41 = v_u_2[p39]
	if v41 then
		v41.Gradient:Clone().Parent = p40
	end
end
return v_u_2

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.SavedDesigns.Gradients.Rainbow
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("TweenService")
while true do
	for _, v2 in {
		Color3.fromRGB(221, 255, 69),
		Color3.fromRGB(255, 102, 105),
		Color3.fromRGB(111, 198, 94),
		Color3.fromRGB(255, 104, 29),
		Color3.fromRGB(255, 200, 61),
		Color3.fromRGB(85, 255, 255),
		Color3.fromRGB(255, 170, 255)
	} do
		v1:Create(script.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["TextColor3"] = v2
		}):Play()
		task.wait(1)
	end
	task.wait(1)
end

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.SavedDesigns.Rainbow.One Way Gradient
-- CLASS: LocalScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("RunService")
local v_u_2 = script.Parent
v1.Heartbeat:Connect(function()
	-- upvalues: (copy) v_u_2
	local v3 = tick() % 5 / 5
	local v4 = {}
	for v5 = 1, 11 do
		local v6 = Color3.fromHSV(v3 - (v5 - 1) / 10, 1, 1)
		if v3 - (v5 - 1) / 10 < 0 then
			v6 = Color3.fromHSV(v3 - (v5 - 1) / 10 + 1, 1, 1)
		end
		local v7 = ColorSequenceKeypoint.new((v5 - 1) / 10, v6)
		table.insert(v4, v7)
	end
	v_u_2.Color = ColorSequence.new(v4)
end)

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.Validators
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

return {
	["ValidateInput"] = function(_, p1, p2)
		if type(p1) == p2 then
			if type(p1) == "string" then
				if p1 == "\237\160\128" then
					return false
				end
				if utf8.len(p1) == nil then
					return false
				end
				if #p1 > 40 then
					return
				end
			elseif type(p1) == "number" and (p1 == (1 / 0) or p1 == (-1 / 0)) then
				return false
			end
			return p1 == p1
		end
	end
}

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.CharacterUtil
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_13 = {
	["GetHumanoid"] = function(p1)
		if p1 then
			return (p1.Character or p1.CharacterAdded:Wait()):WaitForChild("Humanoid")
		else
			return nil
		end
	end,
	["SetPlayerSpeed"] = function(p2, p3)
		-- upvalues: (copy) v_u_13
		local v4 = v_u_13.GetHumanoid(p2)
		if v4 then
			v4.WalkSpeed = p3
		else
			warn("Could not set speed - Humanoid not found for player:", p2.Name)
		end
	end,
	["ResetPlayerSpeed"] = function(p5)
		-- upvalues: (copy) v_u_13
		v_u_13.SetPlayerSpeed(p5, 16)
	end,
	["GetEquippedTool"] = function(p6)
		local v7 = p6.Character or p6.CharacterAdded:Wait()
		if not v7 then
			return nil
		end
		for _, v8 in ipairs(v7:GetChildren()) do
			if v8:IsA("Tool") then
				return v8
			end
		end
		return nil
	end,
	["EquipToolByName"] = function(p9, p10)
		if p10 then
			local v11 = p9:WaitForChild("Backpack"):FindFirstChild(p10)
			local v12 = p9.Character or p9.CharacterAdded:Wait()
			if v12 then
				v12 = v12:FindFirstChildOfClass("Humanoid")
			end
			if v11 and v12 then
				v12:EquipTool(v11)
			end
		end
	end
}
return v_u_13

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.HelpfulFunctions
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("BadgeService")
local v_u_2 = game:GetService("MessagingService")
local v_u_49 = {
	["GetDataFromPath"] = function(p3, p4)
		for v5 = 1, #p4 do
			p3 = p3[p4[v5]]
		end
		return p3
	end,
	["SearchForKey"] = function(p6, p7)
		-- upvalues: (copy) v_u_49
		for v8, v9 in pairs(p6) do
			if v8 == p7 then
				return v9
			end
			if type(v9) == "table" then
				local v10 = v_u_49.SearchForKey(v9, p7)
				if v10 ~= nil then
					return v10
				end
			end
		end
		return nil
	end,
	["getRandomKeyFromDictionary"] = function(p11)
		local v12 = {}
		for v13, _ in pairs(p11) do
			table.insert(v12, v13)
		end
		return v12[math.random(1, #v12)]
	end,
	["shuffleTable"] = function(p14)
		for v15 = #p14, 2, -1 do
			local v16 = math.random(v15)
			local v17 = p14[v16]
			local v18 = p14[v15]
			p14[v15] = v17
			p14[v16] = v18
		end
		return p14
	end,
	["getRandomItem"] = function(p19)
		local v20 = 0
		local v21 = {}
		for v22, v23 in pairs(p19) do
			v20 = v20 + v23.Rarity
			table.insert(v21, {
				["item"] = v22,
				["weight"] = v20
			})
		end
		local v24 = math.random(1, v20)
		for _, v25 in ipairs(v21) do
			if v24 <= v25.weight then
				return v25.item
			end
		end
	end,
	["AwardBadge"] = function(p26, p27)
		-- upvalues: (copy) v_u_1
		if not v_u_1:UserHasBadgeAsync(p26.UserId, p27) then
			local v28, v29 = pcall(v_u_1.GetBadgeInfoAsync, v_u_1, p27)
			if v28 and v29.IsEnabled then
				local v30, _ = pcall(v_u_1.AwardBadge, v_u_1, p26.UserId, p27)
				if not v30 then
					return
				end
			end
		end
	end,
	["GlobalAlert"] = function(p_u_31)
		-- upvalues: (copy) v_u_2
		task.spawn(function()
			-- upvalues: (ref) v_u_2, (copy) p_u_31
			v_u_2:PublishAsync("GlobalMessages", "[GLOBAL] " .. p_u_31)
		end)
	end,
	["GetAllChildrenOfClass"] = function(p32, p33)
		local v34 = {}
		for _, v35 in pairs(p32:GetChildren()) do
			if v35:IsA(p33) then
				table.insert(v34, v35)
			end
		end
		return v34
	end,
	["ShallowCopy"] = function(p36)
		local v37 = {}
		for v38, v39 in pairs(p36) do
			v37[v38] = v39
		end
		return v37
	end,
	["CountDictionary"] = function(p40)
		local v41 = 0
		for _, _ in pairs(p40) do
			v41 = v41 + 1
		end
		return v41
	end,
	["RGBToHex"] = function(p42)
		local v43 = p42.r * 255
		local v44 = math.floor(v43)
		local v45 = p42.g * 255
		local v46 = math.floor(v45)
		local v47 = p42.b * 255
		local v48 = math.floor(v47)
		return string.format("#%02X%02X%02X", v44, v46, v48)
	end
}
local v_u_50 = Random.new()
function v_u_49.GetRandomItemFromDictionaryOriginal(p51, p52)
	-- upvalues: (copy) v_u_50
	local v53 = {}
	local v54 = 0
	for v55, v56 in pairs(p51) do
		local v57 = v56.Rarity ^ (1 / (1 + (p52 - 1) * 0.1))
		v53[v55] = v57
		v54 = v54 + v57
	end
	local v58 = v_u_50:NextNumber(0, v54)
	local v59 = 0
	for v60, v61 in pairs(v53) do
		v59 = v59 + v61
		if v58 <= v59 then
			return v60
		end
	end
end
function v_u_49.GetRandomItemFromDictionary(p62, p63)
	-- upvalues: (copy) v_u_50
	local v64 = {}
	local v65 = 0
	for v66, v67 in pairs(p62) do
		local v68 = (1 / v67.Rarity) ^ (1 + p63 * 0.1)
		v64[v66] = v68
		v65 = v65 + v68
	end
	local v69 = v_u_50:NextNumber(0, v65)
	local v70 = 0
	for v71, v72 in pairs(v64) do
		v70 = v70 + v72
		if v69 <= v70 then
			return v71
		end
	end
end
function v_u_49.TestDropRates(p73, p74, p75)
	-- upvalues: (copy) v_u_49
	local v76 = {}
	for v77, _ in pairs(p73) do
		v76[v77] = 0
	end
	for _ = 1, p75 do
		local v78 = v_u_49.GetRandomItemFromDictionary(p73, p74)
		if v78 then
			v76[v78] = v76[v78] + 1
		end
	end
	local v79 = {}
	for v80, v81 in pairs(v76) do
		v79[v80] = v81 / p75 * 100
	end
	local v82 = {}
	for v83, v84 in pairs(v79) do
		table.insert(v82, {
			["item"] = v83,
			["percentage"] = v84
		})
	end
	table.sort(v82, function(p85, p86)
		return p85.percentage > p86.percentage
	end)
	print("Drop rates after", p75, "rolls with luck =", p74)
	for _, v87 in ipairs(v82) do
		print(v87.item, ":", string.format("%.2f", v87.percentage), "%")
	end
end
return v_u_49

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.VfxManager
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

return {
	["Emit"] = function(p1)
		for _, v_u_2 in p1:GetDescendants() do
			if v_u_2:IsA("ParticleEmitter") ~= false and v_u_2.Name ~= "ONLY_CRIT" then
				if v_u_2:GetAttribute("EmitDelay") == nil or v_u_2:GetAttribute("EmitDelay") <= 0 then
					if v_u_2:GetAttribute("EmitDuration") == nil or v_u_2:GetAttribute("EmitDuration") <= 0 then
						v_u_2:Emit(v_u_2:GetAttribute("EmitCount"))
					else
						v_u_2.Enabled = true
						task.delay(v_u_2:GetAttribute("EmitDuration"), function()
							-- upvalues: (copy) v_u_2
							v_u_2.Enabled = false
						end)
					end
				else
					task.delay(v_u_2:GetAttribute("EmitDelay"), function()
						-- upvalues: (copy) v_u_2
						v_u_2:Emit(v_u_2:GetAttribute("EmitCount"))
					end)
				end
			end
		end
	end,
	["Emit_Only_Crit"] = function(p3)
		for _, v_u_4 in p3:GetDescendants() do
			if v_u_4:IsA("ParticleEmitter") ~= false and v_u_4.Name == "ONLY_CRIT" then
				if v_u_4:GetAttribute("EmitDelay") == nil or v_u_4:GetAttribute("EmitDelay") <= 0 then
					if v_u_4:GetAttribute("EmitDuration") == nil or v_u_4:GetAttribute("EmitDuration") <= 0 then
						v_u_4:Emit(v_u_4:GetAttribute("EmitCount"))
					else
						v_u_4.Enabled = true
						task.delay(v_u_4:GetAttribute("EmitDuration"), function()
							-- upvalues: (copy) v_u_4
							v_u_4.Enabled = false
						end)
					end
				else
					task.delay(v_u_4:GetAttribute("EmitDelay"), function()
						-- upvalues: (copy) v_u_4
						v_u_4:Emit(v_u_4:GetAttribute("EmitCount"))
					end)
				end
			end
		end
	end,
	["Enable"] = function(p5, p6)
		for _, v7 in p5:GetDescendants() do
			if v7:IsA("ParticleEmitter") or (v7:IsA("Beam") or v7:IsA("Trail")) then
				v7.Enabled = p6
			end
		end
	end
}

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.Janitor
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = require(script.Promise)
local v_u_2 = setmetatable({}, {
	["__tostring"] = function()
		return "LinkToInstanceIndex"
	end
})
local v_u_3 = {
	["ClassName"] = "Janitor",
	["CurrentlyCleaning"] = true,
	["SuppressInstanceReDestroy"] = false
}
v_u_3.__index = v_u_3
local v_u_4 = setmetatable({}, {
	["__mode"] = "k"
})
local v_u_5 = {
	["function"] = true,
	["thread"] = true,
	["RBXScriptConnection"] = "Disconnect"
}
function v_u_3.new()
	-- upvalues: (copy) v_u_3
	local v6 = v_u_3
	return setmetatable({
		["CurrentlyCleaning"] = false
	}, v6)
end
function v_u_3.Is(p7)
	-- upvalues: (copy) v_u_3
	local v8
	if type(p7) == "table" then
		v8 = getmetatable(p7) == v_u_3
	else
		v8 = false
	end
	return v8
end
v_u_3.instanceof = v_u_3.Is
local function v_u_16(p9, p10)
	-- upvalues: (copy) v_u_4
	local v11 = v_u_4[p9]
	if v11 then
		local v_u_12 = v11[p10]
		if not v_u_12 then
			return p9
		end
		local v13 = p9[v_u_12]
		if v13 then
			if v13 == true then
				if type(v_u_12) == "function" then
					v_u_12()
				else
					local v14
					if coroutine.running() == v_u_12 then
						v14 = nil
					else
						v14 = pcall(function()
							-- upvalues: (copy) v_u_12
							task.cancel(v_u_12)
						end)
					end
					if not v14 then
						task.defer(function()
							-- upvalues: (copy) v_u_12
							task.cancel(v_u_12)
						end)
					end
				end
			else
				local v15 = v_u_12[v13]
				if v15 then
					if p9.SuppressInstanceReDestroy and (v13 == "Destroy" and typeof(v_u_12) == "Instance") then
						pcall(v15, v_u_12)
					else
						v15(v_u_12)
					end
				end
			end
			p9[v_u_12] = nil
		end
		v11[p10] = nil
	end
	return p9
end
local function v_u_24(p17, p18, p19, p20)
	-- upvalues: (copy) v_u_16, (copy) v_u_4, (copy) v_u_5
	if p20 then
		v_u_16(p17, p20)
		local v21 = v_u_4[p17]
		if not v21 then
			v21 = {}
			v_u_4[p17] = v21
		end
		v21[p20] = p18
	end
	local v22 = typeof(p18)
	local v23 = p19 or (v_u_5[v22] or "Destroy")
	if v22 == "function" or v22 == "thread" then
		if v23 ~= true then
			warn(string.format("Object is a %* and as such expected `true?` for the method name and instead got %*. Traceback: %*", v22, tostring(v23), debug.traceback(nil, 2)))
		end
	elseif not p18[v23] then
		warn(string.format("Object %* doesn\'t have method %*, are you sure you want to add it? Traceback: %*", tostring(p18), tostring(v23), debug.traceback(nil, 2)))
	end
	p17[p18] = v23
	return p18
end
v_u_3.Add = v_u_24
function v_u_3.AddObject(p25, p26, p27, p28, ...)
	-- upvalues: (copy) v_u_24
	return v_u_24(p25, p26.new(...), p27, p28)
end
function v_u_3.AddPromise(p_u_29, p_u_30)
	-- upvalues: (copy) v_u_1, (copy) v_u_24, (copy) v_u_16
	if not v_u_1 then
		return p_u_30
	end
	if not v_u_1.is(p_u_30) then
		error(string.format("Invalid argument #1 to \'Janitor:AddPromise\' (Promise expected, got %* (%*)) Traceback: %*", typeof(p_u_30), tostring(p_u_30), debug.traceback(nil, 2)))
	end
	if p_u_30:getStatus() ~= v_u_1.Status.Started then
		return p_u_30
	end
	local v_u_31 = newproxy(false)
	local v34 = v_u_24(p_u_29, v_u_1.new(function(p32, _, p33)
		-- upvalues: (copy) p_u_30
		if not p33(function()
			-- upvalues: (ref) p_u_30
			p_u_30:cancel()
		end) then
			p32(p_u_30)
		end
	end), "cancel", v_u_31)
	v34:finally(function()
		-- upvalues: (ref) v_u_16, (copy) p_u_29, (copy) v_u_31
		v_u_16(p_u_29, v_u_31)
	end)
	return v34
end
v_u_3.Remove = v_u_16
function v_u_3.RemoveNoClean(p35, p36)
	-- upvalues: (copy) v_u_4
	local v37 = v_u_4[p35]
	local v38 = v37 and v37[p36]
	if v38 then
		p35[v38] = nil
		v37[p36] = nil
	end
	return p35
end
function v_u_3.RemoveList(p39, ...)
	-- upvalues: (copy) v_u_4, (copy) v_u_16
	if v_u_4[p39] then
		local v40 = select("#", ...)
		if v40 == 1 then
			return v_u_16(p39, ...)
		end
		if v40 == 2 then
			local v41, v42 = ...
			v_u_16(p39, v41)
			v_u_16(p39, v42)
			return p39
		end
		if v40 == 3 then
			local v43, v44, v45 = ...
			v_u_16(p39, v43)
			v_u_16(p39, v44)
			v_u_16(p39, v45)
			return p39
		end
		for v46 = 1, v40 do
			v_u_16(p39, (select(v46, ...)))
		end
	end
	return p39
end
function v_u_3.RemoveListNoClean(p47, ...)
	-- upvalues: (copy) v_u_4
	local v48 = v_u_4[p47]
	if v48 then
		local v49 = select("#", ...)
		if v49 == 1 then
			local v50 = ...
			local v51 = v48[v50]
			if v51 then
				p47[v51] = nil
				v48[v50] = nil
			end
			return p47
		end
		if v49 == 2 then
			local v52, v53 = ...
			local v54 = v48[v52]
			if v54 then
				p47[v54] = nil
				v48[v52] = nil
			end
			local v55 = v48[v53]
			if v55 then
				p47[v55] = nil
				v48[v53] = nil
			end
			return p47
		end
		if v49 == 3 then
			local v56, v57, v58 = ...
			local v59 = v48[v56]
			if v59 then
				p47[v59] = nil
				v48[v56] = nil
			end
			local v60 = v48[v57]
			if v60 then
				p47[v60] = nil
				v48[v57] = nil
			end
			local v61 = v48[v58]
			if v61 then
				p47[v61] = nil
				v48[v58] = nil
			end
			return p47
		end
		for v62 = 1, v49 do
			local v63 = select(v62, ...)
			local v64 = v48[v63]
			if v64 then
				p47[v64] = nil
				v48[v63] = nil
			end
		end
	end
	return p47
end
function v_u_3.Get(p65, p66)
	-- upvalues: (copy) v_u_4
	local v67 = v_u_4[p65]
	if v67 then
		return v67[p66]
	else
		return nil
	end
end
function v_u_3.GetAll(p68)
	-- upvalues: (copy) v_u_4
	local v69 = v_u_4[p68]
	return not v69 and {} or table.freeze(table.clone(v69))
end
local function v_u_79(p_u_70)
	-- upvalues: (copy) v_u_4
	if not p_u_70.CurrentlyCleaning then
		p_u_70.CurrentlyCleaning = nil
		local function v73()
			-- upvalues: (copy) p_u_70
			for v71, v72 in next, p_u_70 do
				if v71 ~= "SuppressInstanceReDestroy" then
					return v71, v72
				end
			end
		end
		local v_u_74, v75 = v73()
		while v_u_74 and v75 do
			if v75 == true then
				if type(v_u_74) == "function" then
					v_u_74()
				elseif type(v_u_74) == "thread" then
					local v76
					if coroutine.running() == v_u_74 then
						v76 = nil
					else
						v76 = pcall(function()
							-- upvalues: (ref) v_u_74
							task.cancel(v_u_74)
						end)
					end
					if not v76 then
						task.defer(function()
							-- upvalues: (copy) v_u_74
							task.cancel(v_u_74)
						end)
					end
				end
			else
				local v77 = v_u_74[v75]
				if v77 then
					if p_u_70.SuppressInstanceReDestroy and (v75 == "Destroy" and typeof(v_u_74) == "Instance") then
						pcall(v77, v_u_74)
					else
						v77(v_u_74)
					end
				end
			end
			p_u_70[v_u_74] = nil
			v_u_74, v75 = v73()
		end
		local v78 = v_u_4[p_u_70]
		if v78 then
			table.clear(v78)
			v_u_4[p_u_70] = nil
		end
		p_u_70.CurrentlyCleaning = false
	end
end
v_u_3.Cleanup = v_u_79
function v_u_3.Destroy(p80)
	-- upvalues: (copy) v_u_79
	v_u_79(p80)
	table.clear(p80)
	setmetatable(p80, nil)
end
v_u_3.__call = v_u_79
local function v_u_85(p_u_81, p82, p83)
	-- upvalues: (copy) v_u_2, (copy) v_u_24, (copy) v_u_79
	local v84
	if p83 then
		v84 = newproxy(false)
	else
		v84 = v_u_2
	end
	return v_u_24(p_u_81, p82.Destroying:Connect(function()
		-- upvalues: (ref) v_u_79, (copy) p_u_81
		v_u_79(p_u_81)
	end), "Disconnect", v84)
end
v_u_3.LinkToInstance = v_u_85
v_u_3.LegacyLinkToInstance = v_u_85
function v_u_3.LinkToInstances(p86, ...)
	-- upvalues: (copy) v_u_3, (copy) v_u_85
	local v87 = v_u_3.new()
	for v88 = 1, select("#", ...) do
		local v89 = select(v88, ...)
		if typeof(v89) == "Instance" then
			v87:Add(v_u_85(p86, v89, true), "Disconnect")
		end
	end
	return v87
end
function v_u_3.__tostring(_)
	return "Janitor"
end
return v_u_3

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.Janitor.Promise
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = script.Parent.Packages
if v1:FindFirstChild("Promise") then
	return require(v1.Promise)
else
	return nil
end

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.TextGuiUtils
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

return {
	["TypewriterEffect"] = function(p1, p2, p3)
		local v4 = p3 and (p3.delay or 0.05) or 0.05
		local v5
		if p3 then
			v5 = p3.onUpdate
		else
			v5 = p3
		end
		if p3 then
			p3 = p3.onComplete
		end
		p1.Text = ""
		for v6 = 1, #p2 do
			local v7 = string.sub(p2, 1, v6)
			p1.Text = v7
			if v5 then
				v5(v7)
			end
			task.wait(v4)
		end
		if p3 then
			p3()
		end
	end
}

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.WeatherUtils
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Configs.EventConfig)
return {
	["GetActiveWeathers"] = function()
		-- upvalues: (copy) v_u_1
		local v3 = {}
		for _, v4 in v_u_1.ActiveWeathers:GetChildren() do
			local v5 = v4.Name
			table.insert(v3, v5)
		end
		return v3
	end,
	["GetActiveEvents"] = function()
		-- upvalues: (copy) v_u_1
		local v6 = {}
		for _, v7 in v_u_1.ActiveEvents:GetChildren() do
			local v8 = v7.Name
			table.insert(v6, v8)
		end
		return v6
	end,
	["GetActiveTraitEvents"] = function()
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		local v9 = {}
		for _, v10 in v_u_1.ActiveEvents:GetChildren() do
			local v11 = v_u_2[v10.Name]
			if v11 and v11.type == "traitEvent" then
				local v12 = v11.id
				table.insert(v9, v12)
			end
		end
		return v9
	end
}

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.CameraShaker
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = {}
v_u_1.__index = v_u_1
local v_u_2 = debug.profilebegin
local v_u_3 = debug.profileend
local v4 = Vector3.new
local v_u_5 = CFrame.new
local v_u_6 = CFrame.Angles
local v_u_7 = math.rad
local v_u_8 = v4()
local v_u_9 = require(script.CameraShakeInstance)
local v_u_10 = v_u_9.CameraShakeState
v_u_1.CameraShakeInstance = v_u_9
v_u_1.Presets = require(script.CameraShakePresets)
function v_u_1.new(p11, p12)
	-- upvalues: (copy) v_u_8, (copy) v_u_1
	local v13 = type(p11) == "number"
	assert(v13, "RenderPriority must be a number (e.g.: Enum.RenderPriority.Camera.Value)")
	local v14 = type(p12) == "function"
	assert(v14, "Callback must be a function")
	local v15 = {
		["_running"] = false,
		["_renderName"] = "CameraShaker",
		["_renderPriority"] = p11,
		["_posAddShake"] = v_u_8,
		["_rotAddShake"] = v_u_8,
		["_camShakeInstances"] = {},
		["_removeInstances"] = {},
		["_callback"] = p12
	}
	local v16 = v_u_1
	return setmetatable(v15, v16)
end
function v_u_1.Start(p_u_17)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if not p_u_17._running then
		p_u_17._running = true
		local v_u_18 = p_u_17._callback
		game:GetService("RunService"):BindToRenderStep(p_u_17._renderName, p_u_17._renderPriority, function(p19)
			-- upvalues: (ref) v_u_2, (copy) p_u_17, (ref) v_u_3, (copy) v_u_18
			v_u_2("CameraShakerUpdate")
			local v20 = p_u_17:Update(p19)
			v_u_3()
			v_u_18(v20)
		end)
	end
end
function v_u_1.Stop(p21)
	if p21._running then
		game:GetService("RunService"):UnbindFromRenderStep(p21._renderName)
		p21._running = false
	end
end
function v_u_1.StopSustained(p22, p23)
	for _, v24 in pairs(p22._camShakeInstances) do
		if v24.fadeOutDuration == 0 then
			v24:StartFadeOut(p23 or v24.fadeInDuration)
		end
	end
end
function v_u_1.Update(p25, p26)
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
	local v27 = v_u_8
	local v28 = v_u_8
	local v29 = p25._camShakeInstances
	for v30 = 1, #v29 do
		local v31 = v29[v30]
		local v32 = v31:GetState()
		if v32 == v_u_10.Inactive and v31.DeleteOnInactive then
			p25._removeInstances[#p25._removeInstances + 1] = v30
		elseif v32 ~= v_u_10.Inactive then
			local v33 = v31:UpdateShake(p26)
			v27 = v27 + v33 * v31.PositionInfluence
			v28 = v28 + v33 * v31.RotationInfluence
		end
	end
	for v34 = #p25._removeInstances, 1, -1 do
		local v35 = p25._removeInstances[v34]
		table.remove(v29, v35)
		p25._removeInstances[v34] = nil
	end
	return v_u_5(v27) * v_u_6(0, v_u_7(v28.Y), 0) * v_u_6(v_u_7(v28.X), 0, (v_u_7(v28.Z)))
end
function v_u_1.Shake(p36, p37)
	local v38
	if type(p37) == "table" then
		v38 = p37._camShakeInstance
	else
		v38 = false
	end
	assert(v38, "ShakeInstance must be of type CameraShakeInstance")
	p36._camShakeInstances[#p36._camShakeInstances + 1] = p37
	return p37
end
function v_u_1.ShakeSustain(p39, p40)
	local v41
	if type(p40) == "table" then
		v41 = p40._camShakeInstance
	else
		v41 = false
	end
	assert(v41, "ShakeInstance must be of type CameraShakeInstance")
	p39._camShakeInstances[#p39._camShakeInstances + 1] = p40
	p40:StartFadeIn(p40.fadeInDuration)
	return p40
end
function v_u_1.ShakeOnce(p42, p43, p44, p45, p46, p47, p48)
	-- upvalues: (copy) v_u_9
	local v49 = v_u_9.new(p43, p44, p45, p46)
	v49.PositionInfluence = typeof(p47) == "Vector3" and p47 and p47 or Vector3.new(0.15, 0.15, 0.15)
	v49.RotationInfluence = typeof(p48) == "Vector3" and p48 and p48 or Vector3.new(1, 1, 1)
	p42._camShakeInstances[#p42._camShakeInstances + 1] = v49
	return v49
end
function v_u_1.StartShake(p50, p51, p52, p53, p54, p55)
	-- upvalues: (copy) v_u_9
	local v56 = v_u_9.new(p51, p52, p53)
	v56.PositionInfluence = typeof(p54) == "Vector3" and p54 and p54 or Vector3.new(0.15, 0.15, 0.15)
	v56.RotationInfluence = typeof(p55) == "Vector3" and p55 and p55 or Vector3.new(1, 1, 1)
	v56:StartFadeIn(p53)
	p50._camShakeInstances[#p50._camShakeInstances + 1] = v56
	return v56
end
return v_u_1

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.CameraShaker.CameraShakeInstance
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = {}
v_u_1.__index = v_u_1
local v_u_2 = Vector3.new
local v_u_3 = math.noise
v_u_1.CameraShakeState = {
	["FadingIn"] = 0,
	["FadingOut"] = 1,
	["Sustained"] = 2,
	["Inactive"] = 3
}
function v_u_1.new(p4, p5, p6, p7)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v8 = p6 == nil and 0 or p6
	local v9 = p7 == nil and 0 or p7
	local v10 = type(p4) == "number"
	assert(v10, "Magnitude must be a number")
	local v11 = type(p5) == "number"
	assert(v11, "Roughness must be a number")
	local v12 = type(v8) == "number"
	assert(v12, "FadeInTime must be a number")
	local v13 = type(v9) == "number"
	assert(v13, "FadeOutTime must be a number")
	local v14 = {
		["Magnitude"] = p4,
		["Roughness"] = p5,
		["PositionInfluence"] = v_u_2(),
		["RotationInfluence"] = v_u_2(),
		["DeleteOnInactive"] = true,
		["roughMod"] = 1,
		["magnMod"] = 1,
		["fadeOutDuration"] = v9,
		["fadeInDuration"] = v8,
		["sustain"] = v8 > 0,
		["currentFadeTime"] = v8 > 0 and 0 or 1,
		["tick"] = Random.new():NextNumber(-100, 100),
		["_camShakeInstance"] = true
	}
	local v15 = v_u_1
	return setmetatable(v14, v15)
end
function v_u_1.UpdateShake(p16, p17)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v18 = p16.tick
	local v19 = p16.currentFadeTime
	local v20 = v_u_2(v_u_3(v18, 0) * 0.5, v_u_3(0, v18) * 0.5, v_u_3(v18, v18) * 0.5)
	if p16.fadeInDuration > 0 and p16.sustain then
		if v19 < 1 then
			v19 = v19 + p17 / p16.fadeInDuration
		elseif p16.fadeOutDuration > 0 then
			p16.sustain = false
		end
	end
	if not p16.sustain then
		v19 = v19 - p17 / p16.fadeOutDuration
	end
	if p16.sustain then
		p16.tick = v18 + p17 * p16.Roughness * p16.roughMod
	else
		p16.tick = v18 + p17 * p16.Roughness * p16.roughMod * v19
	end
	p16.currentFadeTime = v19
	return v20 * p16.Magnitude * p16.magnMod * v19
end
function v_u_1.StartFadeOut(p21, p22)
	if p22 == 0 then
		p21.currentFadeTime = 0
	end
	p21.fadeOutDuration = p22
	p21.fadeInDuration = 0
	p21.sustain = false
end
function v_u_1.StartFadeIn(p23, p24)
	if p24 == 0 then
		p23.currentFadeTime = 1
	end
	p23.fadeInDuration = p24 or p23.fadeInDuration
	p23.fadeOutDuration = 0
	p23.sustain = true
end
function v_u_1.GetScaleRoughness(p25)
	return p25.roughMod
end
function v_u_1.SetScaleRoughness(p26, p27)
	p26.roughMod = p27
end
function v_u_1.GetScaleMagnitude(p28)
	return p28.magnMod
end
function v_u_1.SetScaleMagnitude(p29, p30)
	p29.magnMod = p30
end
function v_u_1.GetNormalizedFadeTime(p31)
	return p31.currentFadeTime
end
function v_u_1.IsShaking(p32)
	return p32.currentFadeTime > 0 and true or p32.sustain
end
function v_u_1.IsFadingOut(p33)
	local v34 = not p33.sustain
	if v34 then
		v34 = p33.currentFadeTime > 0
	end
	return v34
end
function v_u_1.IsFadingIn(p35)
	local v36 = p35.currentFadeTime < 1 and p35.sustain
	if v36 then
		v36 = p35.fadeInDuration > 0
	end
	return v36
end
function v_u_1.GetState(p37)
	-- upvalues: (copy) v_u_1
	if p37:IsFadingIn() then
		return v_u_1.CameraShakeState.FadingIn
	elseif p37:IsFadingOut() then
		return v_u_1.CameraShakeState.FadingOut
	elseif p37:IsShaking() then
		return v_u_1.CameraShakeState.Sustained
	else
		return v_u_1.CameraShakeState.Inactive
	end
end
return v_u_1

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.CameraShaker.CameraShakePresets
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = require(script.Parent.CameraShakeInstance)
local v_u_9 = {
	["Bump"] = function()
		-- upvalues: (copy) v_u_1
		local v2 = v_u_1.new(4.5, 10, 0.1, 0.75)
		v2.PositionInfluence = Vector3.new(0.15, 0.15, 0.15)
		v2.RotationInfluence = Vector3.new(1, 1, 1)
		return v2
	end,
	["Explosion"] = function()
		-- upvalues: (copy) v_u_1
		local v3 = v_u_1.new(8, 16, 0.2, 1.5)
		v3.PositionInfluence = Vector3.new(0.25, 0.25, 0.25)
		v3.RotationInfluence = Vector3.new(4, 1, 1)
		return v3
	end,
	["Earthquake"] = function()
		-- upvalues: (copy) v_u_1
		local v4 = v_u_1.new(0.6, 3.5, 2, 10)
		v4.PositionInfluence = Vector3.new(0.25, 0.25, 0.25)
		v4.RotationInfluence = Vector3.new(1, 1, 4)
		return v4
	end,
	["BadTrip"] = function()
		-- upvalues: (copy) v_u_1
		local v5 = v_u_1.new(10, 0.15, 5, 10)
		v5.PositionInfluence = Vector3.new(0, 0, 0.15)
		v5.RotationInfluence = Vector3.new(2, 1, 4)
		return v5
	end,
	["HandheldCamera"] = function()
		-- upvalues: (copy) v_u_1
		local v6 = v_u_1.new(1, 0.25, 5, 10)
		v6.PositionInfluence = Vector3.new(0, 0, 0)
		v6.RotationInfluence = Vector3.new(1, 0.5, 0.5)
		return v6
	end,
	["Vibration"] = function()
		-- upvalues: (copy) v_u_1
		local v7 = v_u_1.new(0.4, 20, 2, 2)
		v7.PositionInfluence = Vector3.new(0, 0.15, 0)
		v7.RotationInfluence = Vector3.new(1.25, 0, 4)
		return v7
	end,
	["RoughDriving"] = function()
		-- upvalues: (copy) v_u_1
		local v8 = v_u_1.new(1, 2, 1, 1)
		v8.PositionInfluence = Vector3.new(0, 0, 0)
		v8.RotationInfluence = Vector3.new(1, 1, 1)
		return v8
	end
}
return setmetatable({}, {
	["__index"] = function(_, p10)
		-- upvalues: (copy) v_u_9
		local v11 = v_u_9[p10]
		if type(v11) == "function" then
			return v11()
		end
		error("No preset found with index \"" .. p10 .. "\"")
	end
})

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.UIUtils
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

game:GetService("Debris")
return {
	["FindFirstByLayoutOrder"] = function(p1, p2)
		local v3 = nil
		for _, v4 in p1 do
			if v4:IsA("GuiObject") then
				if v3 then
					if not p2 and v4.LayoutOrder < v3.LayoutOrder or p2 and v4.LayoutOrder > v3.LayoutOrder then
						v3 = v4
					end
				else
					v3 = v4
				end
			end
		end
		return v3
	end
}

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.AnimationManager
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = require(script.Config)
local v_u_2 = {}
v_u_2.__index = v_u_2
local v_u_3 = setmetatable({}, {
	["__mode"] = "k"
})
function v_u_2.Get(p4)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	if v_u_3[p4] then
		return v_u_3[p4]
	end
	local v5 = v_u_2
	local v_u_6 = setmetatable({}, v5)
	v_u_6.root = p4
	v_u_6.animator = nil
	v_u_6.tracks = {}
	v_u_6.connections = {}
	v_u_3[p4] = v_u_6
	v_u_6:_FindAnimator()
	v_u_6.connections.Destroying = p4.Destroying:Connect(function()
		-- upvalues: (copy) v_u_6
		v_u_6:Destroy()
	end)
	return v_u_6
end
function v_u_2._FindAnimator(p7)
	local v8 = p7.root:FindFirstChildOfClass("Humanoid") or p7.root:FindFirstChildOfClass("AnimationController")
	if not v8 then
		local v_u_9 = coroutine.running()
		local v_u_10 = nil
		local v_u_11 = false
		v_u_10 = p7.root.ChildAdded:Connect(function(p12)
			-- upvalues: (ref) v_u_11, (ref) v_u_10, (copy) v_u_9
			if (p12:IsA("Humanoid") or p12:IsA("AnimationController")) and not v_u_11 then
				v_u_11 = true
				v_u_10:Disconnect()
				task.spawn(v_u_9, p12)
			end
		end)
		task.delay(5, function()
			-- upvalues: (ref) v_u_11, (ref) v_u_10, (copy) v_u_9
			if not v_u_11 then
				v_u_11 = true
				v_u_10:Disconnect()
				task.spawn(v_u_9, nil)
			end
		end)
		v8 = coroutine.yield()
	end
	if v8 then
		p7.animator = v8:FindFirstChildOfClass("Animator") or Instance.new("Animator", v8)
	else
		warn("[AnimationManager] Timed out waiting for Humanoid/AnimationController in", p7.root.Name)
	end
end
function v_u_2._ResolveId(_, p13)
	-- upvalues: (copy) v_u_1
	local v14
	if type(p13) == "string" and v_u_1.ANIMATIONS[p13] then
		v14 = v_u_1.ANIMATIONS[p13]
	else
		v14 = p13
	end
	local v15 = tostring(v14)
	if tonumber(v15) then
		return "rbxassetid://" .. v15
	end
	if v15:find("rbxassetid://") then
		return v15
	end
	warn("[AnimationManager] Could not resolve animation ID for:", p13)
	return nil
end
function v_u_2.Load(p16, p17, p18)
	if not p16.animator then
		return nil
	end
	local v19 = p16:_ResolveId(p17)
	if not v19 then
		return nil
	end
	local v20 = p16.tracks[v19]
	if not v20 then
		local v21 = Instance.new("Animation")
		v21.AnimationId = v19
		v20 = p16.animator:LoadAnimation(v21)
		v20.Name = v19
		p16.tracks[v19] = v20
		v21:Destroy()
	end
	local v22 = p18 or {}
	if v22.priority then
		v20.Priority = v22.priority
	end
	if v22.looped ~= nil then
		v20.Looped = v22.looped
	end
	return v20
end
function v_u_2.Play(p23, p24, p25)
	if not p23.animator then
		return nil
	end
	local v26 = p23:_ResolveId(p24)
	if v26 then
		local v27 = p25 or {}
		local v28 = p23.tracks[v26]
		if not v28 then
			local v29 = Instance.new("Animation")
			v29.AnimationId = v26
			v28 = p23.animator:LoadAnimation(v29)
			v28.Name = v26
			p23.tracks[v26] = v28
			v29:Destroy()
		end
		local v30 = v27.speed or 1
		if v27.duration then
			v30 = v28.Length <= 0 and 1 or v28.Length / v27.duration
		end
		local v31 = v27 or {}
		if v31.priority then
			v28.Priority = v31.priority
		end
		if v31.looped ~= nil then
			v28.Looped = v31.looped
		end
		v28:Play(v31.fadeTime, v31.weight, v30)
		return v28
	end
end
function v_u_2.Stop(p32, p33, p34)
	local v35 = p32:_ResolveId(p33)
	if v35 then
		local v36 = p32.tracks[v35]
		if v36 and v36.IsPlaying then
			v36:Stop(p34 or 0.1)
		end
	end
end
function v_u_2.StopAll(p37, p38)
	for _, v39 in pairs(p37.tracks) do
		if v39.IsPlaying then
			v39:Stop(p38 or 0.1)
		end
	end
end
function v_u_2.Remove(p40, p41)
	local v42 = p40:_ResolveId(p41)
	if v42 then
		local v43 = p40.tracks[v42]
		if v43 then
			v43:Stop()
			v43:Destroy()
			p40.tracks[v42] = nil
		end
	end
end
function v_u_2.ConnectMarker(p44, p45, p46, p47)
	local v48 = p44:_ResolveId(p45)
	if v48 then
		local v49 = p44.tracks[v48]
		if v49 then
			return v49:GetMarkerReachedSignal(p46):Connect(p47)
		end
	end
end
function v_u_2.Destroy(p50)
	-- upvalues: (copy) v_u_3
	if p50.root then
		if p50.root then
			v_u_3[p50.root] = nil
		end
		for _, v51 in pairs(p50.tracks) do
			v51:Stop()
			v51:Destroy()
		end
		for _, v52 in pairs(p50.connections) do
			v52:Disconnect()
		end
		p50.tracks = nil
		p50.connections = nil
		p50.animator = nil
		p50.root = nil
	end
end
return v_u_2

-- ================================================================
-- PATH:  ReplicatedStorage.Shared.AnimationManager.Config
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

return {
	["ANIMATIONS"] = {}
}

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.DailyRewardConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {}
local v2 = {}
local v3 = {
	["type"] = "Currency",
	["name"] = "Cash",
	["text"] = "+100 Cash",
	["rewardHandler"] = "Currency",
	["rewardData"] = {
		["type"] = "Cash",
		["amount"] = 100
	}
}
v2[1] = v3
local v4 = {
	["type"] = "Brainrot",
	["name"] = "yoni",
	["text"] = "yoni",
	["rewardHandler"] = "Brainrot",
	["rewardData"] = {
		["type"] = "yoni"
	}
}
v2[2] = v4
local v5 = {
	["type"] = "Currency",
	["name"] = "Cash",
	["text"] = "+100M Cash",
	["rewardHandler"] = "Currency",
	["rewardData"] = {
		["type"] = "Cash",
		["amount"] = 100000000
	}
}
v2[3] = v5
local v6 = {
	["type"] = "Brainrot",
	["name"] = "burbaloni_luliloli",
	["text"] = "Burbaloni Luliloli",
	["rewardHandler"] = "Brainrot",
	["rewardData"] = {
		["type"] = "burbaloni_luliloli"
	}
}
v2[4] = v6
local v7 = {
	["type"] = "Currency",
	["name"] = "Cash",
	["text"] = "+1B Cash",
	["rewardHandler"] = "Currency",
	["rewardData"] = {
		["type"] = "Cash",
		["amount"] = 1000000000
	}
}
v2[5] = v7
local v8 = {
	["type"] = "Brainrot",
	["name"] = "trulimero_trulicina",
	["text"] = "Trulimero Trulicina",
	["rewardHandler"] = "Brainrot",
	["rewardData"] = {
		["type"] = "trulimero_trulicina"
	}
}
v2[6] = v8
local v9 = {
	["type"] = "Brainrot",
	["name"] = "agarrini_lapalini",
	["text"] = "Agarrini Lapalini",
	["rewardHandler"] = "Brainrot",
	["rewardData"] = {
		["type"] = "agarrini_lapalini"
	}
}
v2[7] = v9
v1.FIRST_WEEK = v2
v1.REPEATING_WEEK = {}
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.MonetizationConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {
	["VIP"] = {
		["type"] = "Gamepass",
		["id"] = 1735002948,
		["giftProductId"] = 3549639627,
		["defaultPrice"] = 795
	},
	["PLAYTIME_REWARD_SKIP"] = {
		["type"] = "DeveloperProduct",
		["id"] = 3549638558,
		["defaultPrice"] = 95
	},
	["STARTER_PACK"] = {
		["type"] = "DeveloperProduct",
		["id"] = 3549635686,
		["defaultPrice"] = 95
	},
	["ULTRA_PACK"] = {
		["type"] = "DeveloperProduct",
		["id"] = 3549638368,
		["defaultPrice"] = 799
	},
	["OFFLINE_CASH_MULTIPLIER"] = {
		["type"] = "DeveloperProduct",
		["id"] = 3549638949,
		["defaultPrice"] = 39,
		["multiplier"] = 10
	},
	["GALAXY_PICKAXE"] = {
		["type"] = "DeveloperProduct",
		["id"] = 3510718479,
		["defaultPrice"] = 1695,
		["fakeGamepass"] = true
	},
	["DOUBLE_CASH_GAIN"] = {
		["type"] = "Gamepass",
		["id"] = 1737320500,
		["giftProductId"] = 3549639199,
		["defaultPrice"] = 395
	}
}
local v2 = {
	["type"] = "DeveloperProduct",
	["group"] = true
}
local v3 = {
	["StrawberryLuckyBlock_1"] = {
		["id"] = 3551827278,
		["defaultPrice"] = 299,
		["luckyBlockType"] = "StrawberryLuckyBlock",
		["amount"] = 1
	},
	["StrawberryLuckyBlock_3"] = {
		["id"] = 3551826857,
		["defaultPrice"] = 895,
		["luckyBlockType"] = "StrawberryLuckyBlock",
		["amount"] = 3
	}
}
v2.items = v3
v1.LUCKY_BLOCK_PACKS = v2
v1.VOID_HUNTER = {
	["type"] = "Gamepass",
	["id"] = 1738429281,
	["giftProductId"] = 3549639377,
	["defaultPrice"] = 799
}
v1.DOUBLE_LUCK = {
	["type"] = "Gamepass",
	["id"] = 1735962619,
	["giftProductId"] = 3549639964,
	["defaultPrice"] = 195
}
local v4 = {
	["type"] = "DeveloperProduct",
	["group"] = true
}
local v5 = {
	["SEASON_PASS_1"] = {
		["id"] = 3555146598,
		["defaultPrice"] = 399,
		["key"] = "SEASON_PASS_1"
	}
}
v4.items = v5
v1.SEASON_PASS = v4
v1.REFRESH_SEASON_QUESTS = {
	["type"] = "DeveloperProduct",
	["id"] = 3555032172,
	["defaultPrice"] = 49
}
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.PlaytimeRewardConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {}
local v2 = {
	["time"] = 60,
	["reward"] = "Currency",
	["name"] = "Cash",
	["rewardData"] = {
		["type"] = "Cash",
		["amount"] = 100
	},
	["imageId"] = 1
}
local v3 = {
	["time"] = 180,
	["reward"] = "LuckyBlock",
	["name"] = "RedLuckyBlock",
	["rewardData"] = {
		["type"] = "RedLuckyBlock",
		["amount"] = 1,
		["toInventory"] = true
	},
	["imageId"] = 1
}
local v4 = {
	["time"] = 300,
	["reward"] = "Currency",
	["name"] = "Cash",
	["rewardData"] = {
		["type"] = "Cash",
		["amount"] = 10000
	},
	["imageId"] = 1
}
local v5 = {
	["time"] = 420,
	["reward"] = "LuckyBlock",
	["name"] = "GraffitiLuckyBlock",
	["rewardData"] = {
		["type"] = "GraffitiLuckyBlock",
		["amount"] = 1,
		["toInventory"] = true
	},
	["imageId"] = 1
}
local v6 = {
	["time"] = 600,
	["reward"] = "Currency",
	["name"] = "Cash",
	["rewardData"] = {
		["type"] = "Cash",
		["amount"] = 1000000
	},
	["imageId"] = 1
}
local v7 = {
	["time"] = 900,
	["reward"] = "LuckyBlock",
	["name"] = "FeverBlock",
	["rewardData"] = {
		["type"] = "FeverBlock",
		["amount"] = 1,
		["toInventory"] = true
	},
	["imageId"] = 1
}
local v8 = {
	["time"] = 1200,
	["reward"] = "Currency",
	["name"] = "Cash",
	["rewardData"] = {
		["type"] = "Cash",
		["amount"] = 100000000
	},
	["imageId"] = 1
}
local v9 = {
	["time"] = 1800,
	["reward"] = "LuckyBlock",
	["name"] = "ViridianBlock",
	["rewardData"] = {
		["type"] = "ViridianBlock",
		["amount"] = 1,
		["toInventory"] = true
	},
	["imageId"] = 1
}
local v10 = {
	["time"] = 2700,
	["reward"] = "Currency",
	["name"] = "Cash",
	["rewardData"] = {
		["type"] = "Cash",
		["amount"] = 2500000000
	},
	["imageId"] = 1
}
local v11 = {
	["time"] = 3600,
	["reward"] = "LuckyBlock",
	["name"] = "DemonicBlock",
	["rewardData"] = {
		["type"] = "DemonicBlock",
		["amount"] = 1,
		["toInventory"] = true
	},
	["imageId"] = 1
}
local v12 = {
	["time"] = 5400,
	["reward"] = "Currency",
	["name"] = "Cash",
	["rewardData"] = {
		["type"] = "Cash",
		["amount"] = 10000000000
	},
	["imageId"] = 1
}
local v13 = {
	["time"] = 7200,
	["reward"] = "LuckyBlock",
	["name"] = "CursedBlock",
	["rewardData"] = {
		["type"] = "CursedBlock",
		["amount"] = 1,
		["toInventory"] = true
	},
	["imageId"] = 1
}
__set_list(v1, 1, {v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13})
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.CurrencyConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {
	["Cash"] = {
		["image"] = 72551796044219,
		["name"] = "Cash"
	},
	["PassExp"] = {
		["image"] = 84438789723207,
		["name"] = "Pass Xp"
	}
}
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.PermissionsConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {
	["ADMINS"] = {
		[7938362614] = true,
		[49923768] = true,
		[8116199630] = true,
		[8500601061] = true,
		[189736300] = true,
		[2700452492] = true,
		[49878346] = true,
		[52259622] = true,
		[5030242185] = true,
		[-1] = true,
		[-2] = true,
		[-3] = true,
		[-4] = true
	},
	["CREATORS"] = {
		[1721569880] = true,
		[10130450641] = true,
		[7576489385] = true,
		[4689220108] = true,
		[2628894412] = true,
		[9512274789] = true,
		[5502725986] = true,
		[9856743015] = true,
		[8955539061] = true,
		[7135407035] = true,
		[3391637459] = true,
		[9911511582] = true,
		[7872073288] = true,
		[2665675072] = true,
		[431900130] = true,
		[993028972] = true,
		[62323907] = true,
		[10168656208] = true,
		[10169090032] = true,
		[8335043727] = true,
		[9968966109] = true,
		[9827994598] = true,
		[9830894293] = true,
		[142335175] = true,
		[2541322182] = true,
		[1024495432] = true,
		[8720308131] = true,
		[4198876974] = true,
		[5075800879] = true,
		[7652604512] = true,
		[5676444135] = true,
		[3963565808] = true,
		[4979029572] = true,
		[5548754631] = true,
		[193016059] = true,
		[7249628613] = true,
		[7442591930] = true,
		[8665807773] = true,
		[9035602191] = true,
		[9067215110] = true,
		[8606511399] = true,
		[2233336851] = true,
		[9311950458] = true,
		[9509994626] = true,
		[8238334729] = true,
		[7618952569] = true,
		[893319507] = true,
		[8645291939] = true,
		[9292838449] = true,
		[9292622299] = true,
		[8689554677] = true,
		[4021058929] = true,
		[3116019175] = true,
		[3578361513] = true,
		[10236323228] = true,
		[9262724782] = true,
		[8107376729] = true,
		[3084916579] = true,
		[4001702403] = true,
		[155810177] = true,
		[4001259481] = true,
		[155811567] = true,
		[155812918] = true,
		[7153486636] = true,
		[4541581396] = true,
		[9770026552] = true,
		[6085938982] = true,
		[9966165858] = true,
		[9140403643] = true,
		[6046759460] = true,
		[527808513] = true,
		[4341091370] = true,
		[2464049465] = true,
		[4284785731] = true,
		[9121362281] = true,
		[2025945745] = true,
		[1023843064] = true,
		[5207579196] = true,
		[393499283] = true,
		[3485173660] = true,
		[566187384] = true,
		[7601094662] = true,
		[142279567] = true,
		[189540232] = true,
		[220975506] = true,
		[330579473] = true,
		[5475605048] = true,
		[1311974837] = true,
		[5293282766] = true,
		[5700301078] = true,
		[4065619655] = true,
		[2296343317] = true,
		[9586150670] = true,
		[5594434127] = true,
		[5014429134] = true,
		[4144551607] = true,
		[1271847063] = true,
		[3754829070] = true,
		[4365899037] = true,
		[8471202312] = true,
		[8946191012] = true,
		[8428881866] = true,
		[8428900908] = true,
		[8628914811] = true,
		[8920287940] = true,
		[8935009644] = true,
		[8953592074] = true,
		[8528745409] = true,
		[1704830105] = true,
		[1952755394] = true,
		[160079656] = true,
		[4365318136] = true,
		[8689674872] = true,
		[8614212318] = true,
		[340412886] = true,
		[10304694926] = true,
		[418978267] = true,
		[7669080084] = true,
		[1052089949] = true,
		[4664056148] = true,
		[432906397] = true
	}
}
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.MutationConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {}
local v2 = {
	["id"] = "NORMAL",
	["name"] = "Normal",
	["image"] = 127673796346535,
	["cashMulti"] = 1,
	["ColorFade"] = Color3.fromRGB(0, 0, 0),
	["ColorText"] = Color3.fromRGB(255, 255, 255),
	["chances"] = {
		["base"] = 85,
		["candy"] = 65,
		["gold"] = 65,
		["diamond"] = 65,
		["void"] = 65
	}
}
v1.NORMAL = v2
local v3 = {
	["id"] = "CANDY",
	["name"] = "Candy",
	["image"] = 127616224502130,
	["ColorFade"] = Color3.fromRGB(157, 75, 173),
	["ColorText"] = Color3.fromRGB(232, 139, 255),
	["cashMulti"] = 1.5,
	["chances"] = {
		["base"] = 8,
		["candy"] = 30,
		["gold"] = 2,
		["diamond"] = 2,
		["void"] = 2
	}
}
v1.CANDY = v3
local v4 = {
	["id"] = "GOLD",
	["name"] = "Gold",
	["image"] = 130446417380027,
	["ColorFade"] = Color3.fromRGB(138, 102, 30),
	["ColorText"] = Color3.fromRGB(255, 219, 37),
	["cashMulti"] = 2,
	["chances"] = {
		["base"] = 4,
		["candy"] = 2,
		["gold"] = 30,
		["diamond"] = 2,
		["void"] = 2
	}
}
v1.GOLD = v4
local v5 = {
	["id"] = "DIAMOND",
	["name"] = "Diamond",
	["image"] = 120336547130670,
	["ColorFade"] = Color3.fromRGB(47, 93, 122),
	["ColorText"] = Color3.fromRGB(42, 227, 255),
	["cashMulti"] = 2.5,
	["chances"] = {
		["base"] = 2,
		["candy"] = 2,
		["gold"] = 2,
		["diamond"] = 30,
		["void"] = 2
	}
}
v1.DIAMOND = v5
local v6 = {
	["id"] = "VOID",
	["name"] = "Void",
	["image"] = 114977890969396,
	["ColorFade"] = Color3.fromRGB(45, 0, 89),
	["ColorText"] = Color3.fromRGB(165, 39, 255),
	["cashMulti"] = 3,
	["chances"] = {
		["base"] = 1,
		["candy"] = 1,
		["gold"] = 1,
		["diamond"] = 1,
		["void"] = 30
	}
}
v1.VOID = v6
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.PlayerSkinConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {
	["default"] = {
		["id"] = "default",
		["name"] = "Player Skin",
		["idleAnimation"] = 121863737613268,
		["headAnimation"] = 134840601548012,
		["height"] = 0,
		["image"] = 115911921037976,
		["rarity"] = "Common",
		["layoutOrder"] = 1,
		["cost"] = 0,
		["devProductId"] = 1,
		["defaultPrice"] = 10,
		["luck"] = 1
	},
	["fairy_luckyblock"] = {
		["id"] = "fairy_luckyblock",
		["name"] = "Fairy Block",
		["idleAnimation"] = 122241278708237,
		["headAnimation"] = 109088898860144,
		["height"] = 2,
		["image"] = 117696456733413,
		["rarity"] = "Uncommon",
		["layoutOrder"] = 2,
		["cost"] = 250000,
		["devProductId"] = 3549620365,
		["defaultPrice"] = 10,
		["luck"] = 2
	},
	["freezy_luckyblock"] = {
		["id"] = "freezy_luckyblock",
		["name"] = "Freezy Block",
		["idleAnimation"] = 105734068921120,
		["headAnimation"] = 127985854394756,
		["height"] = 2,
		["image"] = 131614579934929,
		["rarity"] = "Rare",
		["layoutOrder"] = 3,
		["cost"] = 10000000,
		["devProductId"] = 3549620745,
		["defaultPrice"] = 29,
		["luck"] = 3
	},
	["lava_luckyblock"] = {
		["id"] = "lava_luckyblock",
		["name"] = "Lava Block",
		["idleAnimation"] = 105734068921120,
		["headAnimation"] = 127985854394756,
		["height"] = 2,
		["image"] = 86624430673804,
		["rarity"] = "Epic",
		["layoutOrder"] = 4,
		["cost"] = 400000000,
		["devProductId"] = 3549621689,
		["defaultPrice"] = 49,
		["luck"] = 4
	},
	["gliched_luckyblock"] = {
		["id"] = "gliched_luckyblock",
		["name"] = "Gliched Block",
		["idleAnimation"] = 108593998458401,
		["headAnimation"] = 118455709860364,
		["height"] = 2,
		["image"] = 134360162391522,
		["rarity"] = "Legendary",
		["layoutOrder"] = 5,
		["cost"] = 15000000000,
		["devProductId"] = 3549631358,
		["defaultPrice"] = 99,
		["luck"] = 5
	},
	["void_luckyblock"] = {
		["id"] = "void_luckyblock",
		["name"] = "Void Block",
		["idleAnimation"] = 108593998458401,
		["headAnimation"] = 118455709860364,
		["height"] = 2,
		["image"] = 80056122197171,
		["rarity"] = "Mythic",
		["layoutOrder"] = 6,
		["cost"] = 500000000000,
		["devProductId"] = 3549631623,
		["defaultPrice"] = 149,
		["luck"] = 6,
		["rebirthRequired"] = 1
	},
	["cyborg_luckyblock"] = {
		["id"] = "cyborg_luckyblock",
		["name"] = "Cyborg Block",
		["idleAnimation"] = 105611760075999,
		["headAnimation"] = 99610597555614,
		["height"] = 2,
		["image"] = 103919237730914,
		["rarity"] = "Eternal",
		["layoutOrder"] = 7,
		["cost"] = 25000000000000,
		["devProductId"] = 3549632001,
		["defaultPrice"] = 249,
		["luck"] = 7,
		["rebirthRequired"] = 2
	},
	["divine_luckyblock"] = {
		["id"] = "divine_luckyblock",
		["name"] = "Divine Block",
		["idleAnimation"] = 105611760075999,
		["headAnimation"] = 99610597555614,
		["height"] = 2,
		["image"] = 100218491446987,
		["rarity"] = "Divine",
		["layoutOrder"] = 8,
		["cost"] = 550000000000000,
		["devProductId"] = 3549632533,
		["defaultPrice"] = 399,
		["luck"] = 8,
		["rebirthRequired"] = 3
	},
	["inferno_luckyblock"] = {
		["id"] = "inferno_luckyblock",
		["name"] = "Inferno Block",
		["idleAnimation"] = 119191039747585,
		["headAnimation"] = 90759313698569,
		["height"] = 2,
		["image"] = 84276465650284,
		["rarity"] = "Secret",
		["layoutOrder"] = 9,
		["cost"] = 4e16,
		["devProductId"] = 3549632755,
		["defaultPrice"] = 799,
		["luck"] = 9,
		["rebirthRequired"] = 4
	},
	["colossus _luckyblock"] = {
		["id"] = "colossus _luckyblock",
		["name"] = "COLOSSUS BLOCK",
		["idleAnimation"] = 119191039747585,
		["headAnimation"] = 90759313698569,
		["height"] = 2,
		["image"] = 113098756801349,
		["rarity"] = "Cosmic",
		["layoutOrder"] = 10,
		["cost"] = 2.75e18,
		["devProductId"] = 3549633637,
		["defaultPrice"] = 1299,
		["luck"] = 10,
		["rebirthRequired"] = 5
	},
	["mogging_luckyblock"] = {
		["id"] = "mogging_luckyblock",
		["name"] = "Mogging Block",
		["idleAnimation"] = 122241278708237,
		["headAnimation"] = 109088898860144,
		["height"] = 2,
		["image"] = 110923663203996,
		["rarity"] = "SPECIAL",
		["layoutOrder"] = 12,
		["cost"] = 2.75e18,
		["devProductId"] = 3549633637,
		["defaultPrice"] = 1299,
		["luck"] = 7,
		["isSpecial"] = true,
		["specialMulti"] = 1.5,
		["passRequired"] = true
	},
	["prestige_mogging_luckyblock"] = {
		["id"] = "prestige_luckyblock",
		["name"] = "Prestige Mogging Block",
		["idleAnimation"] = 122241278708237,
		["headAnimation"] = 109088898860144,
		["height"] = 2,
		["image"] = 85756789668860,
		["rarity"] = "SPECIAL",
		["layoutOrder"] = 13,
		["cost"] = 2.75e18,
		["devProductId"] = 3549633637,
		["defaultPrice"] = 1299,
		["luck"] = 8,
		["isSpecial"] = true,
		["specialMulti"] = 2,
		["passRequired"] = true
	},
	["spirit_luckyblock"] = {
		["id"] = "spirit_luckyblock",
		["name"] = "Spirit Lucky Block",
		["idleAnimation"] = 122241278708237,
		["headAnimation"] = 109088898860144,
		["height"] = 2,
		["image"] = 74477178585116,
		["rarity"] = "SPECIAL",
		["layoutOrder"] = 11,
		["luck"] = 6,
		["hideIfNotOwned"] = true
	}
}
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.RaritiesConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

return {
	["Common"] = 1,
	["Rare"] = 2,
	["Epic"] = 4,
	["Legendary"] = 8,
	["Mythic"] = 16,
	["SECRET"] = 32,
	["Divine"] = 64,
	["Cosmic"] = 128
}

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.ContainersConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {
	["CYCLE_TIME"] = 1,
	["MAX_LEVEL"] = 50,
	["STARTING_BRAINROT_SCALE"] = 1,
	["MAX_BRAINROT_SCALE"] = 2.1
}
local v2 = {
	{
		["price"] = 5000000
	},
	{
		["price"] = 10000000
	},
	{
		["price"] = 20000000
	},
	{
		["price"] = 40000000
	},
	{
		["price"] = 80000000
	},
	{
		["price"] = 160000000
	},
	{
		["price"] = 350000000
	},
	{
		["price"] = 750000000
	},
	{
		["price"] = 1750000000
	},
	{
		["price"] = 4000000000
	},
	{
		["price"] = 10000000000
	},
	{
		["price"] = 25000000000
	},
	{
		["price"] = 75000000000
	},
	{
		["price"] = 225000000000
	},
	{
		["price"] = 675000000000
	},
	{
		["price"] = 2000000000000
	},
	{
		["price"] = 7500000000000
	},
	{
		["price"] = 22500000000000
	},
	{
		["price"] = 100000000000000
	},
	{
		["price"] = 500000000000000
	}
}
v1.containers = v2
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.LuckyBlockConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {}
local v2 = {}
local v3 = {
	["id"] = "GreenLuckyBlock",
	["name"] = "Green Lucky Block",
	["image"] = 100848918390025,
	["rarity"] = "Common",
	["studsOffset"] = 6,
	["hp"] = 5,
	["items"] = {
		{
			["id"] = "tralalero_tralala",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "bombardino_crocodilo",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "chimpanzini_bananini",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "burbaloni_luliloli",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "brr_brr_patapim",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.GreenLuckyBlock = v3
local v4 = {
	["id"] = "BlueLuckyBlock",
	["name"] = "Blue Lucky Block",
	["image"] = 70756954754516,
	["rarity"] = "Common",
	["studsOffset"] = 6,
	["hp"] = 15,
	["items"] = {
		{
			["id"] = "bombardino_crocodilo",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "chimpanzini_bananini",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "burbaloni_luliloli",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "brr_brr_patapim",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "pipi_poppa_pippo_peppe",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.BlueLuckyBlock = v4
local v5 = {
	["id"] = "PurpleLuckyBlock",
	["name"] = "Purple Lucky Block",
	["image"] = 101216359771008,
	["rarity"] = "Common",
	["studsOffset"] = 6.5,
	["hp"] = 30,
	["items"] = {
		{
			["id"] = "chimpanzini_bananini",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "burbaloni_luliloli",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "brr_brr_patapim",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "pipi_poppa_pippo_peppe",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "kravelino_cekicino",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.PurpleLuckyBlock = v5
local v6 = {
	["id"] = "VioletLuckyBlock",
	["name"] = "Brown Lucky Block",
	["image"] = 117859298663220,
	["rarity"] = "Uncommon",
	["studsOffset"] = 6.5,
	["hp"] = 150,
	["items"] = {
		{
			["id"] = "balerinna_cappucinna",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "bombombini_gusini",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "udin_din_din_dun",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "ganganzelli_trulala",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "lirili_larila",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.VioletLuckyBlock = v6
local v7 = {
	["id"] = "YellowLuckyBlock",
	["name"] = "Yellow Lucky Block",
	["image"] = 100664215888038,
	["rarity"] = "Uncommon",
	["studsOffset"] = 6.5,
	["hp"] = 225,
	["items"] = {
		{
			["id"] = "bombombini_gusini",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "udin_din_din_dun",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "ganganzelli_trulala",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "lirili_larila",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "orangutini_ananasini",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.YellowLuckyBlock = v7
local v8 = {
	["id"] = "RedLuckyBlock",
	["name"] = "Red Lucky Block",
	["image"] = 139001721915971,
	["rarity"] = "Uncommon",
	["studsOffset"] = 6.5,
	["hp"] = 350,
	["items"] = {
		{
			["id"] = "gangster_foottera",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "udin_din_din_dun",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "brr_brr_patapim",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "capuccino_assassino",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "gorillo_watermellondrillo",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.RedLuckyBlock = v8
local v9 = {
	["id"] = "BlackLuckyBlock",
	["name"] = "Black Lucky Block",
	["image"] = 116827590189197,
	["rarity"] = "Rare",
	["studsOffset"] = 7,
	["hp"] = 1500,
	["items"] = {
		{
			["id"] = "Cappuccino Assassino",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "Gorillo Watermellondrillo",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "trippi_troppi_troppa_trippa",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "raccooni_watermelunni",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "ta_ta_ta_ta_sahur",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.BlackLuckyBlock = v9
local v10 = {
	["id"] = "CryingBlock",
	["name"] = "Crying Block",
	["image"] = 96791359656483,
	["rarity"] = "Rare",
	["studsOffset"] = 9,
	["hp"] = 6000,
	["items"] = {
		{
			["id"] = "cacto_hipopotamo",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "penguino_cocosino",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "cocofanto_elefanto",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "gingobalo_gingobali",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "zibra_zubra_zibralini",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.CryingBlock = v10
local v11 = {
	["id"] = "GraffitiLuckyBlock",
	["name"] = "Graffiti Block",
	["image"] = 122616353531890,
	["rarity"] = "Epic",
	["studsOffset"] = 7,
	["hp"] = 25000,
	["items"] = {
		{
			["id"] = "capuccino_assassino",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "gorillo_watermellondrillo",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "trippi_troppi_troppa_trippa",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "raccooni_watermelunni",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "ta_ta_ta_ta_sahur",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.GraffitiLuckyBlock = v11
local v12 = {
	["id"] = "UncolorBlock",
	["name"] = "Uncolor Block",
	["image"] = 110739441727102,
	["rarity"] = "Epic",
	["studsOffset"] = 9,
	["hp"] = 50000,
	["items"] = {
		{
			["id"] = "tropa_trippa",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "ta_ta_ta_ta_sahur",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "bobritto_bandito",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "capuccino_assassino",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "anpali_babel",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.UncolorBlock = v12
local v13 = {
	["id"] = "FestiveBlock",
	["name"] = "Festive Block",
	["image"] = 82733566182543,
	["rarity"] = "Epic",
	["studsOffset"] = 10,
	["hp"] = 100000,
	["items"] = {
		{
			["id"] = "ta_ta_ta_ta_sahur",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "bobritto_bandito",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "capuccino_assassino",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "anpali_babel",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "lerulerulerule",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.FestiveBlock = v13
local v14 = {
	["id"] = "FeverBlock",
	["name"] = "Fever Block",
	["image"] = 126071392479273,
	["rarity"] = "Legendary",
	["studsOffset"] = 9,
	["hp"] = 400000,
	["items"] = {
		{
			["id"] = "raccooni_watermelunni",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "ta_ta_ta_ta_sahur",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "glorbo_frutodrillo",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "frigo_camello",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "orangutini_ananassini",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.FeverBlock = v14
local v15 = {
	["id"] = "ViridianBlock",
	["name"] = "Viridian Block",
	["image"] = 96171715154077,
	["rarity"] = "Legendary",
	["studsOffset"] = 15,
	["hp"] = 1750000,
	["items"] = {
		{
			["id"] = "frigo_camello",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "orangutini_ananassini",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "ballerino_lololo",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "svinina_bombobardino",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "frulli_frula",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.ViridianBlock = v15
local v16 = {
	["id"] = "DemonicBlock",
	["name"] = "Demonic Block",
	["image"] = 77105864327355,
	["rarity"] = "Mythic",
	["studsOffset"] = 10,
	["hp"] = 10000000,
	["items"] = {
		{
			["id"] = "svinina_bombobardino",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "frulli_frula",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "tracoducotulu_delapeladustuz",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "ganganzelli_trulala",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "orcalero_orcala",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.DemonicBlock = v16
local v17 = {
	["id"] = "InfernoBlock",
	["name"] = "Inferno Block",
	["image"] = 127913716449718,
	["rarity"] = "Divine",
	["studsOffset"] = 13,
	["hp"] = 250000000,
	["items"] = {
		{
			["id"] = "trillalero_tramalima",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "tigrrullini_watermellini",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "rhino_toasterino",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "bri_bri_bicus_ticus",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "ecco_cavallo_virtuoso",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.InfernoBlock = v17
local v18 = {
	["id"] = "CursedBlock",
	["name"] = "Cursed Block",
	["image"] = 86700337587230,
	["rarity"] = "Divine",
	["studsOffset"] = 14,
	["hp"] = 1250000000,
	["items"] = {
		{
			["id"] = "lerulerulerule",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "cavallo_virtuoso",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "rhino_toasterino",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "te_te_te_te_sahur",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "mateo",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.CursedBlock = v18
local v19 = {
	["id"] = "AncientBlock",
	["name"] = "Ancient Block",
	["image"] = 81251344151457,
	["rarity"] = "Secret",
	["studsOffset"] = 12,
	["hp"] = 6250000000,
	["items"] = {
		{
			["id"] = "ti_ti_ti_ti_ti_sahur",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "toc_toc_sahur",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "te_te_te_te_te_te_te_te_te_sahur",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "nightmare_sahur",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "job_job_job_sahur",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.AncientBlock = v19
local v20 = {
	["id"] = "UnderworldBlock",
	["name"] = "Underworld Block",
	["image"] = 83056911347860,
	["rarity"] = "Secret",
	["studsOffset"] = 15,
	["hp"] = 37500000000,
	["items"] = {
		{
			["id"] = "toc_toc_sahur",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "te_te_te_te_te_te_te_te_te_sahur",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "nightmare_sahur",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "job_job_job_sahur",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "tic_tac_sahur",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.UnderworldBlock = v20
local v21 = {
	["id"] = "GuardianBlock",
	["name"] = "Guardian Block",
	["image"] = 111637913846706,
	["rarity"] = "Cosmic",
	["studsOffset"] = 15,
	["hp"] = 350000000000,
	["items"] = {
		{
			["id"] = "cacasito_satelito",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "mastodontico_telepiedone_planetario",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "la_vaca_black_hole_goaaat",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "kiki_koka_kiko_keke",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "las_vaquitas_saturnitas",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.GuardianBlock = v21
local v22 = {
	["id"] = "CosmosBlock",
	["name"] = "Cosmos Block",
	["image"] = 80186396860071,
	["rarity"] = "Cosmic",
	["studsOffset"] = 17,
	["hp"] = 1750000000000,
	["items"] = {
		{
			["id"] = "mastodontico_telepiedone_planetario",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "la_vaca_black_hole_goaaat",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "kiki_koka_kiko_keke",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "las_vaquitas_saturnitas",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "la_vacca_saturno_saturnita",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.CosmosBlock = v22
local v23 = {
	["id"] = "StrawberryLuckyBlock",
	["name"] = "Strawberry Block",
	["image"] = 135215004128106,
	["rarity"] = "Cosmic",
	["studsOffset"] = 15,
	["hp"] = 1750000000000,
	["items"] = {
		{
			["id"] = "spioniro_golubiro",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "salamino_penguino",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "karkirkur",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "chachechi",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "strawberry_elephant",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.StrawberryLuckyBlock = v23
local v24 = {
	["id"] = "AngelBlock",
	["name"] = "Angel Block",
	["image"] = 109332497231200,
	["rarity"] = "Mythic",
	["studsOffset"] = 12,
	["hp"] = 50000000,
	["items"] = {
		{
			["id"] = "pipi_potato",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "cathinni_sushinni",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "graipus_medus",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "tigrrullini_watermellini",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "dragoni_cannelloni",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.AngelBlock = v24
local v25 = {
	["id"] = "DealerBlock",
	["name"] = "Dealer Block",
	["image"] = 83142218844062,
	["rarity"] = "Legendary",
	["studsOffset"] = 9,
	["hp"] = 800000,
	["items"] = {
		{
			["id"] = "pipi_potato",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "cathinni_sushinni",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "graipus_medus",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "tigrrullini_watermellini",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "dragoni_cannelloni",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.DealerBlock = v25
local v26 = {
	["id"] = "FairyBlock",
	["name"] = "Fairy Block",
	["image"] = 79683056160294,
	["rarity"] = "Rare",
	["studsOffset"] = 9,
	["hp"] = 3000,
	["items"] = {
		{
			["id"] = "pipi_potato",
			["type"] = "Brainrot",
			["chance"] = 50
		},
		{
			["id"] = "cathinni_sushinni",
			["type"] = "Brainrot",
			["chance"] = 30
		},
		{
			["id"] = "graipus_medus",
			["type"] = "Brainrot",
			["chance"] = 15
		},
		{
			["id"] = "tigrrullini_watermellini",
			["type"] = "Brainrot",
			["chance"] = 4
		},
		{
			["id"] = "dragoni_cannelloni",
			["type"] = "Brainrot",
			["chance"] = 1
		}
	}
}
v2.FairyBlock = v26
v1.LUCKY_BLOCKS = v2
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.PickaxeConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {
	["Wooden_Pickaxe"] = {
		["id"] = "Wooden_Pickaxe",
		["name"] = "Wooden Pickaxe",
		["image"] = 114456939340421,
		["rarity"] = "Common",
		["layoutOrder"] = 1,
		["cost"] = 10,
		["damage"] = 1,
		["devProductId"] = 1,
		["defaultPrice"] = 10,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Stone_Pickaxe"] = {
		["id"] = "Stone_Pickaxe",
		["name"] = "Stone Pickaxe",
		["image"] = 135811954526759,
		["rarity"] = "Common",
		["layoutOrder"] = 2,
		["cost"] = 10,
		["damage"] = 2,
		["devProductId"] = 3510703796,
		["defaultPrice"] = 19,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Golden_Pickaxe"] = {
		["id"] = "Golden_Pickaxe",
		["name"] = "Golden Pickaxe",
		["image"] = 87587130173826,
		["rarity"] = "Uncommon",
		["layoutOrder"] = 3,
		["cost"] = 1000,
		["damage"] = 5,
		["devProductId"] = 3510704115,
		["defaultPrice"] = 29,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Ice_Pickaxe"] = {
		["id"] = "Ice_Pickaxe",
		["name"] = "Ice Pickaxe",
		["image"] = 109976363355916,
		["rarity"] = "Uncommon",
		["layoutOrder"] = 4,
		["cost"] = 7500,
		["damage"] = 25,
		["devProductId"] = 3510705714,
		["defaultPrice"] = 39,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Apocalypse_Pickaxe"] = {
		["id"] = "Apocalypse_Pickaxe",
		["name"] = "Apocalypse Pickaxe",
		["image"] = 108704091490920,
		["rarity"] = "Uncommon",
		["layoutOrder"] = 5,
		["cost"] = 50000,
		["damage"] = 100,
		["devProductId"] = 3510705907,
		["defaultPrice"] = 49,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Mecha_Pickaxe"] = {
		["id"] = "Mecha_Pickaxe",
		["name"] = "Mecha Pickaxe",
		["image"] = 93946005406071,
		["rarity"] = "Rare",
		["layoutOrder"] = 6,
		["cost"] = 400000,
		["damage"] = 400,
		["devProductId"] = 3510707057,
		["defaultPrice"] = 64,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Toy_Pickaxe"] = {
		["id"] = "Toy_Pickaxe",
		["name"] = "Toy Pickaxe",
		["image"] = 98580009956085,
		["rarity"] = "Rare",
		["layoutOrder"] = 7,
		["cost"] = 3500000,
		["damage"] = 1500,
		["devProductId"] = 3510708511,
		["defaultPrice"] = 79,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Aqua_Pickaxe"] = {
		["id"] = "Aqua_Pickaxe",
		["name"] = "Aqua Pickaxe",
		["image"] = 72819363763081,
		["rarity"] = "Epic",
		["layoutOrder"] = 8,
		["cost"] = 30000000,
		["damage"] = 6000,
		["devProductId"] = 35107089081,
		["defaultPrice"] = 94,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Candy_Pickaxe"] = {
		["id"] = "Candy_Pickaxe",
		["name"] = "Candy Pickaxe",
		["image"] = 99390951329300,
		["rarity"] = "Epic",
		["layoutOrder"] = 9,
		["cost"] = 250000000,
		["damage"] = 25000,
		["devProductId"] = 3510710429,
		["defaultPrice"] = 119,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Frost_Pickaxe"] = {
		["id"] = "Frost_Pickaxe",
		["name"] = "Frost Pickaxe",
		["image"] = 111970125997427,
		["rarity"] = "Legendary",
		["layoutOrder"] = 10,
		["cost"] = 2000000000,
		["damage"] = 100000,
		["devProductId"] = 3510712557,
		["defaultPrice"] = 149,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Lava_Pickaxe"] = {
		["id"] = "Lava_Pickaxe",
		["name"] = "Lava Pickaxe",
		["image"] = 136112463574170,
		["rarity"] = "Legendary",
		["layoutOrder"] = 11,
		["cost"] = 15000000000,
		["damage"] = 400000,
		["devProductId"] = 3510712871,
		["defaultPrice"] = 199,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Viking_Pickaxe"] = {
		["id"] = "Viking_Pickaxe",
		["name"] = "Viking Pickaxe",
		["image"] = 86173630236070,
		["rarity"] = "Mythic",
		["layoutOrder"] = 12,
		["cost"] = 125000000000,
		["damage"] = 1750000,
		["devProductId"] = 3510713400,
		["defaultPrice"] = 239,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Radioactive_Pickaxe"] = {
		["id"] = "Radioactive_Pickaxe",
		["name"] = "Radioactive Pickaxe",
		["image"] = 123371824298595,
		["rarity"] = "Mythic",
		["layoutOrder"] = 13,
		["cost"] = 1000000000000,
		["damage"] = 7000000,
		["devProductId"] = 3510714245,
		["defaultPrice"] = 299,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Rich_Pickaxe"] = {
		["id"] = "Rich_Pickaxe",
		["name"] = "Rich Pickaxe",
		["image"] = 124525733791058,
		["rarity"] = "Divine",
		["layoutOrder"] = 14,
		["cost"] = 8500000000000,
		["damage"] = 30000000,
		["devProductId"] = 3510714494,
		["defaultPrice"] = 349,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Diamond_Pickaxe"] = {
		["id"] = "Diamond_Pickaxe",
		["name"] = "Diamond Pickaxe",
		["image"] = 77206619357611,
		["rarity"] = "Divine",
		["layoutOrder"] = 15,
		["cost"] = 85000000000000,
		["damage"] = 150000000,
		["devProductId"] = 3510714916,
		["defaultPrice"] = 399,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Void_Pickaxe"] = {
		["id"] = "Void_Pickaxe",
		["name"] = "Void Pickaxe",
		["image"] = 121892435228274,
		["rarity"] = "Secret",
		["layoutOrder"] = 16,
		["cost"] = 850000000000000,
		["damage"] = 600000000,
		["devProductId"] = 3510716010,
		["defaultPrice"] = 449,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Magma_Pickaxe"] = {
		["id"] = "Magma_Pickaxe",
		["name"] = "Magma Pickaxe",
		["image"] = 136735360801674,
		["rarity"] = "Secret",
		["layoutOrder"] = 17,
		["cost"] = 8500000000000000,
		["damage"] = 2500000000,
		["devProductId"] = 3510716380,
		["defaultPrice"] = 549,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Kingcold_Pickaxe"] = {
		["id"] = "Kingcold_Pickaxe",
		["name"] = "Kingcold Pickaxe",
		["image"] = 132027030464305,
		["rarity"] = "Cosmic",
		["layoutOrder"] = 18,
		["cost"] = 1e17,
		["damage"] = 12500000000,
		["devProductId"] = 3510717939,
		["defaultPrice"] = 799,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Cosmic_Pickaxe"] = {
		["id"] = "Cosmic_Pickaxe",
		["name"] = "Cosmic Pickaxe",
		["image"] = 114152470161639,
		["rarity"] = "Cosmic",
		["layoutOrder"] = 19,
		["cost"] = 1e18,
		["damage"] = 65000000000,
		["devProductId"] = 3510718264,
		["defaultPrice"] = 1249,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	},
	["Galaxy_Pickaxe"] = {
		["id"] = "Galaxy_Pickaxe",
		["name"] = "Galaxy Pickaxe",
		["image"] = 74210317377228,
		["rarity"] = "Legendary",
		["isSpecial"] = true,
		["specialMulti"] = 2,
		["layoutOrder"] = 20,
		["damage"] = 1000000,
		["devProductId"] = 3510718479,
		["defaultPrice"] = 1695,
		["cooldown"] = 0.2,
		["animations"] = { 116341701595781, 112258027752631 }
	}
}
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.SeasonPassConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {
	["Update"] = 1,
	["Level"] = {
		0,
		3000,
		6000,
		9000,
		12000,
		15000,
		18000,
		21000,
		24000,
		30000,
		30000
	}
}
local v2 = {}
local v3 = {}
local v4 = {
	["RewardType"] = "Brainrot",
	["Name"] = "pipi_potato",
	["RewardData"] = {
		["type"] = "pipi_potato",
		["mutation"] = "VOID",
		["amount"] = 1
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v3.Paid = v4
local v5 = {
	["RewardType"] = "Currency",
	["Name"] = "Cash",
	["RewardData"] = {
		["type"] = "Cash",
		["amount"] = 1000
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v3.Free = v5
v2[1] = v3
local v6 = {}
local v7 = {
	["RewardType"] = "LuckyBlock",
	["Name"] = "AngelBlock",
	["RewardData"] = {
		["type"] = "AngelBlock",
		["amount"] = 3,
		["toInventory"] = true
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v6.Paid = v7
local v8 = {
	["RewardType"] = "LuckyBlock",
	["Name"] = "ViridianBlock",
	["RewardData"] = {
		["type"] = "ViridianBlock",
		["amount"] = 1,
		["toInventory"] = true
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v6.Free = v8
v2[2] = v6
local v9 = {}
local v10 = {
	["RewardType"] = "Brainrot",
	["Name"] = "cathinni_sushinni",
	["RewardData"] = {
		["type"] = "cathinni_sushinni",
		["mutation"] = "VOID",
		["amount"] = 1
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v9.Paid = v10
local v11 = {
	["RewardType"] = "Brainrot",
	["Name"] = "pipi_potato",
	["RewardData"] = {
		["type"] = "pipi_potato",
		["mutation"] = "NORMAL",
		["amount"] = 1
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v9.Free = v11
v2[3] = v9
local v12 = {}
local v13 = {
	["RewardType"] = "Currency",
	["Name"] = "Cash",
	["RewardData"] = {
		["type"] = "Cash",
		["amount"] = 1000000000000
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v12.Paid = v13
local v14 = {
	["RewardType"] = "Currency",
	["Name"] = "Cash",
	["RewardData"] = {
		["type"] = "Cash",
		["amount"] = 100000000000
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v12.Free = v14
v2[4] = v12
local v15 = {}
local v16 = {
	["RewardType"] = "LuckyBlock",
	["Name"] = "AngelBlock",
	["RewardData"] = {
		["type"] = "AngelBlock",
		["amount"] = 5,
		["toInventory"] = true
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v15.Paid = v16
local v17 = {
	["RewardType"] = "LuckyBlock",
	["Name"] = "AngelBlock",
	["RewardData"] = {
		["type"] = "AngelBlock",
		["amount"] = 1,
		["toInventory"] = true
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v15.Free = v17
v2[5] = v15
local v18 = {}
local v19 = {
	["RewardType"] = "Brainrot",
	["Name"] = "graipus_medus",
	["RewardData"] = {
		["type"] = "graipus_medus",
		["mutation"] = "VOID",
		["amount"] = 1
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v18.Paid = v19
local v20 = {
	["RewardType"] = "Brainrot",
	["Name"] = "cathinni_sushinni",
	["RewardData"] = {
		["type"] = "cathinni_sushinni",
		["mutation"] = "NORMAL",
		["amount"] = 1
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v18.Free = v20
v2[6] = v18
local v21 = {}
local v22 = {
	["RewardType"] = "Currency",
	["Name"] = "Cash",
	["RewardData"] = {
		["type"] = "Cash",
		["amount"] = 2500000000000
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v21.Paid = v22
local v23 = {
	["RewardType"] = "Currency",
	["Name"] = "Cash",
	["RewardData"] = {
		["type"] = "Cash",
		["amount"] = 250000000000
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v21.Free = v23
v2[7] = v21
local v24 = {}
local v25 = {
	["RewardType"] = "LuckyBlock",
	["Name"] = "AngelBlock",
	["RewardData"] = {
		["type"] = "AngelBlock",
		["amount"] = 10,
		["toInventory"] = true
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v24.Paid = v25
local v26 = {
	["RewardType"] = "LuckyBlock",
	["Name"] = "AngelBlock",
	["RewardData"] = {
		["type"] = "AngelBlock",
		["amount"] = 3,
		["toInventory"] = true
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v24.Free = v26
v2[8] = v24
local v27 = {}
local v28 = {
	["RewardType"] = "LuckyBlock",
	["Name"] = "StrawberryLuckyBlock",
	["RewardData"] = {
		["type"] = "StrawberryLuckyBlock",
		["amount"] = 1,
		["toInventory"] = true
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v27.Paid = v28
local v29 = {
	["RewardType"] = "Brainrot",
	["Name"] = "graipus_medus",
	["RewardData"] = {
		["type"] = "graipus_medus",
		["mutation"] = "NORMAL",
		["amount"] = 1
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v27.Free = v29
v2[9] = v27
local v30 = {}
local v31 = {
	["RewardType"] = "PlayerSkin",
	["Name"] = "prestige_mogging_luckyblock",
	["RewardData"] = {
		["type"] = "prestige_mogging_luckyblock",
		["amount"] = 1
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v30.Paid = v31
local v32 = {
	["RewardType"] = "PlayerSkin",
	["Name"] = "mogging_luckyblock",
	["RewardData"] = {
		["type"] = "mogging_luckyblock",
		["amount"] = 1
	},
	["SizeOverride"] = 0.75,
	["PositionOverride"] = UDim2.fromScale(0.5, 0.57)
}
v30.Free = v32
v2[10] = v30
v1.Pass = v2
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.UpgradeConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modifiers)
local v_u_3 = require(v1.Shared.CharacterUtil)
local v_u_4 = {}
local v11 = {
	["MovementSpeed"] = {
		["id"] = "MovementSpeed",
		["name"] = "Speed",
		["image"] = 75644626771249,
		["description"] = "Increase movement speed!",
		["layoutOrder"] = 0,
		["currencyType"] = "Cash",
		["tiers"] = {},
		["priceCalculation"] = function(p5)
			if p5 == 19 then
				return 100
			end
			local v6 = {
				{ 19, 1.165 },
				{ 50, 1.17 },
				{ 100, 1.175 },
				{ 125, 1.1775 },
				{ 150, 1.18 },
				{ 175, 1.1825 },
				{ 200, 1.185 }
			}
			local v7 = v6[1][2]
			for _, v8 in ipairs(v6) do
				if v8[1] > p5 then
					break
				end
				v7 = v8[2]
			end
			return 100 * v7 ^ (p5 - 18)
		end,
		["afterUpgrade"] = function(p9, _)
			-- upvalues: (copy) v_u_2, (copy) v_u_3
			local v10
			if p9:GetAttribute("InSpawn") then
				v10 = v_u_2.Get(p9, "SlowMovementSpeed")
			else
				v10 = v_u_2.Get(p9, "MovementSpeed")
			end
			v_u_3.SetPlayerSpeed(p9, v10)
		end,
		["maxLevel"] = 215
	}
}
v_u_4.Upgrades = v11
function v_u_4.GetPrice(p12, p13)
	-- upvalues: (copy) v_u_4
	local v14 = v_u_4.Upgrades[p12]
	if v14 then
		if v14.maxLevel and v14.maxLevel < p13 then
			return nil
		elseif v14.tiers[p13] then
			return v14.tiers[p13]
		elseif v14.priceCalculation and #v14.tiers < p13 then
			return v14.priceCalculation(p13)
		else
			return nil
		end
	else
		return nil
	end
end
function v_u_4.GetBulkPrice(p15, p16, p17)
	-- upvalues: (copy) v_u_4
	local v18 = 0
	for v19 = 1, p17 do
		local v20 = v_u_4.GetPrice(p15, p16 + v19)
		if not v20 then
			return (1 / 0)
		end
		v18 = v18 + v20
	end
	return v18
end
function v_u_4.GetMaxBuyable(p21, p22, p23)
	-- upvalues: (copy) v_u_4
	local v24 = 0
	local v25 = 0
	for v26 = 1, 1000 do
		local v27 = v_u_4.GetPrice(p21, p22 + v26)
		if not v27 or v24 + v27 > p23 then
			break
		end
		v24 = v24 + v27
		v25 = v26
	end
	return v25, v24
end
return v_u_4

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.RebirthConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = {}
local v2 = {}
local v3 = {
	["Cost"] = {
		["Cash"] = 250000
	},
	["CashMulti"] = 2
}
v2[1] = v3
local v4 = {
	["Cost"] = {
		["Cash"] = 10000000
	},
	["CashMulti"] = 3
}
v2[2] = v4
local v5 = {
	["Cost"] = {
		["Cash"] = 400000000
	},
	["CashMulti"] = 4
}
v2[3] = v5
local v6 = {
	["Cost"] = {
		["Cash"] = 16000000000
	},
	["CashMulti"] = 5
}
v2[4] = v6
local v7 = {
	["Cost"] = {
		["Cash"] = 625000000000
	},
	["CashMulti"] = 6
}
v2[5] = v7
local v8 = {
	["Cost"] = {
		["Cash"] = 25000000000000
	},
	["CashMulti"] = 7
}
v2[6] = v8
local v9 = {
	["Cost"] = {
		["Cash"] = 1000000000000000
	},
	["CashMulti"] = 8
}
v2[7] = v9
local v10 = {
	["Cost"] = {
		["Cash"] = 4e16
	},
	["CashMulti"] = 9
}
v2[8] = v10
local v11 = {
	["Cost"] = {
		["Cash"] = 2.75e18
	},
	["CashMulti"] = 10
}
v2[9] = v11
local v12 = {
	["Cost"] = {
		["Cash"] = 7.5e19
	},
	["CashMulti"] = 11
}
v2[10] = v12
v_u_1.REBIRTH = v2
local v13 = {
	{
		["maxRebirth"] = 1,
		["devProductId"] = 3549638650,
		["defaultPrice"] = 50
	},
	{
		["maxRebirth"] = (1 / 0),
		["devProductId"] = 3549638756,
		["defaultPrice"] = 150
	}
}
v_u_1.SKIP_TIERS = v13
function v_u_1.GetSkipInfo(p14)
	-- upvalues: (copy) v_u_1
	local v15 = p14 or 0
	for _, v16 in v_u_1.SKIP_TIERS do
		if v15 < v16.maxRebirth then
			return v16
		end
	end
	return nil
end
return v_u_1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.FreeShopConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {
	["CURRENT_CLAIM_INDEX"] = 1
}
local v2 = {
	["rewardType"] = "Brainrot",
	["data"] = {
		["type"] = "brr_brr_patapim"
	}
}
v1.reward = v2
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.WeatherConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {
	["candy"] = {
		["id"] = "candy",
		["name"] = "Candy Event",
		["weight"] = 50,
		["image"] = 127616224502130
	},
	["gold"] = {
		["id"] = "gold",
		["name"] = "Gold Event",
		["weight"] = 35,
		["image"] = 130446417380027
	},
	["diamond"] = {
		["id"] = "diamond",
		["name"] = "Diamond Event",
		["weight"] = 12,
		["image"] = 120336547130670
	},
	["void"] = {
		["id"] = "void",
		["name"] = "Void Event",
		["weight"] = 3,
		["image"] = 114977890969396
	}
}
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.EventConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {
	["DOUBLE_CASH"] = {
		["id"] = "DOUBLE_CASH",
		["type"] = "cashEvent",
		["name"] = "x2 Cash Event",
		["image"] = 110633998635349
	},
	["DOUBLE_DAMAGE"] = {
		["id"] = "DOUBLE_DAMAGE",
		["type"] = "damageEvent",
		["name"] = "x2 Damage",
		["image"] = 1
	},
	["NEW_YEAR"] = {
		["id"] = "NEW_YEAR",
		["type"] = "traitEvent",
		["name"] = "New Year Trait",
		["image"] = 107931118186568
	},
	["GLITCH"] = {
		["id"] = "GLITCH",
		["type"] = "traitEvent",
		["name"] = "Glitch Trait",
		["image"] = 130546715352700
	},
	["STORM"] = {
		["id"] = "STORM",
		["type"] = "traitEvent",
		["name"] = "Tornado Trait",
		["image"] = 128879530440982
	},
	["LAVA"] = {
		["id"] = "LAVA",
		["type"] = "traitEvent",
		["name"] = "Lava Trait",
		["image"] = 83992414374343
	},
	["MACHINA"] = {
		["id"] = "MACHINA",
		["type"] = "machineEvent",
		["name"] = "Gummy Gum",
		["image"] = 99613446629616
	},
	["ICE"] = {
		["id"] = "ICE",
		["type"] = "traitEvent",
		["name"] = "Ice Trait",
		["image"] = 91929766337053
	},
	["SUPER_NOVA"] = {
		["id"] = "SUPER_NOVA",
		["type"] = "traitEvent",
		["name"] = "Super Nova Trait",
		["image"] = 78003726536450
	},
	["SPIRIT_BLOSSOM"] = {
		["id"] = "SPIRIT_BLOSSOM",
		["type"] = "traitEvent",
		["name"] = "Spirit Blossom",
		["image"] = 84763133444918
	}
}
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.GiftingConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {
	["GIFTABLE_TYPES"] = {
		["brainrot"] = true
	}
}
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.WaveConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {
	["WAVE1"] = {
		["id"] = "WAVE1",
		["chance"] = 20,
		["speed"] = 65
	},
	["WAVE2"] = {
		["id"] = "WAVE2",
		["chance"] = 35,
		["speed"] = 75
	},
	["WAVE3"] = {
		["id"] = "WAVE3",
		["chance"] = 25,
		["speed"] = 100
	},
	["WAVE4"] = {
		["id"] = "WAVE4",
		["chance"] = 15,
		["speed"] = 125
	},
	["WAVE5"] = {
		["id"] = "WAVE5",
		["chance"] = 5,
		["speed"] = 150
	}
}
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.TraitsConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = require(v1.Shared.VfxManager)
local v_u_4 = v1.Assets.TrailEffects
local v_u_5 = v1.Assets.ExplosionEffects
local v6 = {}
local v25 = {
	["LAVA"] = {
		["id"] = "LAVA",
		["name"] = "Lava",
		["image"] = 83992414374343,
		["cashMulti"] = 1.1,
		["hitChance"] = 0.04,
		["hitFunction"] = function(p7)
			-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_5, (copy) v_u_3
			local v8 = v_u_4.LAVA:Clone()
			local v9 = math.random(-500, 500)
			local v10 = math.random(-500, 500)
			v8:PivotTo(CFrame.new(p7 + Vector3.new(v9, 580, v10)))
			v8.Parent = workspace.FX.EventParts
			local v11 = TweenInfo.new(7, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
			v_u_2:Create(v8.PrimaryPart, v11, {
				["Position"] = p7
			}):Play()
			task.wait(7)
			v8:Destroy()
			local v12 = v_u_5.LAVA:Clone()
			v12:PivotTo(CFrame.new(p7))
			v12.Parent = workspace.FX.EventParts
			v_u_3.Emit(v12)
			task.wait()
			task.wait(0.5)
			v12:Destroy()
		end
	},
	["GLITCH"] = {
		["id"] = "GLITCH",
		["name"] = "Glitch",
		["image"] = 130546715352700,
		["cashMulti"] = 1.2,
		["hitChance"] = 0.035,
		["hitFunction"] = function(p13)
			-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_5, (copy) v_u_3
			local v14 = v_u_4.GLITCH:Clone()
			local v15 = math.random(-500, 500)
			local v16 = math.random(-500, 500)
			v14:PivotTo(CFrame.new(p13 + Vector3.new(v15, 580, v16)))
			v14.Parent = workspace.FX.EventParts
			local v17 = TweenInfo.new(7, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
			v_u_2:Create(v14.PrimaryPart, v17, {
				["Position"] = p13
			}):Play()
			task.wait(7)
			v14:Destroy()
			local v18 = v_u_5.GLITCH:Clone()
			v18:PivotTo(CFrame.new(p13))
			v18.Parent = workspace.FX.EventParts
			v_u_3.Emit(v18)
			task.wait()
			task.wait(0.5)
			v18:Destroy()
		end
	},
	["ICE"] = {
		["id"] = "ICE",
		["name"] = "Ice",
		["image"] = 91929766337053,
		["toolImage"] = 119374831534343,
		["cashMulti"] = 1.2,
		["hitChance"] = 0.035,
		["hitFunction"] = function(p19)
			-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_5, (copy) v_u_3
			local v20 = v_u_4.ICE:Clone()
			local v21 = math.random(-500, 500)
			local v22 = math.random(-500, 500)
			v20:PivotTo(CFrame.new(p19 + Vector3.new(v21, 580, v22)))
			v20.Parent = workspace.FX.EventParts
			local v23 = TweenInfo.new(7, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
			v_u_2:Create(v20.PrimaryPart, v23, {
				["Position"] = p19
			}):Play()
			task.wait(7)
			v20:Destroy()
			local v24 = v_u_5.ICE:Clone()
			v24:PivotTo(CFrame.new(p19))
			v24.Parent = workspace.FX.EventParts
			v_u_3.Emit(v24)
			task.wait()
			task.wait(0.5)
			v24:Destroy()
		end
	}
}
v6.TRAITS = v25
return v6

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.BossConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {}
local v2 = {
	["name"] = "Boss 1",
	["speed"] = 13,
	["pickupChaseSpeed"] = 35,
	["level"] = 1,
	["BossWait"] = 0,
	["playerSpeedModifier"] = 1,
	["pool"] = {
		{
			["id"] = "cacto_hipopotamo",
			["chance"] = 55
		},
		{
			["id"] = "cocofanto_elefanto",
			["chance"] = 40
		},
		{
			["id"] = "ballerina_cappuccina",
			["chance"] = 5
		}
	},
	["idleAnimation"] = 77211657881589,
	["chaseAnimation"] = 125080381413361,
	["attackAnimation"] = 122736688378031
}
v1.base1 = v2
local v3 = {
	["name"] = "Boss 2",
	["speed"] = 26,
	["pickupChaseSpeed"] = 61.25,
	["level"] = 2,
	["BossWait"] = 0.725,
	["playerSpeedModifier"] = 0.97,
	["pool"] = {
		{
			["id"] = "cocofanto_elefanto",
			["chance"] = 50
		},
		{
			["id"] = "ballerina_cappuccina",
			["chance"] = 30
		},
		{
			["id"] = "gangster_foottera",
			["chance"] = 15
		},
		{
			["id"] = "udin_din_din_dun",
			["chance"] = 4
		},
		{
			["id"] = "brr_brr_patapim",
			["chance"] = 1
		}
	},
	["idleAnimation"] = 77211657881589,
	["chaseAnimation"] = 125080381413361,
	["attackAnimation"] = 122736688378031
}
v1.base2 = v3
local v4 = {
	["name"] = "Boss 3",
	["speed"] = 40,
	["pickupChaseSpeed"] = 87.5,
	["level"] = 3,
	["BossWait"] = 0.725,
	["playerSpeedModifier"] = 0.95,
	["pool"] = {
		{
			["id"] = "udin_din_din_dun",
			["chance"] = 50
		},
		{
			["id"] = "brr_brr_patapim",
			["chance"] = 30
		},
		{
			["id"] = "capuccino_assassino",
			["chance"] = 15
		},
		{
			["id"] = "gorillo_watermellondrillo",
			["chance"] = 4
		},
		{
			["id"] = "trippi_troppi_troppa_trippa",
			["chance"] = 1
		}
	},
	["idleAnimation"] = 77211657881589,
	["chaseAnimation"] = 125080381413361,
	["attackAnimation"] = 122736688378031
}
v1.base3 = v4
local v5 = {
	["name"] = "Boss 4",
	["speed"] = 55,
	["pickupChaseSpeed"] = 115,
	["level"] = 4,
	["BossWait"] = 1.1,
	["playerSpeedModifier"] = 0.93,
	["pool"] = {
		{
			["id"] = "gorillo_watermellondrillo",
			["chance"] = 50
		},
		{
			["id"] = "trippi_troppi_troppa_trippa",
			["chance"] = 30
		},
		{
			["id"] = "raccooni_watermelunni",
			["chance"] = 15
		},
		{
			["id"] = "ta_ta_ta_ta_sahur",
			["chance"] = 4
		},
		{
			["id"] = "glorbo_frutodrillo",
			["chance"] = 1
		}
	},
	["idleAnimation"] = 135187649970595,
	["chaseAnimation"] = 113219513098912,
	["attackAnimation"] = 1
}
v1.base4 = v5
local v6 = {
	["name"] = "Boss 5",
	["speed"] = 78,
	["pickupChaseSpeed"] = 137.5,
	["level"] = 5,
	["BossWait"] = 1.6,
	["playerSpeedModifier"] = 0.9,
	["pool"] = {
		{
			["id"] = "ta_ta_ta_ta_sahur",
			["chance"] = 50
		},
		{
			["id"] = "glorbo_frutodrillo",
			["chance"] = 30
		},
		{
			["id"] = "frigo_camello",
			["chance"] = 15
		},
		{
			["id"] = "orangutini_ananassini",
			["chance"] = 4.5
		},
		{
			["id"] = "ballerino_lololo",
			["chance"] = 0.5
		}
	},
	["idleAnimation"] = 77211657881589,
	["chaseAnimation"] = 125080381413361,
	["attackAnimation"] = 122736688378031
}
v1.base5 = v6
local v7 = {
	["name"] = "Boss 6",
	["speed"] = 100,
	["pickupChaseSpeed"] = 172.5,
	["level"] = 6,
	["BossWait"] = 1.6,
	["playerSpeedModifier"] = 0.85,
	["pool"] = {
		{
			["id"] = "orangutini_ananassini",
			["chance"] = 50
		},
		{
			["id"] = "ballerino_lololo",
			["chance"] = 30
		},
		{
			["id"] = "svinina_bombobardino",
			["chance"] = 15
		},
		{
			["id"] = "frulli_frula",
			["chance"] = 4.5
		},
		{
			["id"] = "tracoducotulu_delapeladustuz",
			["chance"] = 0.5
		}
	},
	["idleAnimation"] = 77211657881589,
	["chaseAnimation"] = 125080381413361,
	["attackAnimation"] = 122736688378031
}
v1.base6 = v7
local v8 = {
	["name"] = "Boss 7",
	["speed"] = 120,
	["pickupChaseSpeed"] = 194,
	["level"] = 7,
	["BossWait"] = 2,
	["playerSpeedModifier"] = 0.8,
	["pool"] = {
		{
			["id"] = "frulli_frula",
			["chance"] = 50
		},
		{
			["id"] = "tracoducotulu_delapeladustuz",
			["chance"] = 30
		},
		{
			["id"] = "ganganzelli_trulala",
			["chance"] = 15
		},
		{
			["id"] = "orcalero_orcala",
			["chance"] = 4.75
		},
		{
			["id"] = "lerulerulerule",
			["chance"] = 0.25
		}
	},
	["idleAnimation"] = 77211657881589,
	["chaseAnimation"] = 125080381413361,
	["attackAnimation"] = 122736688378031
}
v1.base7 = v8
local v9 = {
	["name"] = "Boss 8",
	["speed"] = 140,
	["pickupChaseSpeed"] = 195,
	["level"] = 8,
	["BossWait"] = 2.1,
	["playerSpeedModifier"] = 0.7645,
	["pool"] = {
		{
			["id"] = "orcalero_orcala",
			["chance"] = 50
		},
		{
			["id"] = "lerulerulerule",
			["chance"] = 30
		},
		{
			["id"] = "cavallo_virtuoso",
			["chance"] = 15
		},
		{
			["id"] = "rhino_toasterino",
			["chance"] = 4.75
		},
		{
			["id"] = "te_te_te_te_sahur",
			["chance"] = 0.25
		}
	},
	["idleAnimation"] = 77211657881589,
	["chaseAnimation"] = 125080381413361,
	["attackAnimation"] = 122736688378031
}
v1.base8 = v9
local v10 = {
	["name"] = "Boss 9",
	["speed"] = 160,
	["pickupChaseSpeed"] = 195.75,
	["level"] = 9,
	["BossWait"] = 2.2,
	["playerSpeedModifier"] = 0.7575,
	["pool"] = {
		{
			["id"] = "rhino_toasterino",
			["chance"] = 50
		},
		{
			["id"] = "te_te_te_te_sahur",
			["chance"] = 30
		},
		{
			["id"] = "mateo",
			["chance"] = 15
		},
		{
			["id"] = "torrtuginni_dragonfrutinni",
			["chance"] = 4.8
		},
		{
			["id"] = "los_tralaleritos",
			["chance"] = 0.2
		}
	},
	["idleAnimation"] = 77569381325164,
	["chaseAnimation"] = 92999076404775,
	["attackAnimation"] = 1
}
v1.base9 = v10
local v11 = {
	["name"] = "Boss 10",
	["speed"] = 180,
	["pickupChaseSpeed"] = 200,
	["level"] = 10,
	["BossWait"] = 2.5,
	["playerSpeedModifier"] = 0.64,
	["pool"] = {
		{
			["id"] = "torrtuginni_dragonfrutinni",
			["chance"] = 50
		},
		{
			["id"] = "los_tralaleritos",
			["chance"] = 30
		},
		{
			["id"] = "pot_hotspot",
			["chance"] = 15
		},
		{
			["id"] = "los_crocodillitos",
			["chance"] = 4.8
		},
		{
			["id"] = "chicleteira_bicicleteira",
			["chance"] = 0.2
		}
	},
	["idleAnimation"] = 77211657881589,
	["chaseAnimation"] = 125080381413361,
	["attackAnimation"] = 122736688378031
}
v1.base10 = v11
local v12 = {
	["name"] = "Boss 11",
	["speed"] = 190,
	["pickupChaseSpeed"] = 207,
	["level"] = 11,
	["BossWait"] = 2.5,
	["playerSpeedModifier"] = 0.6,
	["pool"] = {
		{
			["id"] = "los_crocodillitos",
			["chance"] = 50
		},
		{
			["id"] = "chicleteira_bicicleteira",
			["chance"] = 30
		},
		{
			["id"] = "la_vacca_saturno_saturnita",
			["chance"] = 19.85
		},
		{
			["id"] = "las_vaquitas_saturnitas",
			["chance"] = 0.15
		}
	},
	["idleAnimation"] = 77211657881589,
	["chaseAnimation"] = 125080381413361,
	["attackAnimation"] = 122736688378031
}
v1.base11 = v12
local v13 = {
	["name"] = "Boss 12",
	["speed"] = 200,
	["pickupChaseSpeed"] = 225.75,
	["level"] = 12,
	["BossWait"] = 2.6,
	["playerSpeedModifier"] = 0.57,
	["pool"] = {
		{
			["id"] = "la_vacca_saturno_saturnita",
			["chance"] = 50
		},
		{
			["id"] = "las_vaquitas_saturnitas",
			["chance"] = 30
		},
		{
			["id"] = "spaghetti_tualetti",
			["chance"] = 4.85
		},
		{
			["id"] = "tigrrullini_watermellini",
			["chance"] = 0.15
		}
	},
	["idleAnimation"] = 77211657881589,
	["chaseAnimation"] = 125080381413361,
	["attackAnimation"] = 122736688378031
}
v1.base12 = v13
local v14 = {
	["name"] = "Boss 13",
	["speed"] = 210,
	["pickupChaseSpeed"] = 300,
	["level"] = 13,
	["BossWait"] = 2.5,
	["playerSpeedModifier"] = 0.55,
	["pool"] = {
		{
			["id"] = "spaghetti_tualetti",
			["chance"] = 50
		},
		{
			["id"] = "tigrrullini_watermellini",
			["chance"] = 30
		},
		{
			["id"] = "dragoni_cannelloni",
			["chance"] = 4.9
		},
		{
			["id"] = "boneca_ambalabu",
			["chance"] = 0.1
		}
	},
	["idleAnimation"] = 112712903340171,
	["chaseAnimation"] = 99360885857024,
	["attackAnimation"] = 1
}
v1.base13 = v14
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.GearsConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v1 = {}
local v2 = {}
local v3 = {
	["id"] = "BLUE_COIL",
	["name"] = "Blue Coil",
	["image"] = 88770300108646,
	["rarity"] = "Common",
	["type"] = "SpeedCoil",
	["price"] = 10,
	["stats"] = {
		["speedBoost"] = 1.2
	},
	["layoutOrder"] = 1,
	["devProductId"] = 1,
	["defaultPrice"] = 10
}
v2.BLUE_COIL = v3
local v4 = {
	["id"] = "GREEN_COIL",
	["name"] = "Green Coil",
	["image"] = 99795908476669,
	["rarity"] = "Uncommon",
	["type"] = "SpeedCoil",
	["price"] = 100,
	["stats"] = {
		["speedBoost"] = 1.3
	},
	["layoutOrder"] = 2,
	["devProductId"] = 1,
	["defaultPrice"] = 10
}
v2.GREEN_COIL = v4
local v5 = {
	["id"] = "PINK_COIL",
	["name"] = "Pink Coil",
	["image"] = 140622290291433,
	["rarity"] = "Rare",
	["type"] = "SpeedCoil",
	["price"] = 10000,
	["stats"] = {
		["speedBoost"] = 2.5
	},
	["layoutOrder"] = 3,
	["devProductId"] = 1,
	["defaultPrice"] = 10
}
v2.PINK_COIL = v5
local v6 = {
	["id"] = "LAVA_COIL",
	["name"] = "Laval Coil",
	["image"] = 135712649303352,
	["rarity"] = "Epic",
	["type"] = "SpeedCoil",
	["price"] = 1000,
	["stats"] = {
		["speedBoost"] = 2
	},
	["layoutOrder"] = 4,
	["devProductId"] = 1,
	["defaultPrice"] = 10
}
v2.LAVA_COIL = v6
local v7 = {
	["id"] = "GHOST_COIL",
	["name"] = "Ghost Coil",
	["image"] = 110564804843561,
	["rarity"] = "Legendary",
	["type"] = "SpeedCoil",
	["price"] = 100000,
	["stats"] = {
		["speedBoost"] = 2.7
	},
	["layoutOrder"] = 5,
	["devProductId"] = 1,
	["defaultPrice"] = 10
}
v2.GHOST_COIL = v7
local v8 = {
	["id"] = "CHEESE_COIL",
	["name"] = "Cheese Coil",
	["image"] = 125682212334635,
	["rarity"] = "Mythic",
	["type"] = "SpeedCoil",
	["price"] = 100000,
	["stats"] = {
		["speedBoost"] = 2.7
	},
	["layoutOrder"] = 6,
	["devProductId"] = 1,
	["defaultPrice"] = 10
}
v2.CHEESE_COIL = v8
local v9 = {
	["id"] = "RAINBOW_COIL",
	["name"] = "Rainbow Coil",
	["image"] = 104198492504739,
	["rarity"] = "Secret",
	["type"] = "SpeedCoil",
	["price"] = 100000,
	["stats"] = {
		["speedBoost"] = 2.7
	},
	["layoutOrder"] = 7,
	["devProductId"] = 1,
	["defaultPrice"] = 10
}
v2.RAINBOW_COIL = v9
v1.GEARS = v2
return v1

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.BrainrotsConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

game:GetService("SoundService")
local v1 = game:GetService("ReplicatedStorage")
require(v1.Configs.RaritiesConfig)
local v2 = {
	["tralalero_tralala"] = {
		["id"] = "tralalero_tralala",
		["name"] = "Tralalero Tralala",
		["image"] = 102434075365847,
		["rarity"] = "Eternal",
		["cashPerSecond"] = 100000,
		["idleAnimation"] = 101284863092183
	},
	["meowl"] = {
		["id"] = "meowl",
		["name"] = "Meowl",
		["image"] = 134399876688565,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 3000000,
		["idleAnimation"] = 139454368624229
	},
	["67"] = {
		["id"] = "67",
		["name"] = "67",
		["image"] = 82172817997884,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 2750000,
		["idleAnimation"] = 112442428466366
	},
	["yoni"] = {
		["id"] = "yoni",
		["name"] = "Yoni",
		["image"] = 108197788317036,
		["rarity"] = "Legendary",
		["cashPerSecond"] = 10000,
		["idleAnimation"] = 0
	},
	["burbaloni_luliloli"] = {
		["id"] = "burbaloni_luliloli",
		["name"] = "Burbaloni Luliloli",
		["image"] = 128450166546973,
		["rarity"] = "Cosmic",
		["cashPerSecond"] = 35000,
		["idleAnimation"] = 0
	},
	["trulimero_trulicina"] = {
		["id"] = "trulimero_trulicina",
		["name"] = "Trulimero Trulicina",
		["image"] = 88443088095596,
		["rarity"] = "Eternal",
		["cashPerSecond"] = 125000,
		["idleAnimation"] = 0
	},
	["agarrini_lapalini"] = {
		["id"] = "agarrini_lapalini",
		["name"] = "Agarrini Lapalini",
		["image"] = 74488136080688,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 400000,
		["idleAnimation"] = 0
	},
	["cacto_hipopotamo"] = {
		["id"] = "cacto_hipopotamo",
		["name"] = "Cacto Hipopotamo",
		["image"] = 76557104721587,
		["rarity"] = "Common",
		["cashPerSecond"] = 5,
		["idleAnimation"] = 83230828641282
	},
	["cocofanto_elefanto"] = {
		["id"] = "cocofanto_elefanto",
		["name"] = "Cocofanto Elefanto",
		["image"] = 88884964832376,
		["rarity"] = "Common",
		["cashPerSecond"] = 10,
		["idleAnimation"] = 119300576282315
	},
	["ballerina_cappuccina"] = {
		["id"] = "ballerina_cappuccina",
		["name"] = "Ballerina Cappuccina",
		["image"] = 84676987114768,
		["rarity"] = "Common",
		["cashPerSecond"] = 15,
		["idleAnimation"] = 137397161257475
	},
	["gangster_foottera"] = {
		["id"] = "gangster_foottera",
		["name"] = "Gangster Foottera",
		["image"] = 77027154847133,
		["rarity"] = "Uncommon",
		["cashPerSecond"] = 40,
		["idleAnimation"] = 80008295467942
	},
	["udin_din_din_dun"] = {
		["id"] = "udin_din_din_dun",
		["name"] = "Udin Din Din Dun",
		["image"] = 90219596711250,
		["rarity"] = "Uncommon",
		["cashPerSecond"] = 70,
		["idleAnimation"] = 102416720934570
	},
	["brr_brr_patapim"] = {
		["id"] = "brr_brr_patapim",
		["name"] = "Brr Brr Patapim",
		["image"] = 96279749671101,
		["rarity"] = "Uncommon",
		["cashPerSecond"] = 100,
		["idleAnimation"] = 108032879129823
	},
	["capuccino_assassino"] = {
		["id"] = "capuccino_assassino",
		["name"] = "Capuccino Assassino",
		["image"] = 96920048962306,
		["rarity"] = "Rare",
		["cashPerSecond"] = 175,
		["idleAnimation"] = 71670714859611
	},
	["gorillo_watermellondrillo"] = {
		["id"] = "gorillo_watermellondrillo",
		["name"] = "Gorillo Watermellondrillo",
		["image"] = 71393296666797,
		["rarity"] = "Rare",
		["cashPerSecond"] = 250,
		["idleAnimation"] = 102557539451735
	},
	["trippi_troppi_troppa_trippa"] = {
		["id"] = "trippi_troppi_troppa_trippa",
		["name"] = "Trippi Troppi Troppa Trippa",
		["image"] = 85575662194080,
		["rarity"] = "Rare",
		["cashPerSecond"] = 325,
		["idleAnimation"] = 96023122930855
	},
	["raccooni_watermelunni"] = {
		["id"] = "raccooni_watermelunni",
		["name"] = "Raccooni Watermelunni",
		["image"] = 133031464882136,
		["rarity"] = "Epic",
		["cashPerSecond"] = 500,
		["idleAnimation"] = 92661829989045
	},
	["ta_ta_ta_ta_sahur"] = {
		["id"] = "ta_ta_ta_ta_sahur",
		["name"] = "Ta Ta Ta Ta Sahur",
		["image"] = 102735324420171,
		["rarity"] = "Epic",
		["cashPerSecond"] = 700,
		["idleAnimation"] = 120568958392536
	},
	["glorbo_frutodrillo"] = {
		["id"] = "glorbo_frutodrillo",
		["name"] = "Glorbo Frutodrillo",
		["image"] = 104751464313086,
		["rarity"] = "Epic",
		["cashPerSecond"] = 900,
		["idleAnimation"] = 128578430404032
	},
	["frigo_camello"] = {
		["id"] = "frigo_camello",
		["name"] = "Frigo Camello",
		["image"] = 102833279886073,
		["rarity"] = "Legendary",
		["cashPerSecond"] = 1250,
		["idleAnimation"] = 90470525089618
	},
	["orangutini_ananassini"] = {
		["id"] = "orangutini_ananassini",
		["name"] = "Orangutini Ananassini",
		["image"] = 137908144886821,
		["rarity"] = "Legendary",
		["cashPerSecond"] = 1600,
		["idleAnimation"] = 127932783260995
	},
	["ballerino_lololo"] = {
		["id"] = "ballerino_lololo",
		["name"] = "Ballerino Lololo",
		["image"] = 139335488522018,
		["rarity"] = "Legendary",
		["cashPerSecond"] = 2000,
		["idleAnimation"] = 80093567080762
	},
	["svinina_bombobardino"] = {
		["id"] = "svinina_bombobardino",
		["name"] = "Svinina Bombobardino",
		["image"] = 81970199468897,
		["rarity"] = "Mythic",
		["cashPerSecond"] = 2750,
		["idleAnimation"] = 100620165701540
	},
	["frulli_frula"] = {
		["id"] = "frulli_frula",
		["name"] = "Frulli Frula",
		["image"] = 110802842072313,
		["rarity"] = "Mythic",
		["cashPerSecond"] = 3500,
		["idleAnimation"] = 90976584520018
	},
	["tracoducotulu_delapeladustuz"] = {
		["id"] = "tracoducotulu_delapeladustuz",
		["name"] = "Tracoducotulu Delapeladustuz",
		["image"] = 77515931470799,
		["rarity"] = "Mythic",
		["cashPerSecond"] = 4250,
		["idleAnimation"] = 136307481333272
	},
	["ganganzelli_trulala"] = {
		["id"] = "ganganzelli_trulala",
		["name"] = "Ganganzelli Trulala",
		["image"] = 118659647939467,
		["rarity"] = "Divine",
		["cashPerSecond"] = 6500,
		["idleAnimation"] = 96493984960617
	},
	["orcalero_orcala"] = {
		["id"] = "orcalero_orcala",
		["name"] = "Orcalero Orcala",
		["image"] = 108218571267213,
		["rarity"] = "Divine",
		["cashPerSecond"] = 9000,
		["idleAnimation"] = 132887324376807
	},
	["lerulerulerule"] = {
		["id"] = "lerulerulerule",
		["name"] = "Lerulerulerule",
		["image"] = 135043243091549,
		["rarity"] = "Divine",
		["cashPerSecond"] = 11500,
		["idleAnimation"] = 70804968079637
	},
	["cavallo_virtuoso"] = {
		["id"] = "cavallo_virtuoso",
		["name"] = "Cavallo Virtuoso",
		["image"] = 79080409481220,
		["rarity"] = "Secret",
		["cashPerSecond"] = 15000,
		["idleAnimation"] = 134852245511270
	},
	["rhino_toasterino"] = {
		["id"] = "rhino_toasterino",
		["name"] = "Rhino Toasterino",
		["image"] = 105843205066209,
		["rarity"] = "Secret",
		["cashPerSecond"] = 18500,
		["idleAnimation"] = 115937625766906
	},
	["te_te_te_te_sahur"] = {
		["id"] = "te_te_te_te_sahur",
		["name"] = "Te Te Te Te Sahur",
		["image"] = 103904998499297,
		["rarity"] = "Secret",
		["cashPerSecond"] = 22500,
		["idleAnimation"] = 95009551670741
	},
	["mateo"] = {
		["id"] = "mateo",
		["name"] = "Mateo",
		["image"] = 95689183636984,
		["rarity"] = "Secret",
		["cashPerSecond"] = 30000,
		["idleAnimation"] = 140669523349206
	},
	["torrtuginni_dragonfrutinni"] = {
		["id"] = "torrtuginni_dragonfrutinni",
		["name"] = "Torrtuginni Dragonfrutinni",
		["image"] = 103015292437142,
		["rarity"] = "Cosmic",
		["cashPerSecond"] = 37500,
		["idleAnimation"] = 104477010035192
	},
	["los_tralaleritos"] = {
		["id"] = "los_tralaleritos",
		["name"] = "Los Tralaleritos",
		["image"] = 96841064554730,
		["rarity"] = "Cosmic",
		["cashPerSecond"] = 45000,
		["idleAnimation"] = 122128717932294
	},
	["pot_hotspot"] = {
		["id"] = "pot_hotspot",
		["name"] = "Pot Hotspot",
		["image"] = 109515344140213,
		["rarity"] = "Eternal",
		["cashPerSecond"] = 70000,
		["idleAnimation"] = 117013186175745
	},
	["los_crocodillitos"] = {
		["id"] = "los_crocodillitos",
		["name"] = "Los Crocodillitos",
		["image"] = 78458090964401,
		["rarity"] = "Eternal",
		["cashPerSecond"] = 95000,
		["idleAnimation"] = 76886427630582
	},
	["chicleteira_bicicleteira"] = {
		["id"] = "chicleteira_bicicleteira",
		["name"] = "Chicleteira Bicicleteira",
		["image"] = 139093801416300,
		["rarity"] = "Eternal",
		["cashPerSecond"] = 125000,
		["idleAnimation"] = 108128987453441
	},
	["la_vacca_saturno_saturnita"] = {
		["id"] = "la_vacca_saturno_saturnita",
		["name"] = "La Vacca Saturno Saturnita",
		["image"] = 92107786111544,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 225000,
		["idleAnimation"] = 70793308025799
	},
	["las_vaquitas_saturnitas"] = {
		["id"] = "las_vaquitas_saturnitas",
		["name"] = "Las Vaquitas Saturnitas",
		["image"] = 130825704679324,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 325000,
		["idleAnimation"] = 138496707869884
	},
	["spaghetti_tualetti"] = {
		["id"] = "spaghetti_tualetti",
		["name"] = "Spaghetti Tualetti",
		["image"] = 129382128730416,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 500000,
		["idleAnimation"] = 73553950383805
	},
	["tigrrullini_watermellini"] = {
		["id"] = "tigrrullini_watermellini",
		["name"] = "Tigrrullini Watermellini",
		["image"] = 71306271178509,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 750000,
		["idleAnimation"] = 0
	},
	["dragoni_cannelloni"] = {
		["id"] = "dragoni_cannelloni",
		["name"] = "Dragoni Cannelloni",
		["image"] = 102461524198195,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 1000000,
		["idleAnimation"] = 120586856629831
	},
	["boneca_ambalabu"] = {
		["id"] = "boneca_ambalabu",
		["name"] = "Boneca Ambalabu",
		["image"] = 99894136812340,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 1250000,
		["idleAnimation"] = 89510108873981
	},
	["pipi_potato"] = {
		["id"] = "pipi_potato",
		["name"] = "Pipi Potato",
		["image"] = 121888126366614,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 425000,
		["idleAnimation"] = 116603484797098
	},
	["cathinni_sushinni"] = {
		["id"] = "cathinni_sushinni",
		["name"] = "Cathinni Sushinni",
		["image"] = 110821668735793,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 500000,
		["idleAnimation"] = 124538202076994
	},
	["graipus_medus"] = {
		["id"] = "graipus_medus",
		["name"] = "Graipus Medus",
		["image"] = 87177155024133,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 600000,
		["idleAnimation"] = 100175159047029
	},
	["ti_ti_ti_sahur"] = {
		["id"] = "ti_ti_ti_sahur",
		["name"] = "Ti Ti Ti Sahur",
		["image"] = 70837771264648,
		["rarity"] = "Secret",
		["cashPerSecond"] = 30000,
		["idleAnimation"] = 1
	},
	["spioniro_golubiro"] = {
		["id"] = "spioniro_golubiro",
		["name"] = "Spioniro Golubiro",
		["image"] = 110271886258449,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 1300000,
		["idleAnimation"] = 139252937708455
	},
	["salamino_penguino"] = {
		["id"] = "salamino_penguinoo",
		["name"] = "Salamino Penguino",
		["image"] = 126065937057878,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 1750000,
		["idleAnimation"] = 125877549244962
	},
	["karkirkur"] = {
		["id"] = "karkirkur",
		["name"] = "Karkirkur",
		["image"] = 100050580354126,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 2250000,
		["idleAnimation"] = 133633953850405
	},
	["chachechi"] = {
		["id"] = "chachechi",
		["name"] = "Chachechi",
		["image"] = 120570432564851,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 3000000,
		["idleAnimation"] = 111143046883776
	},
	["strawberry_elephant"] = {
		["id"] = "strawberry_elephant",
		["name"] = "Strawberry Elephant",
		["image"] = 139718889137279,
		["rarity"] = "SPECIAL",
		["cashPerSecond"] = 5000000,
		["idleAnimation"] = 129772735065293
	}
}
return v2

-- ================================================================
-- PATH:  ReplicatedStorage.Configs.QuestConfig
-- CLASS: ModuleScript
-- ================================================================
-- Decompiled with Medal by YuBX

local v_u_1 = {}
local v2 = {
	["Daily"] = {
		["enabled"] = false,
		["questAmount"] = 3,
		["resetInterval"] = 86400
	},
	["Weekly"] = {
		["enabled"] = false,
		["questAmount"] = 3,
		["resetInterval"] = 604800
	},
	["SeasonPass"] = {
		["enabled"] = true,
		["questAmount"] = 6,
		["autoClaim"] = true,
		["resetInterval"] = 86400
	},
	["SeasonPassHourly"] = {
		["enabled"] = true,
		["questAmount"] = 6,
		["autoClaim"] = true,
		["resetInterval"] = 3600
	}
}
v_u_1.CATEGORIES = v2
v_u_1.PROGRESS_TYPES = {
	["TIME_PLAYED"] = "TIME_PLAYED",
	["GET_BRAINROT"] = "GET_BRAINROT",
	["LEVEL_UP_BRAINROT"] = "LEVEL_UP_BRAINROT"
}
local v3 = {}
local v4 = {
	["id"] = "GET_25_BRAINROTS",
	["name"] = "Get 25 Brainrots",
	["description"] = "Get 25 Brainrots",
	["category"] = "SeasonPassHourly",
	["progressType"] = v_u_1.PROGRESS_TYPES.GET_BRAINROT,
	["targetAmount"] = 25
}
local v5 = {}
local v6 = {
	["rewardType"] = "Currency",
	["rewardData"] = {
		["type"] = "PassExp",
		["amount"] = 100
	}
}
__set_list(v5, 1, {v6})
v4.rewards = v5
v3.GET_25_BRAINROTS = v4
local v7 = {
	["id"] = "LEVEL_UP_BRAINROT_10_TIMES",
	["name"] = "Level up brainrot 10 times",
	["description"] = "Level up brainrots 10 times",
	["category"] = "SeasonPassHourly",
	["progressType"] = v_u_1.PROGRESS_TYPES.LEVEL_UP_BRAINROT,
	["targetAmount"] = 10
}
local v8 = {}
local v9 = {
	["rewardType"] = "Currency",
	["rewardData"] = {
		["type"] = "PassExp",
		["amount"] = 100
	}
}
__set_list(v8, 1, {v9})
v7.rewards = v8
v3.LEVEL_UP_BRAINROT_10_TIMES = v7
local v10 = {
	["id"] = "GET_1CANDY_BRAINROTS",
	["name"] = "Get 1 Candy Brainrot",
	["description"] = "Get 1 Candy Brainrot",
	["category"] = "SeasonPassHourly",
	["progressType"] = v_u_1.PROGRESS_TYPES.GET_BRAINROT,
	["targetAmount"] = 1,
	["conditions"] = {
		["mutation"] = "CANDY"
	}
}
local v11 = {}
local v12 = {
	["rewardType"] = "Currency",
	["rewardData"] = {
		["type"] = "PassExp",
		["amount"] = 100
	}
}
__set_list(v11, 1, {v12})
v10.rewards = v11
v3.GET_1CANDY_BRAINROTS = v10
local v13 = {
	["id"] = "PLAYTIME_SEASON",
	["name"] = "Play for 30 minutes",
	["description"] = "Play for 30 minutes",
	["category"] = "SeasonPass",
	["progressType"] = v_u_1.PROGRESS_TYPES.TIME_PLAYED,
	["targetAmount"] = 1800
}
local v14 = {}
local v15 = {
	["rewardType"] = "Currency",
	["rewardData"] = {
		["type"] = "PassExp",
		["amount"] = 1000
	}
}
__set_list(v14, 1, {v15})
v13.rewards = v14
v3.PLAYTIME_SEASON = v13
local v16 = {
	["id"] = "GET_1VOID_BRAINROTS",
	["name"] = "Get 1 Void Brainrot",
	["description"] = "Get 1 Void Brainrot",
	["category"] = "SeasonPass",
	["progressType"] = v_u_1.PROGRESS_TYPES.GET_BRAINROT,
	["targetAmount"] = 1,
	["conditions"] = {
		["mutation"] = "VOID"
	}
}
local v17 = {}
local v18 = {
	["rewardType"] = "Currency",
	["rewardData"] = {
		["type"] = "PassExp",
		["amount"] = 400
	}
}
__set_list(v17, 1, {v18})
v16.rewards = v17
v3.GET_1VOID_BRAINROTS = v16
local v19 = {
	["id"] = "GET_2DIAMOND_BRAINROTS",
	["name"] = "Get 2 Diamond Brainrots",
	["description"] = "Get 2 Diamond Brainrots",
	["category"] = "SeasonPass",
	["progressType"] = v_u_1.PROGRESS_TYPES.GET_BRAINROT,
	["targetAmount"] = 2,
	["conditions"] = {
		["mutation"] = "DIAMOND"
	}
}
local v20 = {}
local v21 = {
	["rewardType"] = "Currency",
	["rewardData"] = {
		["type"] = "PassExp",
		["amount"] = 400
	}
}
__set_list(v20, 1, {v21})
v19.rewards = v20
v3.GET_2DIAMOND_BRAINROTS = v19
local v22 = {
	["id"] = "GET_5CANDY_BRAINROTS",
	["name"] = "Get 5 Candy Brainrots",
	["description"] = "Get 5 Candy Brainrots",
	["category"] = "SeasonPass",
	["progressType"] = v_u_1.PROGRESS_TYPES.GET_BRAINROT,
	["targetAmount"] = 5,
	["conditions"] = {
		["mutation"] = "CANDY"
	}
}
local v23 = {}
local v24 = {
	["rewardType"] = "Currency",
	["rewardData"] = {
		["type"] = "PassExp",
		["amount"] = 400
	}
}
__set_list(v23, 1, {v24})
v22.rewards = v23
v3.GET_5CANDY_BRAINROTS = v22
local v25 = {
	["id"] = "GET_3GOLD_BRAINROTS",
	["name"] = "Get 3 Gold Brainrots",
	["description"] = "Get 3 Gold Brainrots",
	["category"] = "SeasonPass",
	["progressType"] = v_u_1.PROGRESS_TYPES.GET_BRAINROT,
	["targetAmount"] = 5,
	["conditions"] = {
		["mutation"] = "GOLD"
	}
}
local v26 = {}
local v27 = {
	["rewardType"] = "Currency",
	["rewardData"] = {
		["type"] = "PassExp",
		["amount"] = 400
	}
}
__set_list(v26, 1, {v27})
v25.rewards = v26
v3.GET_3GOLD_BRAINROTS = v25
local v28 = {
	["id"] = "GET_50_BRAINROTS",
	["name"] = "Get 50 Brainrots",
	["description"] = "Get 50 Brainrots",
	["category"] = "SeasonPass",
	["progressType"] = v_u_1.PROGRESS_TYPES.GET_BRAINROT,
	["targetAmount"] = 50
}
local v29 = {}
local v30 = {
	["rewardType"] = "Currency",
	["rewardData"] = {
		["type"] = "PassExp",
		["amount"] = 400
	}
}
__set_list(v29, 1, {v30})
v28.rewards = v29
v3.GET_50_BRAINROTS = v28
local v31 = {
	["id"] = "LEVEL_UP_BRAINROT_25_TIMES",
	["name"] = "Level up brainrot 25 times",
	["description"] = "Level up brainrots 25 times",
	["category"] = "SeasonPass",
	["progressType"] = v_u_1.PROGRESS_TYPES.LEVEL_UP_BRAINROT,
	["targetAmount"] = 25
}
local v32 = {}
local v33 = {
	["rewardType"] = "Currency",
	["rewardData"] = {
		["type"] = "PassExp",
		["amount"] = 400
	}
}
__set_list(v32, 1, {v33})
v31.rewards = v32
v3.LEVEL_UP_BRAINROT_25_TIMES = v31
v_u_1.QUESTS = v3
function v_u_1.GetQuestsByCategory(p34)
	-- upvalues: (copy) v_u_1
	local v35 = {}
	for _, v36 in v_u_1.QUESTS do
		if v36.category == p34 then
			table.insert(v35, v36)
		end
	end
	return v35
end
return v_u_1