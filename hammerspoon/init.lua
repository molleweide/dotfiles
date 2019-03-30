hs.loadSpoon("SpoonInstall")

require "config-watch"
require "window-management"
require "key-bindings"

vim = hs.loadSpoon('VimMode')

vim:disableForApp('zoom.us')
vim:disableForApp('iTerm')
vim:disableForApp('iTerm2')

vim:enableKeySequence('j', 'k')
