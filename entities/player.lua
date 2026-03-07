
local StateMachine = require("statemachine")
local Entity = require("entities.entity")
local IdleState = require("states.IdleState")
local Movement = require("components.movementComponent")
local Input = require("components.inputComponent")
local Physics = require("components.physicsComponent")



local Player = setmetatable({}, {__index = Entity})
Player.__index = Player
function Player:new(x,y)
  local self = setmetatable({}, self)



  table.insert(entities, self)
  self:_init()
  self.x = x or 0
  self.y = y or 0
  self.width = 40
  self.height = 40
  self.walkSpeed = 200
  self.facing = -1
  self.jumpSpeed = -300
  self.inventory = {}
  self.isGrounded = false

-- physics stuff

  
  -- self.physics.body = love.physics.newBody(World, self.x, self.y, "dynamic")
  -- self.physics.body:setFixedRotation(true) -- prevent player from rotatingi
  
  -- self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
  -- self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
  


  -- component stuff
  self.components.Physics = Physics:init(self)

  -- self.components.StateMachine = StateMachine:new(self)
  -- self.components.StateMachine:change(IdleState)

  -- self.components.Input = Input:new()
  -- self.components.Movement = Movement:new()

  return self
end



function Player:syncPhysics()
   self.x, self.y = self.physics.body:getPosition()
   self.physics.body:setLinearVelocity(self.xVel, self.yVel)
end



function Player:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Player
