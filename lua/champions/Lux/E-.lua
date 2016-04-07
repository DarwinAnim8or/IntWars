Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = (Vector2:new(getSpellToX(), getSpellToY()) - current):normalize()
    local range = to * 1100
    local trueCoords = current + range

    --addProjectile(trueCoords.x, trueCoords.y)
	addProjectileCustom("LuxLightStrikeMis", 2400, trueCoords.x, trueCoords.y)
	addParticle("LuxBlitz_nova.troy", trueCoords.x, trueCoords.y)
end

function applyEffects()
	local dmg = getEffectValue(0)+(0.6 * getOwner():getStats():getTotalAp())
	dealMagicalDamage(dmg)


	addParticleTarget("LuxDebuff.troy", getTarget()
	addParticleTarget("LuxCrashingBlitz_Holder.troy", getTarget())

	--destroyProjectile()
end