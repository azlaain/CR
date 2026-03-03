
local IdleState = require("states.IdleState")

MoveState = {}
MoveState.__index = MoveState

function MoveState:update(player, dt)
  if player.vx == 0 then
   player.stateMachine:change(IdleState)
  end
end


return MoveState
