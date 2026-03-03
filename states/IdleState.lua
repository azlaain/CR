local MoveState = require("states.MoveState")


IdleState = {}
IdleState.__index = IdleState

function IdleState:update(player,dt)
 if input.left then
    player.vx = -player.speed
    player.stateMachine:change(MoveState)
 end
 if input.right then
    player.vx = player.speed
    player.stateMachine:change(MoveState)
 end
end

return IdleState
