Movement = {}
Movement.__index = Movement

function Movement:new(player)
  local self = setmetatable({}, Movement)
  self.player = player
  self.gravity = 900
  self.terminalVelocity = 800
  self.groundY = 300
end




function Movement:update(dt)
  player.vy = player.vy + self.gravity * dt
  
end

return Movement
