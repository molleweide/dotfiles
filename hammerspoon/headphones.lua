-- Sony WH-1000XM3
local headphoneDeviceId = "ac-88-fd-ee-5b-37"

local function run(cmd)
  hs.osascript.applescript(string.format('do shell script "%s"', cmd))
end

local function disconnectHeadphones()
  local cmd = "/usr/local/bin/blueutil --disconnect " .. headphoneDeviceId

  run(cmd)
  hs.alert("Disconnected headphones")
end

local function connectHeadphones()
  hs.timer.doAfter(0, function()
    local cmd = "/usr/local/bin/blueutil --connect " .. headphoneDeviceId

    run(cmd)
    hs.alert("Connected headphones")
  end)
end

local function handleCaffeinateEvent(eventType)
  if eventType == hs.caffeinate.watcher.screensDidLock then
    disconnectHeadphones()
  elseif eventType == hs.caffeinate.watcher.screensDidUnlock then
    connectHeadphones()
  end
end

-- this is blocking the UI

-- local watcher = hs.caffeinate.watcher.new(handleCaffeinateEvent)
-- watcher:start()

-- hs.hotkey.bind(hyper, 'w', connectHeadphones)
