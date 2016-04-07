Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    local buff = Buff.new("TwitchQ", 4 * getSpellLevel(), BUFFTYPE_TEMPORARY, getTarget(), getOwner())
    buff:setMovementSpeedPercentModifier(30 * (0.5 * getSpellLevel()))
    adddBuff(buff, getOwner())
end

function applyEffects()
end