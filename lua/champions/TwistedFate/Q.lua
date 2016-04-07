Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = (Vector2:new(getSpellToX(), getSpellToY()) - current):normalize()
    local range = to * 1450
    local trueCoords = current + range
    addProjectile(trueCoords.x, trueCoords.y)
end

function applyEffects()
    dealMagicalDamage(getEffectValue(0) + 0.65 * getOwner():getStats():getTotalAp())
    destroyProjectile()
end