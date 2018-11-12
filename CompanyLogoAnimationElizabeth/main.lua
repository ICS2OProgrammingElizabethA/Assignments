--Title: Company Logo
--Name: Elizabeth
-- Course: ICS2O/3C
--This program displays an image of our Company Logo across th screen.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

----SOUNDS
local backgroundSound = audio.loadSound("Sounds/")
local backgroundSoundChannel

--global variables
local scrollSpeedBanana = 3

--set the background colour
display.setDefault( "background", 195/255, 20/255, 165/255 )

--character images with width and height
local banana = display.newImageRect("Images/CompanyLogoElizabeth@2x copy.png", 200, 400)

--set the image to be transparent
banana.alpha = 1

--set the initial x and y position of banana
banana.x = 300
banana.y = 300

if (banana.x == 1578 ) then
	--add the scroll speed to the x value of the banana
	banana.x = banana.x - scrollSpeedBanana
	banana.y = banana.y - scrollSpeedBanana

	--change the transparency of the banana every time it so fast that it fades out
	banana.alpha = banana.alpha - 0.01

elseif (banana.x == 300) then
	--add the scroll speed to the x-value of the banana
	banana.x = banana.x + scrollSpeedBanana
	--banana.y = banana.y - scrollSpeedBanana

	--change the transparency of the banana every time it so fast that it fades out
	banana.alpha = banana.alpha + 0.01
end

--Function: MoveBanana
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the banana
local function MoveBanana(event)
	--add the scroll speed to the x-value of the banana
	banana.x = banana.x + scrollSpeedBanana
	--banana.y = banana.y - scrollSpeedBanana

	--change the transparency of the banana every time it so fast that it fades out
	banana.alpha = banana.alpha + 0.01
end

--MoveRealCat,MoveDog and MoveRocket will be called over and over again
Runtime:addEventListener("enterFrame", MoveBanana)