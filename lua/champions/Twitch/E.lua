Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = (Vector2:new(getSpellToX(), getSpellToY()) - current):normalize()
    local range = to * 850
    local trueCoords = current + range
    addProjectile(trueCoords.x, trueCoords.y)
end

function applyEffects()
	local dmg_base = getEffectValue(0)
	local dmg_ad = 0.25 * getOwner():getStats():getTotalAd()
	local dmg_ap = 0.2 * getOwner():getStats():getTotalAp()
	local dmg = dmg_base + dmg_ad = dmg_ap
    dealPhysicalDamage(dmg)
    destroyProjectile()
end