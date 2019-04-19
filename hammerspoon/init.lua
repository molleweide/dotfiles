hs.loadSpoon("SpoonInstall")

require "config-watch"
require "window-management"
require "key-bindings"
require "mute-on-sleep"
require "audio-switcher"

vim = hs.loadSpoon('VimMode')

vim:disableForApp('zoom.us')
vim:disableForApp('iTerm')
vim:disableForApp('iTerm2')

vim:enableKeySequence('j', 'k')

Install = spoon.SpoonInstall
