Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = Vector2:new(getSpellToX(), getSpellToY()) - current
    local trueCoords
	
    if to:length() > 400 then
        to = to:normalize()
        local range = to * 400 --is actually 400, but doing it this way because it's faster to get to lane
        trueCoords = current:copy() + range
    else
        trueCoords = Vector2:new(getSpellToX(), getSpellToY())
    end
	addParticle("global_ss_flash.troy", getOwnerX(), getOwnerY())
	trueCoords.x, trueCoords.y = getClosestTerrainExit(getOwner(), trueCoords.x, trueCoords.y, false)
    teleportTo(trueCoords.x, trueCoords.y)
	addParticleTarget("global_ss_flash_02.troy", getOwner())
end

function applyEffects()
end