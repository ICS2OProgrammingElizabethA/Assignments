--Title: Company Logo Animation
--Name: Elizabeth
-- Course: ICS2O/3C
--This program displays theCompany Logo across th screen.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

----SOUNDS
local backgroundSound = audio.loadSound("Sounds/clearday.mp3")
local backgroundSoundChannel

--global variables
local scrollSpeedBanana = 3
local gameTitleSpeed = 4
local gameTitle

--set the background
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

--character images with width and height
local banana = display.newImageRect("Images/CompanyLogoElizabeth@2x copy.png", 200, 400)

--display the game title
gameTitle = display.newText("The Jojo's", 0, 300, native.systemFontBold, 70)
gameTitle:setTextColor(102/255, 234/255, 255/255)
gameTitle.isVisible = true
timer.performWithDelay(1000, HideTitle)

--set the image to be transparent
banana.alpha = 1
gameTitle.alpha = 1
--set the initial x and y position of banana
banana.x = 200
banana.y = 0

gameTitle.x = 0
gameTitle.y = 300

--Function: MoveBanana
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the banana
local function MoveBanana(event)
	--add the scroll speed to the x-value of the banana
	banana.x = banana.x + scrollSpeedBanana
	banana.y = banana.y + scrollSpeedBanana
	--banana.y = banana.y - scrollSpeedBanana

	--change the transparency of the banana every time it so fast that it fades out
	banana.alpha = banana.alpha - 0.000000001
end

--Function: MoveTitle
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the game title
local function MoveTitle(event)
	--add the scroll speed to the x-value of the ship
	gameTitle.x = gameTitle.x + gameTitleSpeed

	--change the transparency of the ship every time it so fast that it fades out
	gameTitle.alpha = gameTitle.alpha - 0.00001
end

local function HideTitle()
	gameTitle.isVisible = false
	MoveBanana(event)
end

--MoveRealCat,MoveDog and MoveRocket will be called over and over again
backgroundSoundChannel = audio.play(backgroundSound)
Runtime:addEventListener("enterFrame", MoveBanana)
Runtime:addEventListener("enterFrame", MoveTitle)