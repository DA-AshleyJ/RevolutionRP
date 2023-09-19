AddEventHandler('playerSpawned', function(spawnInfo)
    local playerId = source
    TriggerClientEvent('showWelcomeScreen', playerId)
end)
