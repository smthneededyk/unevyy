local places = {
    [5777099015] = {name = "CheeseEscape"}, -- chapter 1
    [9053673709] = {name = "CheeseEscape"}, -- chapter 2
    [16527670555] = {name = "CheeseEscape"}, -- chapter 3
    [8786790616] = {name = "CheeseEscape"}, -- boss fight
    [8786778788] = {name = "CheeseEscape"}, -- boss fight lobby
    
    [100453542816833] = {name = "SayCheese"}, -- say cheese ig?

    [73904017172892] = {name = "RollinACart"}, -- world 1
    [95434492276980] = {name = "RollinACart"}, -- world 2
    [108255263432726] = {name = "RollinACart"}, -- world 3
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
