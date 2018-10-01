--Name:Elizabeth Acheng---------------------------------------------------------------------------------------
--Title:Drawing Shapes
-- Course:ICS2O/3C
--This progarm displays three shapes and the names of the shapes to the command terminal.
-----------------------------------------------------------------------------------------

-- create my local variables
local textSize = 50
local triangleX = display.contentWidth * 100
local triangleY = display.contentHeight * 150
local vertices = { 100,100, 10,400, 200,400, }
local myTriangle
local textObject
local myHexagonVertices = { 0,150, -130,100, -130,-100, 0,-150, 130,-100, 130,100 }
local myHexagon
local myRoundedRect
local textObjectSignature
local areaOfTriangle
local baseOfTriangle = 200
local heightOfTriangle = 400

--set the background colour of my screen.Remember that colours are between 0 and 1.
display.setDefault("background", 211/255, 191/255, 255/255)

--to remove status bar
display.setStatusBar(display.HiddenStatusBar)

--draw my triangle that is half the width and half the height of the screen
myTriangle = display.newPolygon( 100, 80, vertices )
myTriangle.fill = { 66/255, 244/255, 179/255 }
myTriangle.strokeWidth = 20
myTriangle:setStrokeColor( 242/255, 94/255, 94/255 )

--anchor my triangle in the top left corner of the screen
myTriangle.anchorX = 0
myTriangle.anchorY = 0
myTriangle.x = 100
myTriangle.y = 100

--write the name of the triangle on the screen. 
--Take into consideration the size of the text font when positioning it on the screen.
texObject = display.newText("Triangle", 200, 450, Arial, textSize)

--sets the color of the text
texObject:setTextColor(166/255, 158/255, 255/255)

--draw my rounded rectangle and set its (x,y) position
myRoundedRect = display.newRoundedRect( 800, 150, 350, 130, 30 )
myRoundedRect.strokeWidth = 10
myRoundedRect:setFillColor( 18/255, 213/255, 226/255 )
myRoundedRect:setStrokeColor( 243/255, 86/255, 255/255 )


--write the name of the rounded rectangle on the screen. 
--Take into consideration the size of the text font when positioning it on the screen.
texObject = display.newText("Rounded Rectangle", 770, 270, Arial, textSize)

--sets the color of the text
texObject:setTextColor(85/255, 50/255, 119/255)

--draw my hexagon that is half the width and half the height of the screen
myHexagon = display.newPolygon( 800, 500, myHexagonVertices )
myHexagon.fill = { 47/255, 40/255, 122/255 }
myHexagon.strokeWidth = 20
myHexagon:setStrokeColor( 201/255, 226/255, 72/255 )


--write the name of the hexagon on the screen. 
--Take into consideration the size of the text font when positioning it on the screen.
texObject = display.newText("Hexagon", 800, 700, Arial, textSize)

--sets the color of the text
texObject:setTextColor(93/255, 20/255, 229/255)

--displays text on the screen at position x = 400 and y = 600 width 
--a default font style and font size of 80
textObjectSignature = display.newText( "By Elizabeth", 300, 700, nil, 85 )

--sets the color of the text
textObjectSignature:setTextColor(255/255, 40/255, 162/255)

--calculate the area of the triangle
areaOfTriangle = baseOfTriangle * heightOfTriangle/2

--write the area on the screen.
--Take into consideration the size of the text font when positioning it on the screen. 
areaOfTriangle = display.newText("Area of Triangle  \n".. " is ".. areaOfTriangle.. " pixels².",250, 560, Arial, textSize)
