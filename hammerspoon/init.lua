hs.loadSpoon("SpoonInstall")

inspect = hs.inspect.inspect

local Vim2 = hs.loadSpoon("VimMode")

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

-- bootstrap vim2
vim2 = Vim2:new()

vim2
  :disableForApp('Code')
  :disableForApp('zoom.us')
  :disableForApp('iTerm')
  :disableForApp('iTerm2')
  :disableForApp('Terminal')
  :shouldDimScreenInNormalMode(false)
  :shouldShowAlertInNormalMode(true)
  :setAlertFont("InconsolataGo Bold Nerd Font Complete")
  :enterWithSequence('jk')
