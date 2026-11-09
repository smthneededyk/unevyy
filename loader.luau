local places = {
    [5777099015] = {
        name = "CheeseEscape",
        path = "Chapter 1",
        subplaces = {
            [9053673709] = {path = "Chapter 2"},
            [16527670555] = {path = "Chapter 3"},
            -- [] = {path = "Boss Fight"},
            -- [] = {path = "Random Maze"},
        }
    }
}

local lookup = {}

for id, game in pairs(places) do
    lookup[id] = {name = game.name, path = game.path}
    for subId, sub in pairs(game.subplaces) do
        lookup[subId] = {name = game.name, path = sub.path}
    end
end

local info = lookup[game.PlaceId]

if info then
    loadstring(game:HttpGet(""))()
else
    warn("Universal is not supported")
end
