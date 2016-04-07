function onUpdate(diff)
    --print("Onupdate")
end

function onDamageTaken(attacker, damage, dmgType, source)
   -- print("Damage taken is ".. damage)
end

function onAutoAttack(us, target)
    print("TWITCH - We just auto attacked!")
    
    --local buff = Buff.new("TwitchPassive", 6, BUFFTYPE_TEMPORARY, getTarget(), getOwner())
    --addBuff(buff, getTarget())
end