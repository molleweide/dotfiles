utils = require "vim-mode/utils"
vimSequenceTap = nil

local bindKeySequence = function(key1, key2, modifiers)
  modifiers = modifiers or {}

  local vim = require "vim-mode/vim"
  local waitingForPress = false
  local maxDelay = 200

  vim.afterExit = function()
    vimSequenceTap:start()
  end

  vimSequenceTap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
    if not vim.enabled or vim.entered then
      return false
    end

    local hasModifiers = event:getFlags():containExactly(modifiers)
    local keyPressed = hs.keycodes.map[event:getKeyCode()]

    hs.alert.show(keyPressed)

    if hasModifiers and keyPressed == key1 then
      hs.alert.show('waiting')
      waitingForPress = true

      hs.timer.doAfter(maxDelay / 1000, function()
        if not waitingForPress then return end
        waitingForPress = false

        hs.alert.show('canceling')
        vimSequenceTap:stop()

        utils.sendKeys(modifiers, key1)

        vimSequenceTap:start()
      end)

      return true
    end

    if waitingForPress then
      waitingForPress = false

      if hasModifiers and keyPressed == key2 then
        hs.alert.show('entering vim')
        vimSequenceTap:stop()
        vim.enter()

        return true
      else
        -- Pass thru the first key as well as the second one if we aren't
        -- typing the sequence.
        utils.sendKeys(modifiers, key1)
        return false
      end
    end

    return false
  end)

  vimSequenceTap:start()
end

return bindKeySequence
