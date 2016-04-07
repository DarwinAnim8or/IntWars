Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = (Vector2:new(getSpellToX(), getSpellToY()) - current):normalize()
    local range = to * 1175
    local trueCoords = current + range

	addProjectileCustom("LuxPrismaticWave_mis", 1200, trueCoords.x, trueCoords.y)
	addParticle("LuxPrismaticWave_shieldself.troy", current.x, current.y)
end

function applyEffects()
	--addParticleTarget("LuxPrismaticWave_mis.troy", getTarget())
	addParticleTarget("LuxPrismaticWave_tar.troy", getTarget())
    addParticleTarget("LuxPrismaticWave_shield.troy", getTarget())
	addProjectileCustom("LuxPrismaticWave_mis", 1200, trueCoords.x, trueCoords.y)
    
   -- if (not isDead(target)) then
    	--add all functionality here
	--end
	
    --local buff = Buff.new("LuxPrismaWrap", 3.0, BUFFTYPE_TEMPORARY, getTarget())
    --addBuff(buff, getTarget())
    
    destroyProjectile()
    
    --TODO: check to see if we (and others) actually do GET our shield buff (correctly).
	getOwner():getStats():setCurrentHealth(getOwner():getStats():getCurrentHealth() - 80)
end