local logger = hs.logger.new('explore', 'debug')
local ax = require("hs._asm.axuielement")

function getCurrentSelection()
   local elem = hs.uielement.focusedElement()
   local sel = nil

   if elem then
     sel = elem:selectedText()
   end

   -- fallback to copy
   if (not sel) or (sel == "") then
     hs.eventtap.keyStroke({"cmd"}, "c")
     hs.timer.usleep(20000)
     sel = hs.pasteboard.getContents()
   end

   return (sel or "")
end

function getCurrentSelectionFromClipboard(callbackFn)
  local startTimeNs = hs.timer.absoluteTime()
  local initialCount = hs.pasteboard.changeCount()
  local pasteboardTimer
  local timeoutTimer

  -- the clipboard has updated with a new value once the count changes
  local clipboardHasUpdated = function()
    return initialCount ~= hs.pasteboard.changeCount()
  end

  -- wait for the pasteboard to increment its count, indicating that
  -- the async copy to clipboard is done
  local waitTimeSecs = 10 / 1000 -- 10ms

  -- fire copy
  hs.eventtap.keyStroke({"cmd"}, "c")

  pasteboardTimer = hs.timer.waitUntil(
    clipboardHasUpdated,
    function()
      if timeoutTimer and timeoutTimer:running() then timeoutTimer:stop() end

      local endTimeNs = hs.timer.absoluteTime()
      local diffMs = (endTimeNs - startTimeNs) / 1000000

      logger.i("Got contents in millseconds: ", diffMs)

      -- call our callback with the pasteboard contents
      callbackFn(hs.pasteboard.getContents())
    end,
    waitTimeSecs
  )

  -- how long are we willing to wait for the clipboard before
  -- timing out and aborting?
  local maxWaitTimeSecs = 500 / 1000 -- 500ms

  hs.timer.doAfter(maxWaitTimeSecs, function()
    if pasteboardTimer:running() then
      pasteboardTimer:stop()
      callbackFn(nil)
    end
  end)
end

function getForwardContents()
  hs.eventtap.keyStroke({'cmd', 'shift'}, 'down', 0)
  local contents = getCurrentSelection()
  hs.eventtap.keyStroke({}, 'left')

  logger.i(contents)
end

function setFieldValue()
  local systemElement = ax.systemWideElement()
  local currentElement = systemElement:attributeValue("AXFocusedUIElement")

  -- currentElement:setValue("hahhaahaha")

  local value = "from pasteboard"
  hs.pasteboard.setContents(value)

  -- local systemElement = ax.systemWideElement()
  -- local currentElement = systemElement:attributeValue("AXFocusedUIElement")

  -- local length = currentElement:numberOfCharacters()
  -- currentElement:setSelectedTextRange({ location = 0, length = length })
  -- currentElement:setSelectedText("from pasteboard")
end

-- hs.hotkey.bind(hyper, 'r', setFieldValue)

function getCursorPositionManually()
  local startTime = hs.timer.absoluteTime()
  local systemElement = ax.systemWideElement()
  local currentElement = systemElement:attributeValue("AXFocusedUIElement")

  local startValue = currentElement:attributeValue('AXValue')
  hs.eventtap.keyStroke({}, 'delete', 0)

  local deletedValue = nil

  local predicate = function()
    deletedValue = currentElement:attributeValue('AXValue')
    return deletedValue ~= startValue
  end

  hs.timer.waitUntil(predicate, function()
    hs.eventtap.keyStroke({'cmd'}, 'z', 0)

    local endTime = hs.timer.absoluteTime()

    local diffNs = endTime - startTime
    local diffMs = diffNs / 1000000

    logger.i('first value:')
    logger.i(inspect(startValue))

    logger.i('second value:')
    logger.i(inspect(deletedValue))

    logger.i("took: " .. diffMs .. "ms")
  end)
end

hs.hotkey.bind(hyper, '2', getCursorPositionManually)

