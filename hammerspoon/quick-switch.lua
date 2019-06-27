-- Quick app switch bindings
quickSwitchBindings = {
  {hyper, 'c', '/Applications/Google Chrome.app'},
  {hyper, 'i', '/Applications/iTerm.app'},
  {hyper, 'l', '/Applications/Slack.app'},
  {hyper, 'm', '/Applications/Messages.app'},
  {hyper, 's', '/Applications/Spotify.app'},
}

for i, mapping in ipairs(quickSwitchBindings) do
  hs.hotkey.bind(mapping[1], mapping[2], function()
    hs.application.launchOrFocus(mapping[3])
  end)
end
