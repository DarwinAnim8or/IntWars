function onUpdate(diff)
    --print("Onupdate")
end

function onDamageTaken(attacker, damage, dmgType, source)
   -- print("Damage taken is ".. damage)
end

function onAutoAttack(us, target)
   print("TWISTED FATE - We just auto attacked!")
   local extraDamage = math.random(1, 6)
   dealMagicalDamage(extraDamage * 5)
   print("TWISTED FATE - Extra damage: " ..extraDamage * 5)
end