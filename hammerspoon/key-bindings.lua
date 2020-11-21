local wm = require('window-management')
local hk = require "hs.hotkey"

-- lock screen shortcut
hs.hotkey.bind(super, 'L', function()
  hs.caffeinate.startScreensaver()
end)

-- Spotify next/prev/play/pause
hs.hotkey.bind(hyper, 'space', hs.spotify.playpause)

hyperSwitcher:bind('←', 'left'):toFunction("Previous song", hs.spotify.previous)
hyperSwitcher:bind('→', 'right'):toFunction("Next song", hs.spotify.next)
hyperSwitcher:bind('_', 'space'):toFunction("Play/pause", hs.spotify.playpause)

-- reload Hammerspoon
hyperSwitcher:bind('h'):toFunction('Reload Hammerspoon', function()
  hs.application.launchOrFocus("Hammerspoon")
  hs.reload()
end)

local function popoutChromeTab()
  hs.application.launchOrFocus('/Applications/Google Chrome.app')

  local chrome = hs.appfinder.appFromName("Google Chrome")
  local moveTab = {'Tab', 'Move Tab to New Window'}

  chrome:selectMenuItem(moveTab)
end

-- popout the current chrome tab and view 50-50 side by side
hs.hotkey.bind(super, ']', function()
  -- Move current window to the left half
  wm.leftHalf()

  hs.timer.doAfter(100 / 1000, function()
    -- Pop out the current tab and move it to the right
    popoutChromeTab()
    wm.rightHalf()
  end)
end)
