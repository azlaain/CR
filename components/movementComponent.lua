Movement = {}
Movement.__index = Movement

function Movement:new(player)
  local self = setmetatable({}, Movement)
  self.player = player
  self.gravity = 1000
  self.terminalVelocity = 200
  self.groundY = 300
  self.speed = 100
  self.acceleration = 4000
  self.friciton = 2500 
  self.vx = 0
  self.vy = 0
  return self
end




function Movement:update(dt)
  -- player.vy = player.vy + self.gravity * dt
  -- player.x = player.x + player.vx * dt
  -- player.y = player.y + player.vy * dt
end

return Movement
