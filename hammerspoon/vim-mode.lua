local vimMode = hs.hotkey.modal.new(nil, nil, 'in vim mode')
local enterVimMode = hs.hotkey.modal.new({'shift'}, 'J', 'possibly entering')

local commandState

local function resetCommandState()
  commandState = {
    selection = false,
    operatorFn = nil,
    motionDirection = 'forward'
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
  resetCommandState()
  dimScreen()
  enterVimMode:exit()
end

vimMode.exited = function(self)
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

local function sendKeys(modifiers, key)
  hs.eventtap.keyStroke(modifiers or {}, key, 0)
end

local function motionModifiers(modifiers)
  local newModifiers = deepcopy(modifiers or {})

  if commandState.selection then
    table.insert(newModifiers, #newModifiers + 1, 'shift')
  end

  return newModifiers
end

local function focusedElement()
  local element = hs.uielement.focusedElement()
  hs.printf("current object %s", element:selectedText())
end

local function motion(fn)
  local definition = fn()

  return function()
    definition.fn()
    commandState.motionDirection = definition.direction

    if definition.complete then
      if commandState.operatorFn then commandState.operatorFn() end
      resetCommandState()
    end
  end
end

local function createMotion(modifiers, key)
  hs.eventtap.keyStroke(motionModifiers(modifiers), key, 0)
end

local function toggleVisualMode()
  commandState.selection = not commandState.selection
end

local function operator(fn)
  local definition = fn()

  return function()
    commandState.selection = definition.selection or false
    commandState.operatorFn = definition.fn
  end
end

local deleteOperator = operator(function()
  return {
    selection = true,
    fn = function() sendKeys({}, 'delete') end
  }
end)

local function restoreCursor()
  if commandState.motionDirection == 'forward' then
    sendKeys({}, 'left')
  else
    sendKeys({}, 'right')
  end
end

local yankOperator = operator(function()
  return {
    selection = true,
    fn = function()
      sendKeys({'cmd'}, 'c')
      restoreCursor()
    end
  }
end)

local pasteOperator = operator(function()
  return {
    selection = false,
    fn = function()
      hs.printf("pasting")
      sendKeys({'cmd'}, 'v')
    end
  }
end)

local undoOperator = operator(function()
  return {
    selection = false,
    fn = function()
      hs.printf("undo")
      sendKeys({'cmd'}, 'z')
      restoreCursor()
    end
  }
end)

local changeOperator = operator(function()
  return {
    selection = true,
    fn = function()
      sendKeys({}, 'delete')
      vimMode:exit()
    end
  }
end)

local function bindMotion(key, modifiers, complete, direction)
  if complete == nil then complete = true end
  modifiers = modifiers or {}
  direction = direction or 'forward'

  return motion(function()
    return {
      complete = complete,
      direction = direction,
      fn = function()
        createMotion(modifiers, key)
      end
    }
  end)
end

local backWordMotion = bindMotion('left', {'alt'}, true, 'back')
local wordMotion = bindMotion('right', {'alt'})
local beginningOfLineMotion = bindMotion('left', {'command'})
local endOfLineMotion = bindMotion('right', {'command'})

-- operators
vimMode:bind({}, 'c', changeOperator, nil, nil)
vimMode:bind({}, 'd', deleteOperator, nil, nil)
vimMode:bind({}, 'p', pasteOperator, nil, nil)
vimMode:bind({}, 'u', undoOperator, nil, nil)
vimMode:bind({}, 'v', toggleVisualMode, nil, nil)
vimMode:bind({}, 'y', yankOperator, nil, nil)

-- motions
-- vimMode:bind({}, 'f', focusedElement, nil, nil)
vimMode:bind({}, 'b', backWordMotion, nil, backWordMotion)
vimMode:bind({}, 'w', wordMotion, nil, wordMotion)
vimMode:bind({}, 'h', bindMotion('left'), nil, bindMotion('left'))
vimMode:bind({}, 'j', bindMotion('down'), nil, bindMotion('down'))
vimMode:bind({}, 'k', bindMotion('up'), nil, bindMotion('up'))
vimMode:bind({}, 'l', bindMotion('right'), nil, bindMotion('right'))
vimMode:bind({}, '0', beginningOfLineMotion, nil, beginningOfLineMotion)
vimMode:bind({'shift'}, '4', endOfLineMotion, nil, endOfLineMotion)

vimMode:bind({}, 'i', function()
  vimMode:exit()
end)
