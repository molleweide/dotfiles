require "config-watch"
require "window-management"
require "key-bindings"

vim = require "vim-mode"
vim.bindKeySequence('j', 'k', {'shift'})

-- vim.disableForApp('iTerm2')
-- hs.hotkey.bind({'ctrl'}, ';', nil, vim.enter)
