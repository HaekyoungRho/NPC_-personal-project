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
end
parse()

----
local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view	
	local background = display.newImage( "image/background.jpg")
	background.x, background.y = display.contentWidth/2, display.contentHeight/2
	local sceneGroup = self.view
	local starNum = math.random(12, 30);
	local star = {}
	local starGroup = display.newGroup()


	for i = 1,starNum do
		star[i] = display.newImage(starGroup, "image/1.png")
		star[i].x = background.x + math.random(-100, 1400)
		star[i].y = background.y + math.random(-800, 900)
	end
	--스코어 출력 --
	local score = 0
	local showScore = display.newText("소원 개수: "..score, display.contentWidth*0.9, display.contentHeight*0.1)
	showScore:setFillColor(0)
	showScore.size = 100

	--options 테이블 정의--
	local options = {
			effect = "zoomInOutFade",
			time = 777,
			params = { level="Level 1", score=currentScore }
		}

	local function catch(event)
		display.remove(event.target)

		score = score + 1
		showScore.text = "소원 개수: "..score;
		if score == starNum then
			composer.gotoScene("view3", options) -- 여기서 options 테이블 정의한 것 부름--
		end
	end

	for i =1,starNum do
		star[i]:addEventListener("tap", catch)
	end
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