function debugElement(currentElement)
  local role = currentElement:attributeValue("AXRole")

  logger.i("in app: " .. app:name())

  if role == "AXTextField" or role == "AXTextArea" then
    logger.i("Currently in text field")
    logger.i(inspect(currentElement:parameterizedAttributeNames()))
    logger.i("attributes:")
    logger.i(inspect(currentElement:attributeNames()))
    logger.i("action names:")
    logger.i(inspect(currentElement:actionNames()))
    logger.i("dynamic methods:")
    logger.i(inspect(currentElement:dynamicMethods(true)))
    logger.i("range:")
    logger.i(inspect(currentElement:selectedTextRange()))
    logger.i("Position: ", inspect(currentElement:position()))
    logger.i("Selected text: ", inspect(currentElement:selectedText()))

    local lineNum = currentElement:insertionPointLineNumber()
    logger.i("Insertion point line: ", lineNum)
    local lineRange = currentElement:rangeForLineWithParameter(lineNum)
    logger.i("Insertion point content: ", inspect(lineRange))

    local text = currentElement:attributeValue("AXValue")
    local textLength = currentElement:attributeValue("AXNumberOfCharacters")
    local range = currentElement:attributeValue("AXSelectedTextRange")

    local attempt = {
      'subrole',
      'editableAncestor',
      'dOMClassList',
      'dOMIdentifier',
      'description',
      'roleDescription',
    }

    for _, fnName in pairs(attempt) do
      if currentElement[fnName] then
        logger.i(fnName .. " = " .. inspect(currentElement[fnName](currentElement)))
      end
    end

    logger.i("range = " .. inspect(range))
    logger.i("len = " .. textLength)
    logger.i("Text is " .. string.sub(text, 1, 100))

    logger.i(inspect(currentElement:allAttributeValues()))
  else
    logger.i("Role = " .. role)
  end
end

function debugField(currentElement, fieldName)
  local field = currentElement:attributeValue(fieldName)

  if field then
    logger.i("\n=====================================\ndebugging field " .. fieldName .. "\n=================================================")
    debugElement(field)
  end
end

function getSelectedTextRange()
  -- for now force manual accessibility on
  local axApp = ax.applicationElement(hs.application.frontmostApplication())
  axApp:setAttributeValue('AXManualAccessibility', true)
  -- axApp:setAttributeValue('AXEnhancedUserInterface', true)

  local systemElement = ax.systemWideElement()
  local currentElement = systemElement:attributeValue("AXFocusedUIElement")

  debugElement(currentElement)
  debugField(currentElement, 'AXFocusableAncestor')
  debugField(currentElement, 'AXEditableAncestor')
end

function getChromeUrl()
  local script = "tell application \"Google Chrome\"\n" ..
    "  get URL of active tab of first window\n" ..
    "end tell"

  return hs.osascript.applescript(script)
end

function hasCurrentSelection()
  local currentApp = ax.applicationElement(hs.application.frontmostApplication())
  local menuBar = hs.fnutils.find(currentApp:attributeValue("AXChildren"), function(childElement)
    return childElement:attributeValue("AXRole") == "AXMenuBar"
  end)

  local menuItems = menuBar:attributeValue("AXChildren")

  local editMenu = hs.fnutils.find(menuItems, function(menuItem)
    return menuItem:attributeValue("AXTitle") == "Edit"
  end)

  local editItems = editMenu:attributeValue("AXChildren")[1]:attributeValue("AXChildren")

  local copyItem = hs.fnutils.find(editItems, function(editItem)
    return editItem:attributeValue("AXTitle") == "Copy"
  end)

  local isEnabled =  copyItem:attributeValue("AXEnabled")

  return isEnabled
end

