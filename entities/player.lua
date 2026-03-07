
local StateMachine = require("statemachine")
local Entity = require("entities.entity")
local IdleState = require("states.IdleState")
local Movement = require("components.movementComponent")
local Input = require("components.inputComponent")

local Player = setmetatable({}, {__index = Entity})
Player.__index = Player
function Player:new(x,y)
  local self = setmetatable({}, self)


  self:_init()
  self.x = x or 0
  self.y = y or 0
  self.width = 40
  self.height = 40
  self.walkSpeed = 200
  self.facing = -1
  self.jumpSpeed = -300
  self.inventory = {}
  self.vx = 0
  self.vy = 0
  self.isGrounded = false

-- physics stuff
  self.physics = {}

  
  -- self.physics.body = love.physics.newBody(World, self.x, self.y, "dynamic")
  self.physics.body:setFixedRotation(true) -- prevent player from rotatingi
  
  self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
  self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
  
  self.physics.body:setGravityScale(1) -- prevent player from falling


  -- component stuff

  self.components.StateMachine = StateMachine:new(self)
  self.components.StateMachine:change(IdleState)

  self.components.Input = Input:new()
  self.components.Movement = Movement:new()

  return self
end

return Player
