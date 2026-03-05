IdleState = {}
IdleState.__index = IdleState

function IdleState:update(player,dt)
 if Input.left then
    player.vx = -player.speed
    player.stateMachine:change(MoveState)
 end
 if Input.right then
    player.vx = player.speed
    player.stateMachine:change(MoveState)
 end
end

return IdleState
