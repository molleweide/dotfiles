local function enableDoNotDisturb()
  hs.execute("defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -boolean true")
  hs.execute("defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturbDate -date \"`date -u +\"%Y-%m-%d %H:%M:%S +000\"`\"")
  hs.execute("killall NotificationCenter")
end

local function enablePairingMode()
  enableDoNotDisturb()

  -- close embarrassing personal apps
  hs.execute("killall Signal")
  hs.execute("killall Messages")

  hs.alert("Entering pairing mode")
end

hyperSwitcher:bind('p'):toFunction("Enable pairing mode", enablePairingMode)
