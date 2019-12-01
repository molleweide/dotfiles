local function focusSlackMessageBox()
  hs.eventtap.keyStroke({'shift'}, 'F6', 500)
end

local function jumpToSlackThread()
  -- select the message window
  focusSlackMessageBox()

  -- tab backwards to the thread button
  hs.eventtap.keyStroke({'shift'}, 'tab', 500)
  hs.eventtap.keyStroke({'shift'}, 'tab', 500)
  hs.eventtap.keyStroke({'shift'}, 'tab', 500)
  hs.eventtap.keyStroke({'shift'}, 'tab', 500)

  -- click it
  hs.eventtap.keyStroke({}, 'return')
end

local function openSlackReminder()
  hs.application.launchOrFocus("Slack")

  hs.timer.doAfter(0.3, function()
    focusSlackMessageBox()

    hs.timer.doAfter(0.3, function()
      hs.eventtap.keyStrokes("/remind me at ")
    end)
  end)
end

hs.hotkey.bind(hyper, 'r', openSlackReminder)
hs.hotkey.bind(hyper, 'f', focusSlackMessageBox)
hs.hotkey.bind(hyper, 't', jumpToSlackThread)
