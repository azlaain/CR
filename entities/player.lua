
local StateMachine = require("statemachine")
local Entity = require("entities.entity")
local IdleState = require("states.IdleState")
local Movement = require("components.movementComponent")
local Input = require("components.inputComponent")

-- if you can't find a key in player, look for it in entity instead! (inheritance)
local Player = setmetatable({}, {__index = Entity})
Player.__index = Player
-- function to create a new player object
function Player:new(x,y)
  -- create a new empty table ( which'll be player) then make it inherit from self
  -- (self is assigned to Player as it's automatically passed as the first argument)
  local self = setmetatable({}, self)
  -- call the abstract initilizer defined in Entity (sets default values for position alive and components)
  self:_init()
  self.x = x or 0
  self.y = y or 0
  -- defining player-specific properties (will be used for drawing and collision)
  self.width = 40
  self.height = 40
  self.walkSpeed = 200
  self.facing = -1
  self.jumpSpeed = -300
  self.inventory = {}
  self.vx = 0
  self.vy = 0
  self.isGrounded = false


-- calling all of the components n such
  
  self.stateMachine = StateMachine:new(self)
  self.stateMachine:change(IdleState)
  self.Input = Input:new()
  self.Movement = Movement:new()
  return self
end

return Player
