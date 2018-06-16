local bindKeySequence = require('vim-mode/bind-key-sequence')

local function buildCommandState()
  return {
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

vim = {
  afterExit = function() end,
  commandState = buildCommandState(),
  entered = false,
  enabled = true,
  mode = hs.hotkey.modal.new()
}

vim.disable = function()
  hs.alert.show('disabling vim')
  vim.enabled = false
end

vim.enable = function()
  hs.alert.show('enabling vim')
  vim.resetState()
  vim.enabled = true
end

vim.disableForApp = function(disabledApp)
  watcher = hs.application.watcher.new(function(applicationName, eventType)
    if disabledApp ~= applicationName then return end

    if eventType == hs.application.watcher.activated then
      vim.exit()
      vim.disable()
    elseif eventType == hs.application.watcher.deactivated then
      vim.enable()
    end
  end)

  watcher:start()
end

vim.enter = function()
  if vim.enabled then
    hs.alert.show('vim.enter() entering')
    vim.mode:enter()
    vim.entered = true
  else
    hs.alert.show('skipping')
  end
end

vim.exit = function()
  vim.mode:exit()
end

vim.resetState = function()
  vim.commandState = buildCommandState()
end

vim.runOperator = function()
  if vim.commandState.operatorFn then
    vim.commandState.operatorFn()
    vim.resetState()
  end
end

vim.bindKeySequence = bindKeySequence

vim.toggleVisualMode = function()
  vim.commandState.visualMode = true
  vim.commandState.selection = not vim.commandState.selection
end

vim.mode.entered = function(self)
  vim.resetState()
  dimScreen()
end

vim.mode.exited = function(self)
  hs.screen.restoreGamma()
  vim.afterExit()
end

return vim
