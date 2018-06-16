local extendedModes = require('./vim-mode/extended-modes')
local motions = require('./vim-mode/motions')
local operators = require('./vim-mode/operators')
local utils = require('./vim-mode/utils')
local vim = require('./vim-mode/vim')

------------ exiting
vim.mode:bind({}, 'i', vim.exit)

------------ motions
vim.mode:bind({}, 'b', motions.backWord, nil, motions.backWord)
vim.mode:bind({}, 'w', motions.word, nil, motions.word)
vim.mode:bind({}, 'h', motions.left, nil, motions.left)
vim.mode:bind({}, 'j', motions.down, nil, motions.down)
vim.mode:bind({}, 'k', motions.up, nil, motions.up)
vim.mode:bind({}, 'l', motions.right, nil, motions.right)
vim.mode:bind({}, '0', motions.beginningOfLine, nil, motions.beginningOfLine)
vim.mode:bind({'shift'}, '4', motions.endOfLine, nil, motions.endOfLine)
vim.mode:bind({'shift'}, 'l', motions.endOfLine, nil, motions.endOfLine)
vim.mode:bind({'shift'}, 'g', motions.endOfText, nil, motions.endOfText)

------------ operators
vim.mode:bind({}, 'c', operators.change)
vim.mode:bind({}, 'd', operators.delete)
vim.mode:bind({}, 'p', operators.paste)
vim.mode:bind({}, 'u', operators.undo)
vim.mode:bind({}, 'y', operators.yank)

------------ shortcuts
local function compose(...)
  local fns = {...}

  return function()
    for _, fn in ipairs(fns) do
      fn()
    end
  end
end

local function isNormalMode(fn)
  return function()
    if not vim.commandState.visualMode then fn() end
  end
end

local deleteUnderCursor = compose(operators.delete, isNormalMode(motions.right))
local searchAhead = function() utils.sendKeys({'command'}, 'f') end

local newLineBelow = function()
  utils.sendKeys({'command'}, 'right')
  vim.exit()
  utils.sendKeys({}, 'Return')
end

local newLineAbove = function()
  utils.sendKeys({'command'}, 'left')
  vim.exit()
  utils.sendKeys({}, 'Return')
  utils.sendKeys({}, 'up')
end

vim.mode:bind({'shift'}, 'a', compose(motions.endOfLine, vim.exit))
vim.mode:bind({'shift'}, 'c', compose(operators.change, motions.endOfLine))
vim.mode:bind({'shift'}, 'i', compose(motions.beginningOfLine, vim.exit))
vim.mode:bind({'shift'}, 'd', compose(operators.delete, motions.endOfLine))
vim.mode:bind({}, 's', compose(deleteUnderCursor, vim.exit))
vim.mode:bind({}, 'x', deleteUnderCursor)
vim.mode:bind({}, 'o', newLineBelow)
vim.mode:bind({'shift'}, 'o', newLineAbove)

---------- commands
vim.mode:bind({}, '/', searchAhead)
vim.mode:bind({}, 'v', vim.toggleVisualMode)
vim.mode:bind({}, 'r', extendedModes.replace)

return vim
