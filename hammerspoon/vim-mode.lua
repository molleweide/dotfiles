local vimMode = hs.hotkey.modal.new(nil, nil, 'in vim mode')
local enterVimMode = hs.hotkey.modal.new({'shift'}, 'J', 'possibly entering')

local function dimScreen()
  hs.screen.primaryScreen():setGamma(
    {alpha=1.0,red=0.0,green=0.0,blue=0.0},
    {blue=0.0,green=1.0,red=0.0}
  )
end

function enterVimMode:entered()
  hs.timer.doAfter(100 / 1000, function()
    enterVimMode:exit()
  end)
end

enterVimMode:bind({'shift'}, 'K', function() vimMode:enter() end)

function vimMode:entered()
  hs.alert.show("vim mode")
  dimScreen()
  enterVimMode:exit()
end

function vimMode:exited()
  hs.notify.new({title="Hammerspoon", informativeText="Exiting vim mode"}):send()
  hs.screen.restoreGamma()
end

local function keyCode(key, modifiers)
  modifiers = modifiers or {}
  return function() hs.eventtap.keyStroke(modifiers, key, 0) end
end

vimMode:bind({}, 'h', keyCode('left'), nil, keyCode('left'))
vimMode:bind({}, 'j', keyCode('down'), nil, keyCode('down'))
vimMode:bind({}, 'k', keyCode('up'), nil, keyCode('up'))
vimMode:bind({}, 'l', keyCode('right'), nil, keyCode('right'))

vimMode:bind({}, '0', keyCode('left', {'command'}), nil, keyCode('left', {'command'}))
vimMode:bind({'shift'}, '4', keyCode('right', {'command'}), nil, keyCode('right', {'command'}))
vimMode:bind({}, 'b', keyCode('left', {'alt'}), nil, keyCode('left', {'alt'}))
vimMode:bind({}, 'w', keyCode('right', {'alt'}), nil, keyCode('right', {'alt'}))

vimMode:bind({}, 'i', function()
  vimMode:exit()
end)
