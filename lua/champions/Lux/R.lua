Vector2 = require 'Vector2' -- include 2d vector lib 

function onCast()
	local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = (Vector2:new(getSpellToX(), getSpellToY()) - current):normalize()
    local range = to * 3340
    local trueCoords = current + range
	addParticle("LuxMaliceCannon_beam.troy", trueCoords.x, trueCoords.y)
	addParticleTarget("LuxMaliceCannon_cas.troy", getOwner())
	spellAnimation("Lux_Spell4", getOwner())
	
	--snare ourselves temporarily
	--local buff = Buff.new("", 1.5, BUFFTYPE_TEMPORARY, getOwner(), getOwner())
	--buff:setMovementSpeedPercentModifier(-99.99)
	--addBuff(buff, getOwner())
end

function finishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = (Vector2:new(getSpellToX(), getSpellToY()) - current):normalize()
    local range = to * 3340
    local trueCoords = current + range

    addProjectile(trueCoords.x, trueCoords.y)
end

function applyEffects()
    local dmg = getEffectValue(0)+(0.75*getOwner():getStats():getTotalAp())
    dealMagicalDamage(dmg)
   
	addParticleTarget("LuxDebuff.troy", getTarget())
end


--[[

Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = (Vector2:new(getSpellToX(), getSpellToY()) - current):normalize()
    local range = to * 3340
    local trueCoords = current + range

    addProjectile(trueCoords.x, trueCoords.y)
    addParticleTarget("LuxMaliceCannon_cas.troy", getOwner())
   -- addParticle("LuxMaliceCannon_beam.troy", range.x, range.y)
   -- addParticle("LuxMaliceCannon_beammiddle.troy", range.x, range.y)
   -- addParticle("LuxMaliceCannon_beam_green.troy", range.x, range.y)
   -- addParticle("LuxMaliceCannon_beam_red.troy", range.x, range.y)
end

function applyEffects()
	local dmg = getEffectValue(0)+(0.75*getOwner():getStats():getTotalAp())
    dealMagicalDamage(dmg)
	addParticleTarget("LuxMaliceCannon_beam.troy", getTarget())
	addParticleTarget("LuxMaliceCannon_tar.troy", getTarget())
	addParticleTarget("LuxDebuff.troy", getTarget())
	
	destroyProjectile()
end

--]] 