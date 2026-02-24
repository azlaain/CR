
local StateMachine = require("statemachine")
local Entity = require("entities.entity") -- using the entity class from entity.lua
local IdleState = require("states.IdleState")
local MoveState = require("states.MoveState")



-- if you can't find a key in player, look for it in entity instead! (inheritance)
local Player = setmetatable({}, {__index = Entity})
Player.__index = Player
-- function to create a new player object
function Player:new(x,y)
  -- create a new empty table ( which'll be player) then make it inherit from self
  -- (self is assigned to Player as it's automatically passed as the first argument)
  local obj = setmetatable({}, self)
  -- call the abstract initilizer defined in Entity (sets default values for position alive and components)
  obj:_init()
  obj.x = x or 0
  obj.y = y or 0
  -- defining player-specific properties (will be used for drawing and collision)
  obj.width = 32
  obj.height = 32
  obj.speed = 200
  obj.facing = -1
  obj.gravity = 500
  obj.jumpSpeed = -300
  obj.inventory = {}
  -- attaching the statemachine

  obj.stateMachine = StateMachine:new(obj)
  obj.stateMachine:change(IdleState)

  
  return obj
end

return Player
