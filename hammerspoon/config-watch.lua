-- -----------------------------------------------------------------------
--                            ** For Debug **                           --
-- -----------------------------------------------------------------------

function reloadConfig()
  hs.reload()
  hs.alert.show('Config reloaded')
end

function watchConfig(files)
  local doReload = false

  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end

  if doReload then
    reloadConfig()
  end
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

-- Sometimes auto-reload is not working
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "n", reloadConfig)