function drawBoxAbove(xPos, yPos)
  local width = 125
  local height = 25

  local nudge = 3
  local x = xPos - nudge
  local y = yPos - height - nudge

  local canvas = hs.canvas.new{ w = width, h = height, x = x, y = y }

  canvas:appendElements(
    {
      type = 'rectangle',
      action = 'fill',
      roundedRectRadii = { xRadius = 2, yRadius = 2 },
      fillColor = {
        red = 4 / 255,
        green = 135 / 255,
        blue = 250 / 255,
        alpha = 0.95,
      },
      strokeColor = { white = 1.0 },
      strokeWidth = 3.0,
      frame = { x = "0%", y = "0%", h = "100%", w = "100%", },
      withShadow = true
    },
    {
      type = 'text',
      action = 'fill',
      frame = {
        x = "5%", y = "10%", h = "100%", w = "95%"
      },
      text = hs.styledtext.new(
        "NORMAL",
        {
          font = { name = "Courier New Bold", size = 14 },
          color = { white = 1.0 }
        }
      )
    }
  )

  canvas:show()
end

hs.hotkey.bind(hyper, '0', function()
  local systemElement = ax.systemWideElement()
  local currentElement = systemElement:attributeValue("AXFocusedUIElement")
  local position = currentElement:position()

  drawBoxAbove(position.x, position.y)
end)

hs.hotkey.bind(hyper, '5', function()
  -- logger.i("Selection enabled", hasCurrentSelection())
  getSelectedTextRange()
end)

function printAXNotifications(ae, o)
  processChildren = function(child)
    failureCount = 0
    failures = ""

    for i, notification in pairs(ax.observer.notifications) do
      local status, err = pcall(function() o:addWatcher(child, notification) end)
      if not status then
        failureCount = failureCount + 1
        if i == #ax.observer.notifications then
          failures = failures .. notification
        else
          failures = failures .. notification .. ", "
        end
      end
    end

    if failureCount == 0 then
      print(string.format("All notifications available for: %s", child))
    else
      if failureCount == #ax.observer.notifications then
        print(string.format("ERROR: All notifications unavailable for: %s", child))
      else
        print(string.format("ERROR: Some notifications unavailable for: %s (%s)", child, failures))
      end
    end

    children = child:attributeValue("AXChildren")
    if children and #children > 0 then
      for _, v in pairs(children) do
        processChildren(v)
      end
    end

  end

  rootChildren = ae:attributeValue("AXChildren")
  if #rootChildren > 0 then
    print(string.format("PROCESSING: %s", app))
    print("--------------------------------------")
    for i, v in pairs(rootChildren) do
      processChildren(v)
    end
  else
    print("ERROR: There are no root children in application, so aborting.")
  end
end

-- registering all application focus events

local applicationWatchers = {}

function registerApplicationWatcher(app)
  if not app then return end
  if applicationWatchers[app:pid()] then return end

  logger.i("Registering " .. app:name() .. " with pid " .. app:pid())

  local element = ax.applicationElementForPID(app:pid())
  element:setAttributeValue('AXManualAccessibility', true)

  local observer = ax.observer.new(app:pid())
    :callback(function(...) print(hs.inspect(table.pack(...), { newline = " ", indent = "" })) end)
    :addWatcher(element, "AXFocusedUIElementChanged")

  -- printAXNotifications(element, observer)

  observer:start()

  applicationWatchers[app:pid()] = observer
end

function unregisterApplicationWatcher(app)
  logger.i("Unregistering pid " .. app:pid())

  local observer = applicationWatchers[app:pid()]

  if observer:isRunning() then observer:stop() end
  applicationWatchers[app:pid()] = nil
end

local appWatcher = hs.application.watcher.new(function(applicationName, event, hsApplication)
  if event == hs.application.watcher.terminated then
    unregisterApplicationWatcher(hsApplication)
  elseif event ~= hs.application.watcher.launched then
    registerApplicationWatcher(hsApplication)
  end
end)

-- registerApplicationWatcher(hs.application.frontmostApplication())
-- appWatcher:start()
