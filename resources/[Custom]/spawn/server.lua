local spawnLocations = {
    { name = "Los Santos", coords = vector3(100.0, -1000.0, 30.0) },
    { name = "Sandy Shores", coords = vector3(1850.0, 3700.0, 33.0) },
    { name = "Paleto Bay", coords = vector3(-440.0, 6000.0, 30.0) }
}

function CreateSpawnMenu(playerId, discordRoles)
    local spawnMenu = {}

    for _, location in pairs(spawnLocations) do
        local roleRequired = "No Role Required"

        if location.name == "Los Santos" then
            roleRequired = "Player"
        elseif location.name == "Sandy Shores" then
            roleRequired = "Player"
        elseif location.name == "Paleto Bay" then
            roleRequired = "Player"
        end
        if roleRequired == "No Role Required" or discordRoles[roleRequired] then
            table.insert(spawnMenu, {
                name = location.name,
                label = location.name,
                action = "vMenu:Client:TeleportToCoords",
                value = { x = location.coords.x, y = location.coords.y, z = location.coords.z }
            })
        end
    end
    TriggerClientEvent("vMenu:CreateMenu", playerId, "Spawn Locations", "", spawnMenu)
end

AddEventHandler("playerSpawned", function()
    local playerId = source
    local player = PlayerId()
    local hasSelectedSpawn = true

    if not hasSelectedSpawn then
        local discordRoles = {} 
        TriggerEvent("DiscordRoles:playerRoles", playerId, function(roles)
            discordRoles = roles
            CreateSpawnMenu(playerId, discordRoles)
        end)
    end
end)
