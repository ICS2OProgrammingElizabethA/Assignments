-- Title: MathQuiz
-- Name: Elizabeth
-- Course: ICS2O/3C
-- This program duisplays lives in form of four hearts and asks the user different 
--questions.if the user enter the wron answer or runs out of time,they lose a life.
--if they get it right,they earn a point. 

--------------------------------------------------------------
--LOCAL VARIABLES
-------------------------------------------------------------


--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
display.setDefault( "background", 195/255, 20/255, 165/255 )

--------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------

---VARIABLES FOR THE TIMER
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer
local gameOver
local lives = 5
local youWin


--create other local variables 
local questionObject
local correctObject
local incorrectObject

local numericField

local randomNumber1
local randomNumber2
local randomNumber3
local randomNumber4
local randomOperator
local userAnswer
local incorrectAnswer
local correctAnswer
local correctText

local pointsTextObject
local numberOfPoints = 0

--------------------------------------------------------
-- SOUNDS
--------------------------------------------------------

--Correct sound
local correctSound = audio.loadSound("Sounds/correct.mp3")
local correctSoundChannel

--Buddy sound
local sunnySound = audio.loadSound("Sounds/sunny.mp3")
local sunnySoundChannel

--Incorrect Sound
local incorrectSound = audio.loadSound("Sounds/incorrect.mp3")
local incorrectSoundChannel

--Incorrect Sound
local youWinSound = audio.loadSound("Sounds/youwinn.mp3")
local youWinSoundChannel


--------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------

local function UpdateHearts()
		
   	if (lives == 3) then
   		    heart1.isVisible = true
   			heart2.isVisible = true
   			heart3.isVisible = true

   	elseif (lives == 2) then
   		    heart1.isVisible = true
   			heart2.isVisible = true
   			heart3.isVisible = false

   	elseif (lives == 1) then
   			heart1.isVisible = true
   			heart2.isVisible = false
   			heart3.isVisible = false

   	elseif (lives == 0) then
   			heart1.isVisible = false
   			heart2.isVisible = false
   			heart3.isVisible = false

   			timerText.isVisible = false
   			incorrectObject.isVisible = false

   			gameOver.isVisible = true
   			sunnySoundChannel = audio.play(sunnySound)

   			numericField.isVisible = false
   			pointsTextObject.isVisible = false
   			questionObject.isVisible = false
   		end
end

local function CheckPoints( )
		-- monitor points till they reach 5
	if (numberOfPoints == 5) then
		-- display the you win screen
		youWin.isVisible = true

		--make the the unneeded objets invisible
		questionObject.isVisible = false
		timerText.isVisible = false
		pointsTextObject.isVisible = false
		numericField.isVisible = false

		--play you win sound
		youWinSoundChannel = audio.play(youWinSound)
	end
end

local function UpdateTime()
	-- decrement the number of sounds left
	secondsLeft = secondsLeft - 1

	--display the number of seconds left in the
	--clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		--reset the  number of seconds left 
		secondsLeft = totalSeconds
		lives = lives - 1

		--***IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND,
		--SHOW A "YOU LOSE IMAGE AND CANCEL THE TIMER, REMOVE
		--REMOVE THE THIRD HEART BY MAKIND IT INVISIBLE

   		UpdateHearts()
		--*** CALL THE FUNCTION TO ASK A NEW QUESTION
	end
end


--function that calls the timer
local function StartTime()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end


-- More Local Functions 

local function AskQuestion()
	--generate 2 random numbers between a max. and a min. number
	randomOperator = math.random(1,4)
	randomNumber1 = math.random(1,10)
	randomNumber2 = math.random(1,20)
	randomNumber3 = math.random(1,50)
	randomNumber4 = math.random(1,100)
	randomNumber5 = math.random(1, 10)

 
 	if (randomOperator == 1) then
 		correctAnswer = randomNumber1 + randomNumber2
	
		--create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif (randomOperator == 2) then
		questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
		if (randomNumber2 < randomNumber1) then
			questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
	 	    correctAnswer = randomNumber1 - randomNumber2

	 	elseif (randomNumber2 > randomNumber1) then
	 		questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
	 	    correctAnswer = randomNumber2 - randomNumber1
	 	end    

	elseif (randomOperator == 3) then
	 	correctAnswer = randomNumber1 * randomNumber5

		--create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber5 .. " = "

	elseif (randomOperator == 4) then
		correctAnswer = randomNumber5 / randomNumber4
		correctAnswer = randomNumber5 * randomNumber4
		temp = randomNumber5
		randomNumber5 = correctAnswer
		correctAnswer = temp
		questionObject.text = randomNumber5 .. " / " .. randomNumber4 .. " = "
	end	

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false 
	AskQuestion()
