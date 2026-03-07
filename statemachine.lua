local StateMachine = {}
StateMachine.__index = StateMachine

function StateMachine:new(owner)
  local self = setmetatable({}, self)
  self.owner = owner
  self.current = nil
  return self
end


function StateMachine:change(newState)


  if self.current and self.current.exit then
    self.current:exit(self.owner)
  end

self.current = newState


  if self.current and self.current.enter then
    self.current:enter(self.owner)
  end

  print(self.current)
end

function StateMachine:update(dt)
  if self.current and self.current.update then
    self.current:update(self.owner, dt)
  end
end

return StateMachine
