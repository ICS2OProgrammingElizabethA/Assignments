--Title: TouchAndDrag
--Name: Elizabeth
-- Course: ICS2O/3C
--This program displays images that react to a person's finger.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--global variables
local scrollSpeedCat = 3
local scrollSpeedDog = 4
local scrollSpeedRocket = 4

--local variables. I am trying to get the x value to be set properly
local backgroundImage = display.newImageRect("Images/space.jpg", 2048, 1536)

--character images with width and height
local realCat = display.newImageRect("Images/realcat.png", 200, 400)

local dog = display.newImageRect("Images/dog.png", 400, 300)

local rocket = display.newImageRect("Images/rocket.png", 300, 400)

--set the images to be transparent
realCat.alpha = 1
dog.alpha = 1
rocket.alpha = 1

--set the initial x and y position of beetleship and girl2
realCat.x = 0
realCat.y = display.contentHeight / 3
dog.x = display.contentWidth*3/3
dog.y = display.contentHeight*2/3
rocket.x = 200
rocket.y = 0
--Function: MoveRealcat
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the ship
local function MoveRealCat(event)
	--add the scroll speed to the x-value of the ship
	realCat.x = realCat.x + scrollSpeedCat

	--change the transparency of the ship every time it so fast that it fades out
	realCat.alpha = realCat.alpha - 0.000002/2
end

--Function: MoveDog
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the girl
local function MoveDog(event)
	--add the scroll speed to the x-value of the ship
	dog.x = dog.x - scrollSpeedDog

	--change the transparency of the ship every time it so fast that it fades out
	dog.alpha = dog.alpha - 0.000000000000005
end

--MoveRealCat,MoveDog and MoveRocket will be called over and over again
Runtime:addEventListener("enterFrame", MoveRealCat)
Runtime:addEventListener("enterFrame", MoveDog)

--Function: Moverocket
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the girl
local function MoveRocket(event)
	--add the scroll speed to the x-value of the ship
	rocket.x = rocket.x + scrollSpeedRocket
	rocket.y = rocket.y + scrollSpeedRocket

	--change the transparency of the srocket every time it so fast that it fades out
	rocket.alpha = rocket.alpha + 0.005
end

--MoveRealCat,MoveDog and MoveRocket will be called over and over again
Runtime:addEventListener("enterFrame", MoveRealCat)
Runtime:addEventListener("enterFrame", MoveDog)
Runtime:addEventListener("enterFrame", MoveRocket)

--create a local variable
local textObjectSignature

--displays text on the screen at position x = 400 and y = 600 width
--a default font style and font size of 50
textObjectSignature = display.newText( "By:Elizabeth", 600, 700, nil, 60 )

--set the text colour
textObjectSignature:setTextColor(226/255, 66/255, 244/255)
