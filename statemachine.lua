local StateMachine = {}
StateMachine.__index = StateMachine
local wKeyPressed = false

function StateMachine:new(player)
  local self = setmetatable({}, self)

  self.wkeypressed = false
  self.player = player
  self.idle = false
  self.jumping = false
  self.moving = false
  self.attacking = false
  self.hit = false

  return self
end

function StateMachine:update(dt)
  self:changeMoving(dt)
  self:changeIdle(dt)
  self:changeJumping(dt)
  -- self:testFunction(dt)
end




function StateMachine:changeMoving(dt)
   -- local input = player.components.Input
 if love.keyboard.isDown("a") then
    self.moving = true
    print("moving left!")
 end
 if love.keyboard.isDown("d") then
   self.moving = true
   print("moving right!")
 end
end

function StateMachine:changeIdle(dt)
   if not (love.keyboard.isDown("a") or love.keyboard.isDown("d")) then
     self.moving = false
     self.idle = true
  end
end

function StateMachine:changeJumping(dt)
    if player.isGrounded == false and wKeyPressed == true then
    self.jumping = true
    print(self.jumping)

    wKeyPressed = false
    end
  end

function love.keypressed(key, scancode, isrepeat)
   if key == "w" then
     wKeyPressed = true
   end
end




-- function StateMachine:testFunction(dt)
--   print(player.isGrounded)  
-- end


return StateMachine
