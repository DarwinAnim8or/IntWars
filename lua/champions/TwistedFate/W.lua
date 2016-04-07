Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = (Vector2:new(getSpellToX(), getSpellToY()) - current):normalize()
    local range = to * 1450
    local trueCoords = current + range
    addProjectile(trueCoords.x, trueCoords.y)
end

function applyEffects()
	local extraDmg = getSpellLevel() * 10
	dealMagicalDamage(100 + extraDmg + (0.20 * getOwner:getStats():getTotalAp()))
	
	if (getOwnerLevel() >= 12) then
	    getOwner():getStats():setCurrentHealth(getOwner():getStats():getCurrentHealth() + 50)
	    getOwner():getStats():setCurrentMana(getOwner():getStats():getCurrentMana() + 20)
	    getTarget():getStats():setCurrentHealth(getOwner():getStats():getCurrentHealth() - 50)
	    getTarget():getStats():setCurrentMana(getOwner():getStats():getCurrnetMana() - 20)
	else
		getOwner():getStats():setCurrentHealth(getOwner():getStats():getCurrentHealth() + 150)
	    getOwner():getStats():setCurrentMana(getOwner():getStats():getCurrentMana() + 60)
	    getTarget():getStats():setCurrentHealth(getOwner():getStats():getCurrentHealth() - 150)
	    getTarget():getStats():setCurrentMana(getOwner():getStats():getCurrnetMana() - 60)
	end
	destroyProjectile()
end