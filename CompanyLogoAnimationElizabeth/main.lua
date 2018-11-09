--Title: Company Logo
--Name: Elizabeth
-- Course: ICS2O/3C
--This program displays an image of our Company Logo across th screen.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--global variables
local scrollSpeedBanana = 3

--set the background colour
display.setDefault( "background", 195/255, 20/255, 165/255 )

--character images with width and height
local banana = display.newImageRect("Images/CompanyLogoElizabeth@2x copy.png", 200, 400)

--set the image to be transparent
realCat.alpha = 1

--set the initial x and y position of banana
realCat.x = 0
realCat.y = display.contentHeight / 3

--Function: MoveRealcat
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the ship
local function MoveBanana(event)
	--add the scroll speed to the x-value of the ship
	realCat.x = realCat.x + scrollSpeedCat

	--change the transparency of the ship every time it so fast that it fades out
	realCat.alpha = realCat.alpha - 0.000002/2
end

--MoveRealCat,MoveDog and MoveRocket will be called over and over again
Runtime:addEventListener("enterFrame", MoveBanana)