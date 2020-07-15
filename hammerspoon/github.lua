local function fixUTF8(s, replacement)
  local p, len, invalid = 1, #s, {}

  while p <= len do
    if     p == s:find("[%z\1-\127]", p) then p = p + 1
    elseif p == s:find("[\194-\223][\128-\191]", p) then p = p + 2
    elseif p == s:find(       "\224[\160-\191][\128-\191]", p)
        or p == s:find("[\225-\236][\128-\191][\128-\191]", p)
        or p == s:find(       "\237[\128-\159][\128-\191]", p)
        or p == s:find("[\238-\239][\128-\191][\128-\191]", p) then p = p + 3
    elseif p == s:find(       "\240[\144-\191][\128-\191][\128-\191]", p)
        or p == s:find("[\241-\243][\128-\191][\128-\191][\128-\191]", p)
        or p == s:find(       "\244[\128-\143][\128-\191][\128-\191]", p) then p = p + 4
    else
      s = s:sub(1, p-1)..replacement..s:sub(p+1)
      table.insert(invalid, p)
    end
  end

  return s, invalid
end

local function getRichLinkToCurrentChromeTab()
  local application = hs.application.frontmostApplication()

  -- only check chrome
  if application:bundleID() ~= "com.google.Chrome" then
    return
  end

  local window = application:focusedWindow()
  local title = string.gsub(window:title(), "- - Google Chrome.*", "")
  title = fixUTF8(title, "")

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
