-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"


-- event listeners for tab buttons:
local function onStartView( event )
	composer.gotoScene( "start" )
end
local function onFirstView( event )
	composer.gotoScene( "view1" )
end

local function onSecondView( event )
	composer.gotoScene( "view2" )
end
local function onThirdView( event )
	composer.gotoScene( "view3" )
end
local function onfourthView( event )
	composer.gotoScene( "view4" )
end
onStartView()	-- invoke first tab button's onPress event manually
