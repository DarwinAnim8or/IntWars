Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = (Vector2:new(getSpellToX(), getSpellToY()) - current):normalize()
    local range = to * 1000
    local trueCoords = current + range

    addProjectile(trueCoords.x, trueCoords.y)
end

function applyEffects()
	--dealMagicalDamage(getEffectValue(0)+ (0.2 * getOwner():getStats():getTotalAp()))
	dealMagicalDamage(50)
	destoryProjectile()
end