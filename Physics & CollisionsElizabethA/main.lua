------------------------------------------------------------
--Title: Interacting Objects 2
--Name: Elizabeth A
--Course: ICS2O/3C
------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--load physics
local physics = require("physics")

--start physics
physics.start()

--SOUNDS--
local backgroundSound = audio.loadSound("Sounds/background.mp3")
local backgroundSoundChannel

backgroundSoundChannel = audio.play(backgroundSound)

---------------------------------------
--OBJECTS--
---------------------------------------
--Grond
local ground = display.newImage("Images/ground.png", 0, 740)

--------------------------------------------------------
--Put the ground at the middle of the screen width.
--Then put it at the bottom of the screen height.
--Change the width to be the same as the screen
--------------------------------------------------------
ground.width = display.contentWidth
ground.x = display.contentWidth/2
--Add to physics
physics.addBody(ground, "static", {friction = 0.4, bounce = 0.5})

----------------------------------------------------------------
--Display the image of the beam
local beam = display.newImage("Images/beam.png", 0, 0)
--set the x and y positions
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65

--set the beam width to be half of the width.
--Set the beam's height to be 1/10th of the iPad height. 
beam.width = display.contentWidth/2
beam.height = display.contentHeight*1/10

--rotate the beam -60 degrees so its on an angle
beam:rotate(40)

--send it to the back layer
beam:toBack()

--add to physics
physics.addBody(beam, "static", {friction = 0.6, bounce = 0.4})

--create the second beam
local beam2 = display.newImage("Images/beam.png", 900, 700)

--set the beam width and height. 
beam2.width = display.contentWidth/5
beam2.height = display.contentHeight

--send it to the back layer
beam2:toBack()

--add to physics
physics.addBody(beam2, "static", {friction = 0.7, bounce = 0.5})

--create the background
local background = display.newImage("Images/bkg.png", 0 ,0)

	--set the x and y positions
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	--set the width and height of the backgrund to 
	--be the width and height of the iPad
	background.width = display.contentWidth
	background.height = display.contentHeight

background:toBack()

----------------------------------------------------------------
--FUNCTIONS
--------------------------------------------------------------

--create thr first ball

local function firstBall()
	-- creating first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	--add to physics
	physics.addBody(ball1, {density = 0.3, friction = 0.6, bounce = 0.3, radius = 30})
end

------------------------------------------------------------
local function secondBall()
	-- creating second ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)

	--add to physics
	physics.addBody(ball2, {density=1.1, friction=0.6, bounce=0.4, radius = 12.5})

	--scale ball2 to be half of its original size
	ball2:scale(0.5, 0.5)
end

--create the third ball
local function thirdBall()
	-- creating third
	local ball3 = display.newImage("Images/super_ball.png",0, 0)
	ball3:scale(4, 4)
	--add to physics
		physics.addBody(ball3, {density = 1.9, friction = 4.5, bounce = 1.0, radius = 100})
end

--create the fourth ball
	local function fourthBall()
		-- creating second ball
		local ball4 = display.newImage("Images/super_ball.png", 0, 0)
		ball4:scale(2.5, 2.5)
	
		--add to physics
		physics.addBody(ball4, {density = 1,0, friction = 0.8, bounce = 2.7, radius = 55})
	end
	--------------------------------------------------------------------------------------------------------------
	--create the fifthball
	local function fifthBall()
		-- creating second ball
		local ball5 = display.newImage("Images/super_ball.png", 0, 0)

		--add to physics
		physics.addBody(ball5, {density = 1,0, friction = 0.8, bounce = 0.25, radius = 125})

		ball5:scale(5, 5)
	end

	---------------------------------------------------------------
	--TIMER DELAYS - CALL EACH FUNCTION AFTER THE GIVEN MILLISECOND
	---------------------------------------------------------------
	timer.performWithDelay(0, firstBall)
	timer.performWithDelay(500, secondBall)
	timer.performWithDelay(1000, thirdBall)
	timer.performWithDelay(1500, thirdBall)
	timer.performWithDelay(2000, thirdBall)
