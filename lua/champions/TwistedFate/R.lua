Vector2 = require 'Vector2' -- include 2d vector lib 

-- Twisted Fate's Ultimate is a special case.
-- After casting, the player should see the entire map, and then when it's done casting, go to the target in range.
-- The reason this is special is because, well, does finishCasting() teleport the player? Or does applyEffects() do ? I don't know.
-- I'll just make the player teleport to it's target instantly in finishCasting() and not do anything in applyEffects() until we've tested it.

function finishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = Vector2:new(getSpellToX(), getSpellToY()) - current
    local trueCoords

    if to:length() > 5500 then
        to = to:normalize()
        local range = to * 5500
        trueCoords = current:copy() + range
    elseif(to:length() >= 2750 and isWalkable(getSpellToX(), getSpellToY()) == false) then
        -- Apply position fix when requested teleport distance is more than half
        to = to:normalize()
        local range = to * 5500
        trueCoords = current:copy() + range
    else
        trueCoords = Vector2:new(getSpellToX(), getSpellToY())
    end
    
    teleportTo(trueCoords.x, trueCoords.y)
end

function applyEffects()
end