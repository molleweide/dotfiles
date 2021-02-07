local function openRemoteSpotify()
  hs.timer.doAfter(0, function()
    local cmd = "/usr/bin/ssh sorny.local 'open -a Spotify'"

    hs.execute(cmd)
    hs.alert("Opened Spotify on desktop")
  end)
end

hyperKey:bind('6'):toFunction("Open Spotify on desktop", openRemoteSpotify)

