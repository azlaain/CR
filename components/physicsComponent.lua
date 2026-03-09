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

function physicsComponent:beginContact(a, b, collision)
  if player.isGrounded == true then return end
  local mx, my = collision:getNormal()
  if a == self.fixture then
    if my > 0 then
      physicsComponent:land(collision)
    end
  elseif b == self.fixture then
    if my < 0 then
      physicsComponent:land(collision)
    end
  end
end

function physicsComponent:land(collision)
  -- print("groundCheck1")
  -- print(player.isGrounded)
  self.currentGroundCollision = collision
  player.components.Movement.vy = 0
  player.isGrounded = true
  -- print("groundCheck2")
  -- print(player.isGrounded)
end




function physicsComponent:endContact(a, b, collision)
  if a == self.fixture or b == self.fixture then
    if self.currentGroundCollision == collision then
      player.isGrounded = false
    end
  end
end


return physicsComponent
