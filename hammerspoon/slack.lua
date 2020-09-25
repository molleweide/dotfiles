local function focusSlackMessageBox()
  hs.eventtap.keyStroke({'shift'}, 'F6', 500)
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

hs.hotkey.bind(hyper, 'f', focusSlackMessageBox)
hs.hotkey.bind(hyper, 'r', openSlackReminder)

local logger = hs.logger.new('whatever', 'debug')

-- Fix the god damn cmd + k switcher
local focusWatcher = nil

hs.eventtap.new(
  { hs.eventtap.event.types.keyDown },
  function(event)
    local keyPressed = hs.keycodes.map[event:getKeyCode()]
    local matchesKey = keyPressed == "k" or keyPressed == "t"

    if matchesKey and event:getFlags():containExactly({'cmd'}) then
      local app = hs.application.frontmostApplication()

      if app:name() == "Slack" then
        focusWatcher = app:newWatcher(function(_, event)
          if event == hs.uielement.watcher.focusedElementChanged then
            -- fire a down arrow to highlight the first item after
            -- the box pops up.
            hs.eventtap.keyStroke({}, 'down', 0)
            focusWatcher:stop()
          end
        end):start({ hs.uielement.watcher.focusedElementChanged })
      end
    end

    -- pass through key strokes
    return false
  end
):start()
