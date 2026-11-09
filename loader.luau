local places = {
    [5777099015] = {name = "CheeseEscape"},
    [9053673709] = {name = "CheeseEscape"},
    [16527670555] = {name = "CheeseEscape"},
}

local currentPlaceId = game.PlaceId

if places[currentPlaceId] then
    local path = places[currentPlaceId].name
    local url = "https://raw.githubusercontent.com/smthneededyk/unevyy/refs/heads/main/games/" .. path .. ".luau"
    
    local ok, err = pcall(function()
        loadstring(game:HttpGet(url, true))()
    end)
    if not ok then warn("Error:", err) end
else
    warn("Universal is not supported")
end
