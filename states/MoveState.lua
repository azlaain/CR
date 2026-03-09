
local IdleState = require("states.IdleState")

MoveState = {}
MoveState.__index = MoveState

function MoveState:enter()
  print("entering move!")
end




function MoveState:update(player, dt)
  if not input.left or input.right then
   player.stateMachine:change(IdleState)
  end
end


return MoveState



