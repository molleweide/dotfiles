local function rgba(r, g, b, a)
  a = a or 1.0

  return {
    red = r / 255,
    green = g / 255,
    blue = b / 255,
    alpha = a
  }
end

-- see http://colorsafe.co for combos
local layers = {
  default = {
    name = "qwerty",
    background = rgba(187, 187, 187),
    foreground = rgba(46, 52, 59),
  },
  raise = {
    name = "raise",
    background = rgba(163, 209, 255),
    foreground = rgba(15, 72, 128),
  }
}

-------------------------

local LayerIndicator = {}

local defaultWidth = 75
local defaultHeight = 16
local elementIndexBox = 1
local elementIndexText = 2

function LayerIndicator:new(defaultLayer)
  local indicator = {
    layer = defaultLayer
  }

  setmetatable(indicator, self)
  self.__index = self

  indicator.canvas = hs.canvas.new{
    w = defaultWidth,
    h = defaultHeight,
    x = 0,
    y = 0,
  }

  indicator.canvas:insertElement(
    {
      type = 'rectangle',
      action = 'fill',
      roundedRectRadii = { xRadius = 4, yRadius = 4 },
      fillColor = rgba(0, 0, 0),
      frame = { x = "0%", y = "0%", h = "100%", w = "100%", },
    },
    elementIndexBox
  )

  indicator.canvas:insertElement(
    {
      type = 'text',
      action = 'fill',
      frame = {
        x = "10%", y = "0%", h = "100%", w = "95%"
      },
      text = ""
    },
    elementIndexText
  )

  indicator:render()
  indicator:show()

  return indicator
end

function LayerIndicator:render()
  local canvas = self.canvas

  -- set the text
  canvas:elementAttribute(
    elementIndexText,
    'text',
    hs.styledtext.new(
      self.layer.name,
      {
        font = { name = "Helvetica Bold", size = 11 },
        color = self.layer.foreground,
        kerning = 0.5
      }
    )
  )

  -- box color
  canvas:elementAttribute(elementIndexBox, 'fillColor', self.layer.background)

  -- position
  local frame = self:getFrame()
  local width = frame.w
  local x = (width / 2) - (defaultWidth / 2)

  canvas:topLeft({
    x = x,
    y = 3
  })
end

function LayerIndicator:show()
  self.canvas:show()

  -- show it above the Menu Bar
  self.canvas:level("overlay")
end

function LayerIndicator:getFrame()
  return hs.screen.mainScreen():frame()
end

function LayerIndicator:setLayer(layer)
  self.layer = layer
  self:render()
end

--------------- bindings

local layerIndicator = LayerIndicator:new(layers.default)

hs.hotkey.bind({}, 'f17', function()
  layerIndicator:setLayer(layers.raise)
end)

hs.hotkey.bind({}, 'f18', function()
  layerIndicator:setLayer(layers.default)
end)

--------------- watcher

-- fix alt tabbing from games not rendering correctly
local watcher = hs.application.watcher.new(function(applicationName, eventType)
  if eventType == hs.application.watcher.activated then
    hs.timer.doAfter(10 / 1000, function()
      layerIndicator:render()
    end)
  end
end)

watcher:start()
