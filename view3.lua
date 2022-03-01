-----------------------------------------------------------------------------------------
--
-- view3.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local ending = display.newText("", display.contentWidth/2 + 700, display.contentHeight/2 + 700)
	ending.size = 100
	ending.text = "당신의 소원이 모두 이루어지길"

	local function timeAttack(event)
		composer.gotoScene("view4")
	end
	timer.performWithDelay(1000, timeAttack, 0)
	--[[local result = composer.getVariable("complete")
	local count = composer.getVariable("count")
	if count then
		ending.text = count
	else
		ending.text = 0
	end--]]
	--[[if result then 
		ending.text = "CLEAR!!"
	else
		ending.text = "FAIL!!"
	end--]]
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
