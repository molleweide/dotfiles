local suppressKeysOtherThenOurs = require('suppress-non-modal-keys')

local vimMode = hs.hotkey.modal.new(nil, nil, 'in vim mode')
local enterVimMode = hs.hotkey.modal.new({'shift'}, 'J', 'possibly entering')

local commandState

local function resetCommandState()
  commandState = {
    operation = nil
  }
end

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

vimMode.entered = function(self)
  -- vimMode._keySuppress = suppressKeysOtherThenOurs(self):start()
  resetCommandState()
  dimScreen()
  enterVimMode:exit()
end

vimMode.exited = function(self)
  -- vimMode._keySuppress:stop()
  -- vimMode._keySuppress = nil

  hs.screen.restoreGamma()
end

function deepcopy(orig)
  local orig_type = type(orig)
  local copy

  if orig_type == 'table' then
    copy = {}
    for orig_key, orig_value in next, orig, nil do
      copy[deepcopy(orig_key)] = deepcopy(orig_value)
    end
    setmetatable(copy, deepcopy(getmetatable(orig)))
  else -- number, string, boolean, etc
    copy = orig
  end

  return copy
end

local function motionModifiers(modifiers)
  local newModifiers = deepcopy(modifiers or {})
  local selection = commandState.operation == "delete"

  if selection then
    table.insert(newModifiers, #newModifiers + 1, 'shift')
  end

  return newModifiers
end

local function operation(name)
  return function()
    commandState.operation = name
  end
end

local function afterMotion()
  if commandState.operation == 'delete' then
    hs.eventtap.keyStroke({}, 'delete', 0)
  end
end

local function motion(key, modifiers)
  modifiers = modifiers or {}

  return function()
    hs.eventtap.keyStroke(motionModifiers(modifiers), key, 0)

    afterMotion()
    resetCommandState()
  end
end

vimMode:bind({}, 'd', operation('delete'), nil, nil)
vimMode:bind({}, 'h', motion('left'), nil, motion('left'))
vimMode:bind({}, 'j', motion('down'), nil, motion('down'))
vimMode:bind({}, 'k', motion('up'), nil, motion('up'))
vimMode:bind({}, 'l', motion('right'), nil, motion('right'))

vimMode:bind({}, '0', motion('left', {'command'}), nil, motion('left', {'command'}))
vimMode:bind({'shift'}, '4', motion('right', {'command'}), nil, motion('right', {'command'}))
vimMode:bind({}, 'b', motion('left', {'alt'}), nil, motion('left', {'alt'}))
vimMode:bind({}, 'w', motion('right', {'alt'}), nil, motion('right', {'alt'}))

vimMode:bind({}, 'i', function()
  vimMode:exit()
end)
