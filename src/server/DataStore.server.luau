local DataStoreService = game:GetService("DataStoreService")

local DataStore = DataStoreService:GetDataStore("DataStore")

game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local Cash = Instance.new("IntValue")
	Cash.Name = "Cash"
	Cash.Parent = leaderstats
	
	local PlayerUserId = "Player"..player.UserId
	-- load data --
	
	local data
	local success, _ = pcall(function()
		data = DataStore:GetAsync(PlayerUserId)
	end)
	
	if success then
		if data then
			Cash.Value = data.Cash
		end
	end
end)


game.Players.PlayerRemoving:Connect(function(player)
	local PlayerUserId = "Player"..player.UserId
	
	local data = {
		Cash = player.leaderstats.Cash.Value
	}
	
	local _ , _ = pcall(function()
		DataStore:SetAsync(PlayerUserId,data)
	end)

end)