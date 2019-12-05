local favorites = {
  {
    text = "Screenshots",
    subText = "~/Dropbox/Screenshots"
  },
  {
    text = "Downloads",
    subText = "~/Downloads"
  }
}

local function handleFavorites(choice)
  if not choice then
    return
  end

  hs.execute("open " .. choice["subText"])
end

local favoritesChooser = hs.chooser.new(handleFavorites)
favoritesChooser:choices(favorites)
favoritesChooser:width(20)

hs.hotkey.bind(super, 'k', function()
  favoritesChooser:show()
end)
