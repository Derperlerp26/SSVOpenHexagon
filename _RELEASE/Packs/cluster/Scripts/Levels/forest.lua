-- include useful files
u_execScript("utils.lua")
u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("nextpatterns.lua")
u_execScript("evolutionpatterns.lua")
u_execScript("ctpatterns.lua")
math.random()

-- this function adds a pattern to the timeline based on a key
function addPattern(mKey)
		if mKey == 0 then lotsOWalls(18)
	elseif mKey == 1 then spoopySpin()
	elseif mKey == 2 then cWallEx(getRandomSide(), getHalfSides())
	elseif mKey == 3 then spoopyFlower(getRandomSide())
	elseif mKey == 4 then spoopySlowing()
	elseif mKey == 5 then spoopyWobble(50)
	end
end

-- shuffle the keys, and then call them to add all the patterns
-- shuffling is better than randomizing - it guarantees all the patterns will be called
keys = {1}
keys = shuffle(keys)
index = 0
swoosh = 0

-- onInit is an hardcoded function that is called when the level is first loaded
function onInit()
	l_setSpeedMult(2.3)
	l_setSpeedInc(0.05)
	l_setRotationSpeed(0.020)
	l_setRotationSpeedMax(0.50)
	l_setRotationSpeedInc(0.0500)
	l_setDelayMult(1.0)
	l_setDelayInc(-0.00)
	l_setFastSpin(20.0)
	l_setSides(36)
	l_setSidesMin(36)
	l_setSidesMax(36)
	l_setIncTime(10)

	l_setPulseMin(60)
	l_setPulseMax(87)
	l_setPulseSpeed(1.2)
	l_setPulseSpeedR(1)
	l_setPulseDelayMax(12.9)

	l_setBeatPulseMax(17)
	l_setBeatPulseDelayMax(24.8)

	l_setSwapEnabled(true)
	
	l_setRadiusMin(40)
end

-- onLoad is an hardcoded function that is called when the level is started/restarted
function onLoad()
end

-- onStep is an hardcoded function that is called when the level timeline is empty
-- onStep should contain your pattern spawning logic
function onStep()
	addPattern(keys[index])
	index = index + 1

	if index - 1 == #keys then
		index = 0
	end
	t_wait(15)
end

-- onIncrement is an hardcoded function that is called when the level difficulty is incremented
function onIncrement()
end

-- onUnload is an hardcoded function that is called when the level is closed/restarted
function onUnload()
end

-- onUpdate is an hardcoded function that is called every frame
function onUpdate(mFrameTime)
end