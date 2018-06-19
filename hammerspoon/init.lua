require "config-watch"
require "window-management"
require "key-bindings"

VimMode = require "vim-mode"
vim = VimMode.new()
-- vim.bindKeySequence('j', 'k', {'shift'})
-- vim.disableForApp('iTerm2')

vim:bindHotKeys()

hs.hotkey.bind({'ctrl'}, ';', nil, function() vim:enter() end)
