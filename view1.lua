-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------
-- JSON파싱--
local json = require("json")

local Data, pos, msg

local function parse()
	local filename = system.pathForFile("Content/JSON/story.json")
	Data, pos, msg = json.decodeFile(filename)
	if Data then
		print(Data[1].type)
	else
		print(pos)
		print(print)
	end
end
parse()

----
audio.stop( 1 )
local explosionSound = audio.loadSound( "image/City Key.mp3" )
audio.play( explosionSound )

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local starNum = math.random(12, 30);
	local star = {}
	local starGroup = display.newGroup()

	-------------------- 배경구성
	local background = display.newImage( "image/background.jpg")
	background.x, background.y = display.contentWidth/2, display.contentHeight/2
	local section = display.newRect(display.contentWidth/2, display.contentHeight*0.9, display.contentWidth, display.contentHeight*0.24)
	section:setFillColor(0.5, 0.5, 0.5, 0.5)

	local script = display.newText("더미 텍스트입니다.", section.x, section.y, display.contentWidth*0., 120)
	script.width = display.contentWidth*0.7
	script.size = 100
	script:setFillColor(0)
	------------------

	------대사
	local index = 1
	local function nextScript( ... )
		if(index <= #Data) then
			
			if( Data[index].type == "Narration") then
				script.text = Data[index].content
				index = index + 1
				script:setFillColor(0.8)
			elseif(Data[index].type == "Dialogue") then
				script.text = Data[index].content

				index = index + 1
			end
		else
			composer.gotoScene("view2")
		end
	end
	nextScript()

	local function tap( event )
		nextScript()
	end

	background:addEventListener("tap",tap)
	------
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene