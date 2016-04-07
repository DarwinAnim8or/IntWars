Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = (Vector2:new(getSpellToX(), getSpellToY()) - current):normalize()
    local range = to * 950
    local trueCoords = current + range
    addProjectile(trueCoords.x, trueCoords.y)
end

function applyEffects()
    dealPhysicalDamage(getSpellLevel() * 6.5)
    
    -- This isn't really a buff, but the system should be the same so :P 
    -- And yes this is messy but it should work. Hopefully.
    
    if (not isDead(target)) then
    	addParticleTarget("Twitch_Venom_Debuff_buf.troy", getTarget())
    	
	    if (getSpellLevel() == 0) then -- 25% Slow - NEED TO CHECK IF SPELL LEVEL STARTS AT 0 OR NOT!!!!!
	    	local buff = Buff.new("TwitchPassive", 3.0, BUFFTYPE_TEMPORARY, getTarget(), getOwner())
	    	buff:setMovementSpeedPercentModifier(-25)
	   		addBuff(buff, getTarget())
	    end
	    
	    if (getSpellLevel() == 1) then -- 30%
	    	local buff = Buff.new("TwitchPassive", 3.0, BUFFTYPE_TEMPORARY, getTarget(), getOwner())
	    	buff:setMovementSpeedPercentModifier(-30)
	   		addBuff(buff, getTarget())
	    end
	    
	    if (getSpellLevel() == 2) then -- 35%
	    	local buff = Buff.new("TwitchPassive", 3.0, BUFFTYPE_TEMPORARY, getTarget(), getOwner())
	    	buff:setMovementSpeedPercentModifier(-35)
	   		addBuff(buff, getTarget())
	    end
	    
	    if (getSpellLevel() == 3) then -- 40%
	    	local buff = Buff.new("TwitchPassive", 3.0, BUFFTYPE_TEMPORARY, getTarget(), getOwner())
	    	buff:setMovementSpeedPercentModifier(-40)
	   		addBuff(buff, getTarget())
	    end
	    
	    if (getSpellLevel() == 4) then -- 45%
	    	local buff = Buff.new("TwitchPassive", 3.0, BUFFTYPE_TEMPORARY, getTarget(), getOwner())
	    	buff:setMovementSpeedPercentModifier(-45)
	   		addBuff(buff, getTarget())
	    end
    end
    
    destroyProjectile()
end