local Movement = require("components.movementComponent")

-- Create a new table for playerMovement
local playerMovement = {}


-- Set the metatable of playerMovement to Movement
setmetatable(playerMovement, { __index = Movement })

function playerMovement:new(player)
  local self = Movement:new(player)
  self.damage = 10
  return self
end


function Movement:update(dt)
  self.vy = self.vy + self.gravity * dt




  
  if love.keyboard.isDown("d") then
    print("right")
    if self.vx < self.terminalVelocity then
      print("check1")
      if self.vx + self.acceleration * dt < self.terminalVelocity then
        self.vx = self.vx + self.acceleration * dt
        print("check2")
      else
       self.vx = self.terminalVelocity
      end
    end


  
  elseif love.keyboard.isDown("a") then
  print("left")
    if self.vx > -self.terminalVelocity then
      if self.vx +self.acceleration * dt > - self.terminalVelocity then
        self.vx = self.vx - self.acceleration * dt
      else
        self.vx = self.terminalVelocity
      end
    end
    else
      self:applyFriction(dt)
    
    end


end


function playerMovement:applyFriction(dt)


  -- apply friction
  if self.vx > 0 then
    if self.vx - self.friction * dt > 0 then
      self.vx = self.vx - self.friction * dt
    else
      self.vx = 0
    end
    elseif self.vx < 0 then
     if self.vx + self.friction * dt < 0 then
       self.vx = self.vx + self.friction * dt
     else
       self.vx = 0
     end
  end



end



return playerMovement

