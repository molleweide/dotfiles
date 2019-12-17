hs.loadSpoon("SpoonInstall")

inspect = hs.inspect.inspect

local VimMode = hs.loadSpoon("VimMode")

require "common"
require "config-watch"
require "window-management"
require "key-bindings"
require "mute-on-sleep"
require "audio-switcher"
require "favorites"
require "quick-switch"
require "slack"
require "pairing-mode"
require "experimental"
require "contextual-modal"

vim = VimMode:new()

-- Configure apps you do *not* want Vim mode enabled in
-- For example, you don't want this plugin overriding your control of Terminal
-- vim
vim
  :disableForApp('Visual Studio Code')
  :disableForApp('Code')
  :disableForApp('zoom.us')
  :disableForApp('iTerm')
  :disableForApp('iTerm2')
  :disableForApp('Terminal')

-- If you want the screen to dim (a la Flux) when you enter normal mode
-- flip this to true.
vim:shouldDimScreenInNormalMode(false)

-- If you want to show an on-screen alert when you enter normal mode, set
-- this to true
vim:shouldShowAlertInNormalMode(true)

vim:setAlertFont("InconsolataGo Bold Nerd Font Complete")

-- Enter normal mode by typing a key sequence
vim:enterWithSequence('jk')
-- if you want to bind a single key to entering vim, remove the
-- :enterWithSequence('jk') line above and uncomment the bindHotKeys line
-- below:
--
-- To customize the hot key you want, see the mods and key parameters at:
--   https://www.hammerspoon.org/docs/hs.hotkey.html#bind
--
-- vim:bindHotKeys({ enter = { {'ctrl'}, ';' } })
--------------------------------
-- END VIM CONFIG
--------------------------------
