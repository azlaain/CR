
local IdleState = require("states.IdleState")

MoveState = {}
MoveState.__index = MoveState

function MoveState:update(player, dt)

  if love.keyboard.isDown("left") then
    player.x = player.x - player.speed * dt
    player.facing = -1
    print("moving left")
  elseif love.keyboard.isDown("right") then
    player.x = player.x + player.speed * dt
    player.facing = 1
    print("moving right!")
  else
    player.stateMachine:change(IdleState)
  end
end
