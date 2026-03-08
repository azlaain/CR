physicsComponent = {}
physicsComponent.__index = physicsComponent

function physicsComponent:init(player)
  local self = setmetatable({}, self)
  self.body = love.physics.newBody(World, player.x, player.y, "dynamic")
  self.body:setFixedRotation(true)
  self.shape = love.physics.newRectangleShape(player.width, player.height)
  -- self.shape = love.physics.newCircleShape(player.width/2)
  self.fixture = love.physics.newFixture(self.body, self.shape)
  self.fixture:setFriction(0)
  self.player = player

  return self
end

function physicsComponent:update(dt)
   player.x, player.y = self.body:getPosition()
   self.body:setLinearVelocity(player.components.Movement.vx, player.components.Movement.vy)
end

return physicsComponent
