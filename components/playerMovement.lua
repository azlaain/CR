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


function playerMovement:update(dt)
  print("hi")
  if love.keyboard.isDown("a") then
    print("left")
    if self.vx < self.terminalVelocity then
      if self.vx + self.acceleration * dt < self.terminalVelocity then
        self.vx = self.vx + self.acceleration * dt
      else
       self.vx = self.terminalVelocity
    end
  end
  elseif love.keyboard.isDown("d") then
  print("right")
    if self.vx > -self.terminalVelocity then
      if self.vx +self.acceleration * dt > - self.terminalVelocity then
        self.vx = self.vx - self.acceleration * dt
      else
        self.vx = self.terminalVelocity
    end
  end
end
end
return playerMovement
