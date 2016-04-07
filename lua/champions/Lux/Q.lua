Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = (Vector2:new(getSpellToX(), getSpellToY()) - current):normalize()
    local range = to * 1175
    local trueCoords = current + range

	addProjectileCustom("LuxLightBindingMis", 1200, trueCoords.x, trueCoords.y)
end

function applyEffects()
	dealMagicalDamage(getEffectValue(0) + (0.7 * getOwner():getStats():getTotalAp()))
	addParticleTarget("LuxLightBinding_tar.troy", getTarget())
	
	-- add the snare
	local buff = Buff.new("LuxLightBinding", 2.0, BUFFTYPE_TEMPORARY, getTarget(), getOwner())
	buff:setMovementSpeedPercentModifier(-99.99)
	addBuff(buff, getTarget())
	addParticleTarget("LuxDebuff.troy", getTarget())
	
	if getNumberObjectsHit() == 2 then
		destroyProjectile()
	end
end