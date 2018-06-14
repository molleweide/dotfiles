local vimMode = hs.hotkey.modal.new(nil, nil, 'in vim mode')
local enterVimMode = hs.hotkey.modal.new({'shift'}, 'J', 'possibly entering')

function enterVimMode:entered()
  hs.timer.doAfter(100 / 1000, function()
    enterVimMode:exit()
  end)
end

enterVimMode:bind({'shift'}, 'K', function() vimMode:enter() end)

function vimMode:entered()
  hs.alert.show("vim mode")
  enterVimMode:exit()
end

function vimMode:exited()
  hs.notify.new({title="Hammerspoon", informativeText="Exiting vim mode"}):send()
end

local function keyCode(key, modifiers)
  modifiers = modifiers or {}
  return function() hs.eventtap.keyStroke(modifiers, key) end
end


vimMode:bind({}, '0', keyCode('left', {'command'}), nil, keyCode('left', {'command'}))
vimMode:bind({'shift'}, '4', keyCode('right', {'command'}), nil, keyCode('right', {'command'}))
vimMode:bind({}, 'b', keyCode('left', {'alt'}), nil, keyCode('left', {'alt'}))
vimMode:bind({}, 'w', keyCode('right', {'alt'}), nil, keyCode('right', {'alt'}))

vimMode:bind({}, 'i', function()
  vimMode:exit()
end)
