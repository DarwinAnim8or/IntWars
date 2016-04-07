Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    getOwner():getStats():setAttackSpeedMultiplier(15)
end

function applyEffects()
    dealMagicalDamage(getEffectValue(0) + 0.5 * getOwner():getStats():getTotalAp())
end