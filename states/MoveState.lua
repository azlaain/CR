
local IdleState = require("states.IdleState")

MoveState = {}
MoveState.__index = MoveState

function MoveState:enter()
  print("entering move!")
end




function MoveState:update(player, dt)
  local input = player.components.input
  if input.left then
    player.vx = -player.components.Movement.speed
  elseif input.right then
    player.vx = player.components.Movement.speed
  print(player.vx)
  else
   player.stateMachine:change(IdleState)
  end
end


return MoveState



