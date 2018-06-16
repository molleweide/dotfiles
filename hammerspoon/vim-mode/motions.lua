local utils = require('./vim-mode/utils')

local function motionModifiers(modifiers)
  local newModifiers = utils.deepcopy(modifiers or {})

  if vim.commandState.selection then
    table.insert(newModifiers, #newModifiers + 1, 'shift')
  end

  return newModifiers
end

local function motion(fn)
  local definition = fn()

  return function()
    definition.fn()
    vim.commandState.motionDirection = definition.direction

    if definition.complete then
      vim.runOperator()

      if not vim.commandState.visualMode then vim.resetState() end
    end
  end
end

local function createMotion(modifiers, key)
  hs.eventtap.keyStroke(motionModifiers(modifiers), key, 0)
end

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

local motions = {
  backWord = bindMotion('left', {'alt'}, true, 'back'),
  word = bindMotion('right', {'alt'}),
  beginningOfLine = bindMotion('left', {'command'}),
  endOfLine = bindMotion('right', {'command'}),
  endOfText = bindMotion('down', {'command'}),

  left = bindMotion('left'),
  right = bindMotion('right'),
  up = bindMotion('up'),
  down = bindMotion('down')
}

return motions