end

local function NumericFieldListener( event )

	--User begins editing "numericFeild"
	if ( event.phase == "began" ) then

		--clear text field 
		event.target.text = "" 

	elseif (event.phase == "submitted") then

		-- when the answer is submitted (enter key is pressed) set user input bto user's answer
		userAnswer = tonumber(event.target.text)


		--if the user's answer and the correct answer and the correct answer are the same:
	if (userAnswer == correctAnswer) then
            secondsLeft = totalSeconds
			correctObject.isVisible = true 
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(2000, HideCorrect)
			numberOfPoints = numberOfPoints + 1	

        -- create increasing points in the text object
			pointsTextObject.text = "Points = ".. numberOfPoints
			CheckPoints( )
		else
			incorrectObject.isVisible = true

			--tell the user the corect answer
			incorrectObject.text = ("Incorrect! The correct answer is " .. correctAnswer)

			secondsLeft = totalSeconds
			incorrectSoundChannel = audio.play(incorrectSound)
			lives = lives - 1
			UpdateHearts()
			timer.performWithDelay(2000, HideIncorrect) 			
		end
		event.target.text = "" 
	end
end

------------------------------------------------------------
--OBJECT CREATION
------------------------------------------------------------

--create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 200,100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 200, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 200, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7


clockText = display.newText(secondsLeft, 750, 650, native.systemFontBold, 70)
clockText:setFillColor( 44/255, 34/255, 186/255 )

--create gameOver image
gameOver = display.newImageRect("Images/tenor.gif", display.contentWidth, display.contentHeight)
gameOver.anchorX = 0
gameOver.anchorY = 0
gameOver.isVisible = false

--create youwin image
youWin = display.newImageRect("Images/youwin.png", display.contentWidth, display.contentHeight)
youWin.anchorX = 0
youWin.anchorY = 0
youWin.isVisible = false


-- create points box and make it visible
pointsTextObject = display.newText( "Correct = ".. numberOfPoints, 800, 250, nil, 60 )
pointsTextObject:setTextColor(44/255, 166/255, 155/255)

-- display a question and sets the color 
questionObject = display.newText("", display.contentWidth/2, display.contentHeight/2, nil, 90)
questionObject:setTextColor(244/255, 166/255, 86/255)

-- create the correct  text object and make it invisible
correctObject = display.newText("Correct!", display.contentWidth/2, 250, nil, 60)
correctObject:setTextColor(1/255, 0/255, 29/255)
correctObject.isVisible = false

-- create the incorrect  text object and make it invisible
incorrectObject = display.newText("Incorrect!", 380, 200, nil, 45)
incorrectObject:setTextColor(154/255, 244/255, 89/255)
incorrectObject.isVisible = false

--create timer text
timerText = display.newText( "Time Left = ", 520, 650, native.systemFontBold, 70)
timerText:setFillColor( 44/255, 34/255, 186/255 )

--create "The correct answer is ..." text
--correctText = display.newText("The correct answer is ".. correctAnswer, 800, 200, nil, 50)
--correctText:setTextColor(189/255, 200/255, 129/255)
--correctText.isVisible = true

-----------------------------------------------------------
-- CREATE THE NUMERIC FIELD 
------------------------------------------------------------

numericField = native.newTextField(display.contentWidth/2, display.contentHeight*2/3, 200, 80)
numericField.inputType = "default"

--add the event listener fo the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

---------------------------------------------------------
-- FUNCTION CALLS
----------------------------------------------------------
-- call the function to ask the Question
AskQuestion()
StartTime()


------CompanyLogoLiz
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