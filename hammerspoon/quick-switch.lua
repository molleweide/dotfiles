-- Quick app switch bindings
quickSwitchBindings = {
  {hyper, '1', '/Applications/1Password 7.app'},
  {hyper, 'a', '/Applications/Slack.app'},
  {hyper, 'c', '/Applications/Google Chrome.app'},
  {hyper, 'i', '/Applications/Signal.app'},
  {hyper, 'm', '/Applications/Messages.app'},
  {hyper, 's', '/Applications/Spotify.app'},
  {hyper, 't', '/Applications/Alacritty.app'}
}

for i, mapping in ipairs(quickSwitchBindings) do
  hs.hotkey.bind(mapping[1], mapping[2], function()
    hs.application.launchOrFocus(mapping[3])
  end)
end
