local StateMachine = {}
StateMachine.__index = StateMachine

function StateMachine:new(owner)
  local obj = setmetatable({}, self)
  obj.owner = owner
  obj.current = nil
  return obj
end


function StateMachine:change(state)
  self.current = state
  if self.current.enter then
    self.current:enter(self.owner)
  end
  if self.current.exit then
    self.current:exit(self.owner)
  end
end

function StateMachine:update(dt)
  if self.current and self.current.update then
    self.current:update(self.owner, dt)
  end
end

return StateMachine
