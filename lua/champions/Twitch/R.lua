Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = (Vector2:new(getSpellToX(), getSpellToY()) - current):normalize()
    local range = to * 975
    local trueCoords = current + range
    addProjectile(trueCoords.x, trueCoords.y)
    
    local buff = Buff.new("twitchR", 7, BUFFTYPE_TEMPORARY, getTarget(), getOwner())
    addBuff(buff, getOwner())
end

function applyEffects()
    dealPhysicalDamage(getEffectValue(0))
    destroyProjectile()
end