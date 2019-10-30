local wm = require('window-management')
local hk = require "hs.hotkey"

-- * Key Binding Utility
--- Bind hotkey for window management.
-- @function windowBind
-- @param {table} hyper - hyper key set
-- @param { ...{key=value} } keyFuncTable - multiple hotkey and function pairs
--   @key {string} hotkey
--   @value {function} callback function
local function windowBind(hyper, keyFuncTable)
  for key, fn in pairs(keyFuncTable) do
    hk.bind(hyper, key, fn)
  end
end

-- * Set Window Position on screen
windowBind(super, {
  m = wm.maximizeWindow,    -- ⌃⌥⌘ + M
  c = wm.centerOnScreen,    -- ⌃⌥⌘ + C
  left = wm.leftHalf,       -- ⌃⌥⌘ + ←
  right = wm.rightHalf,     -- ⌃⌥⌘ + →
  up = wm.topHalf,          -- ⌃⌥⌘ + ↑
  down = wm.bottomHalf      -- ⌃⌥⌘ + ↓
})

-- lock screen shortcut
hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'L', function()
  hs.caffeinate.startScreensaver()
end)

-- Spotify next/prev/play/pause
hs.hotkey.bind(hyper, 'left', hs.spotify.previous)
hs.hotkey.bind(hyper, 'right', hs.spotify.next)
hs.hotkey.bind(hyper, 'space', hs.spotify.playpause)
