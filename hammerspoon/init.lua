require "config-watch"
require "window-management"
require "key-bindings"

VimMode = require "vim-mode"
vim = VimMode.new()

vim:disableForApp('iTerm2')
vim:bindHotKeys()
vim:enableKeySequence('j', 'k')
