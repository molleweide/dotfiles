local function getRichLinkToCurrentChromeTab()
  local application = hs.application.frontmostApplication()

  -- only check chrome
  if application:bundleID() ~= "com.google.Chrome" then
    return
  end

  local window = application:focusedWindow()
  local title = string.gsub(window:title(), "- - Google Chrome.*", "")

  local script = [[
    tell application "Google Chrome"
      get URL of active tab of first window
    end tell
  ]]

  local _, url = hs.osascript.applescript(script)
  local html = "<a href=\"" .. url .. "\">" .. title .. "</a>"
  local styledText = hs.styledtext.getStyledTextFromData(html, "html")

  hs.pasteboard.writeObjects(styledText)

  hs.alert("Copied link to " .. title)
end

hs.hotkey.bind(hyper, 'g', getRichLinkToCurrentChromeTab)
