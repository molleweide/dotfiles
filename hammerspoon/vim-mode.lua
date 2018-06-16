local vimMode = hs.hotkey.modal.new(nil, nil, 'in vim mode')
local enterVimMode = hs.hotkey.modal.new({'shift'}, 'J', 'possibly entering')

local commandState

local function resetCommandState()
  commandState = {
    selection = false,
    visualMode = false,
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

local function runOperator()
  if commandState.operatorFn then
    commandState.operatorFn()
    resetCommandState()
  end
end

local function motion(fn)
  local definition = fn()

  return function()
    definition.fn()
    commandState.motionDirection = definition.direction

    if definition.complete then
      runOperator()

      if not commandState.visualMode then resetCommandState() end
    end
  end
end

local function createMotion(modifiers, key)
  hs.eventtap.keyStroke(motionModifiers(modifiers), key, 0)
end

local function toggleVisualMode()
  commandState.visualMode = true
  commandState.selection = not commandState.selection
end

local function operator(fn)
  local definition = fn()

  return function()
    commandState.selection = definition.selection or false
    commandState.operatorFn = definition.fn

    if commandState.visualMode then runOperator() end
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

local function compose(...)
  local fns = {...}

  return function()
    for _, fn in ipairs(fns) do
      fn()
    end
  end
end

local function exitVimMode()
  vimMode:exit()
end

local backWordMotion = bindMotion('left', {'alt'}, true, 'back')
local wordMotion = bindMotion('right', {'alt'})
local beginningOfLineMotion = bindMotion('left', {'command'})
local endOfLineMotion = bindMotion('right', {'command'})
local endOfTextMotion = bindMotion('down', {'command'})

local leftMotion = bindMotion('left')
local rightMotion = bindMotion('right')
local upMotion = bindMotion('up')
local downMotion = bindMotion('down')

local function inNormalMode(fn)
  return function()
    if not commandState.visualMode then fn() end
  end
end

local deleteUnderCursor = compose(deleteOperator, inNormalMode(rightMotion))
local searchAhead = function() sendKeys({'command'}, 'f') end

local newLineBelow = function()
  sendKeys({'command'}, 'right')
  exitVimMode()
  sendKeys({}, 'Return')
end

local newLineAbove = function()
  sendKeys({'command'}, 'left')
  exitVimMode()
  sendKeys({}, 'Return')
  sendKeys({}, 'up')
end

-- operators
vimMode:bind({}, 'c', changeOperator)
vimMode:bind({}, 'd', deleteOperator)
vimMode:bind({}, 'p', pasteOperator)
vimMode:bind({}, 'u', undoOperator)
vimMode:bind({}, 'v', toggleVisualMode)
vimMode:bind({}, 'y', yankOperator)

-- shortcuts
vimMode:bind({'shift'}, 'a', compose(endOfLineMotion, exitVimMode))
vimMode:bind({'shift'}, 'c', compose(changeOperator, endOfLineMotion))
vimMode:bind({'shift'}, 'i', compose(beginningOfLineMotion, exitVimMode))
vimMode:bind({'shift'}, 'd', compose(deleteOperator, endOfLineMotion))
vimMode:bind({}, 's', compose(deleteUnderCursor, exitVimMode))
vimMode:bind({}, 'x', deleteUnderCursor)
vimMode:bind({}, 'o', newLineBelow)
vimMode:bind({'shift'}, 'o', newLineAbove)

-- motions
vimMode:bind({}, 'b', backWordMotion, nil, backWordMotion)
vimMode:bind({}, 'w', wordMotion, nil, wordMotion)
vimMode:bind({}, 'h', leftMotion, nil, leftMotion)
vimMode:bind({}, 'j', downMotion, nil, downMotion)
vimMode:bind({}, 'k', upMotion, nil, upMotion)
vimMode:bind({}, 'l', rightMotion, nil, rightMotion)
vimMode:bind({}, '0', beginningOfLineMotion, nil, beginningOfLineMotion)
vimMode:bind({'shift'}, '4', endOfLineMotion, nil, endOfLineMotion)
vimMode:bind({'shift'}, 'l', endOfLineMotion, nil, endOfLineMotion)
vimMode:bind({'shift'}, 'g', endOfTextMotion, nil, endOfTextMotion)

-- commands
vimMode:bind({}, '/', searchAhead)

-- exiting
vimMode:bind({}, 'i', exitVimMode)

local function disableVimMode(applicationName)
  hs.window.filter.new(applicationName)
    :subscribe(hs.window.filter.windowFocused, function()
      vimMode:exit()
      enterVimMode:disable()
    end)
    :subscribe(hs.window.filter.windowUnfocused, function()
      enterVimMode:enable()
    end)
end

disableVimMode('iTerm2')
