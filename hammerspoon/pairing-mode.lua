hs.hotkey.bind(hyper, 'p', function()
  -- toggle Do Not Disturb on notification center
  hs.execute("~/.local/bin/dnd-toggle enable")

  -- close embarrassing personal apps
  hs.execute("killall Signal")
  hs.execute("killall Messages")

  hs.alert("Entering pairing mode")
end)
