local wm = require('window-management')

-- lock screen shortcut
superKey:bind('s'):toFunction("Lock screen", hs.caffeinate.startScreensaver)

-- Spotify next/prev/play/pause
hyperKey:bind('←', 'left'):toFunction("Previous song", hs.spotify.previous)
hyperKey:bind('→', 'right'):toFunction("Next song", hs.spotify.next)
hyperKey:bind('_', 'space'):toFunction("Play/pause", hs.spotify.playpause)

-- reload Hammerspoon
hyperKey:bind('h'):toFunction('Reload Hammerspoon', function()
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
superKey:bind(']'):toFunction("Chrome tab 50-50", function()
  -- Move current window to the left half
  wm.leftHalf()

  hs.timer.doAfter(100 / 1000, function()
    -- Pop out the current tab and move it to the right
    popoutChromeTab()
    wm.rightHalf()
  end)
end)
