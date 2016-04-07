function onUpdate(diff)
    --print("Onupdate")
end

function onDamageTaken(attacker, damage, dmgType, source)
    print("LUX - Damage taken is ".. damage)
end

function onAutoAttack(target)
	print("LUX - We auto attacked!")
end

function onDealDamage(target, damage, damageType, source)
	print("LUX - Asked to deal damage")
	
	if (damage > 0) then
		print("Damage greater than 0, dealing extra damage: ".. damage)
		--dealMagicalDamage(damage)
	end
end