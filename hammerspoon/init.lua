hs.loadSpoon("SpoonInstall")

require "config-watch"
require "window-management"
require "key-bindings"

vim = hs.loadSpoon('VimMode')

vim:disableForApp('iTerm2')
vim:enableKeySequence('j', 'k')
