local places = {
    [5777099015] = {name = "Cheese Escape"},
}

local currentPlaceId = game.PlaceId

if places[currentPlaceId] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/smthneededyk/unevyy/refs/heads/main/games/" .. places[currentPlaceId].name .. ".luau"))()
else
    warn("Universal is not supported")
end
