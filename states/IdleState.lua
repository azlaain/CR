local MoveState = require("states.MoveState")


IdleState = {}
IdleState.__index = IdleState

function IdleState:update(player,dt)

  if love.keyboard.isDown("left", "right") then
    player.stateMachine:change(MoveState)

  -- elseif love.keyboard.isDown("i", "j", "k","l") then
  --   player.stateMachine:change(AttackState)
  end
end

return IdleState
