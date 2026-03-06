local input = player.components.Input
IdleState = {}
IdleState.__index = IdleState


function IdleState:enter(player)
   print("entered idle")
   player.vx = 0
end




function IdleState:update(player,dt)
 if input.left then
    player.vx = -player.speed
    player.stateMachine:change(MoveState)
    print("moving left!")
 end
 if input.right then
    player.vx = player.speed
    player.stateMachine:change(MoveState)
   print("moving right!")
 end
end

return IdleState
