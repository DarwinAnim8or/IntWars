local timePassedTotal = 0
local movementSpeed = 330
local isSnare = true

-- `diff` is a string containing the amount of micro seconds between two `onUpdate` calls
function onUpdate(diff)
	timePassedTotal = timePassedTotal+tonumber(diff)
	setIsSnare(isSnare)
	
	-- 1,000,000 microseconds == 1 second
	if(timePassedTotal >= 2000000) then
		print("Timepassed more than/equal to 2 seconds")
		timePassedTotal = 0
		--set out speed back to the original value
		--getAttachedUnit():getStats():setMovementSpeed(movementSpeed)
	else 
		--set our speed to 0
		--getTarget():getStats():setMovementSpeed(0)
		--getAttachedUnit():getStats():setBaseMovementSpeed(0)
	end
end