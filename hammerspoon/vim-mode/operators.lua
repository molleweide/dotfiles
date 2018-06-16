local utils = require('./vim-mode/utils')
local vim = require('./vim-mode/vim')

local function operator(fn)
  local definition = fn()

  return function()
    vim.commandState.selection = definition.selection or false
    vim.commandState.operatorFn = definition.fn

    if vim.commandState.visualMode then vim.runOperator() end
  end
end

local function restoreCursor()
  if vim.commandState.motionDirection == 'forward' then
    utils.sendKeys({}, 'left')
  else
    utils.sendKeys({}, 'right')
  end
end

-- Operators
local operators = {}

operators.delete = operator(function()
  return {
    selection = true,
    fn = function() utils.sendKeys({}, 'delete') end
  }
end)

operators.yank = operator(function()
  return {
    selection = true,
    fn = function()
      utils.sendKeys({'cmd'}, 'c')
      restoreCursor()
    end
  }
end)

operators.paste = operator(function()
  return {
    selection = false,
    fn = function()
      hs.printf("pasting")
      utils.sendKeys({'cmd'}, 'v')
    end
  }
end)

operators.undo = operator(function()
  return {
    selection = false,
    fn = function()
      hs.printf("undo")
      utils.sendKeys({'cmd'}, 'z')
      restoreCursor()
    end
  }
end)

operators.change = operator(function()
  return {
    selection = true,
    fn = function()
      utils.sendKeys({}, 'delete')
      vim.exit()
    end
  }
end)

return operators
