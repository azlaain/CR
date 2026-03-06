IdleState = {}
IdleState.__index = IdleState


function IdleState:enter(player)
   print("entered idle")
   player.vx = 0
end




function IdleState:update(player,dt)
   local input = player.components.Input
 if input.left then
    player.vx = -player.speed
    player.components.StateMachine:change(MoveState)
    print("moving left!")
 end
 if input.right then
    player.vx = player.speed
    player.components.StateMachine:change(MoveState)
   print("moving right!")
 end
end

return IdleState
