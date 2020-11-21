-----------------------------------------------------------------------------------
-- Yet Another Class Implementation (version 1.2)
--
-- Julien Patte [julien.patte AT gmail DOT com] - 25 Feb 2007
--
-- Inspired from code written by Kevin Baca, Sam Lie, Christian Lindig and others
-- Thanks to Damian Stewart and Frederic Thomas for their interest and comments
-----------------------------------------------------------------------------------

do	-- keep local things inside

-- associations between an object an its meta-informations
-- e.g its class, its "lower" object (if any), ...
local metaObj = {}
setmetatable(metaObj, {__mode = "k"})

-----------------------------------------------------------------------------------
-- internal function 'duplicate'
-- return a shallow copy of table t

local function duplicate(t)
  t2 = {}
  for k,v in pairs(t) do t2[k] = v end
  return t2
end

-----------------------------------------------------------------------------------
-- internal function 'newInstance'

local function newInstance(class, ...)

  local function makeInstance(class, virtuals)
    local inst = duplicate(virtuals)
    metaObj[inst] = { obj = inst, class = class }

    if class:super()~=nil then
      inst.super = makeInstance(class:super(), virtuals)
      metaObj[inst].super = metaObj[inst.super]	-- meta-info about inst
      metaObj[inst.super].lower = metaObj[inst]
    else
      inst.super = {}
    end

    setmetatable(inst, class.static)

    return inst
  end

  local inst = makeInstance(class, metaObj[class].virtuals)
  inst:init(...)
  return inst
end

-----------------------------------------------------------------------------------
-- internal function 'makeVirtual'

local function makeVirtual(class, fname)
  local func = class.static[fname]
  if func == nil then
    func = function() error("Attempt to call an undefined abstract method '"..fname.."'") end
   end
  metaObj[class].virtuals[fname] = func
end

-----------------------------------------------------------------------------------
-- internal function 'trycast'
-- try to cast an instance into an instance of one of its super- or subclasses

local function tryCast(class, inst)
  local meta = metaObj[inst]
  if meta.class==class then return inst end -- is it already the right class?

  while meta~=nil do	-- search lower in the hierarchy
    if meta.class==class then return meta.obj end
    meta = meta.lower
  end

  meta = metaObj[inst].super  -- not found, search through the superclasses
  while meta~=nil do
    if meta.class==class then return meta.obj end
    meta = meta.super
  end

  return nil -- could not execute casting
end

-----------------------------------------------------------------------------------
-- internal function 'secureCast'
-- same as trycast but raise an error in case of failure

local function secureCast(class, inst)
  local casted = tryCast(class, inst)
  if casted == nil then
	error("Failed to cast " .. tostring(inst) .. " to a " .. class:name())
  end
  return casted
end

-----------------------------------------------------------------------------------
-- internal function 'classMade'

local function classMade(class, obj)
  if metaObj[obj]==nil then return false end -- is this really an object?
  return (tryCast(class,obj) ~= nil) -- check if that class could cast the object
end


-----------------------------------------------------------------------------------
-- internal function 'callup'
-- Function used to transfer a method call from a class to its superclass

local callup_inst
local callup_target

local function callup(inst, ...)
  return callup_target(callup_inst, ...)	-- call the superclass' method
end


-----------------------------------------------------------------------------------
-- internal function 'subclass'

local function inst_init_def(inst,...)
  inst.super:init()
end

local function inst_newindex(inst,key,value)
  if inst.super[key] ~= nil then 	-- First check if this field isn't already
									-- defined higher in the hierarchy
	inst.super[key] = value;		-- Update the old value
  else
  	rawset(inst,key,value); 		-- Create the field
  end
end

local function subclass(baseClass, name)
  if type(name)~="string" then name = "Unnamed" end

  local theClass = {}

	-- need to copy everything here because events can't be found through metatables
  local b = baseClass.static
  local inst_stuff = { __tostring=b.__tostring, __eq=b.__eq, __add=b.__add, __sub=b.__sub,
	__mul=b.__mul, __div=b.__div, __mod=b.__mod, __pow=b.__pow, __unm=b.__unm,
	__len=b.__len, __lt=b.__lt, __le=b.__le, __concat=b.__concat, __call=b.__call}

  inst_stuff.init = inst_init_def
  inst_stuff.__newindex = inst_newindex
  function inst_stuff.class() return theClass end

  function inst_stuff.__index(inst, key) -- Look for field 'key' in instance 'inst'
	local res = inst_stuff[key] 		-- Is it present?
	if res~=nil then return res end		-- Okay, return it

	res = inst.super[key]  				-- Is it somewhere higher in the hierarchy?

	if type(res)=='function' and
		res ~= callup then 				-- If it is a method of the superclass,
		callup_inst = inst.super  		-- we will need to do a special forwarding
		callup_target = res  			-- to call 'res' with the correct 'self'
		return callup 					-- The 'callup' function will do that
	end

	return res
  end


  local class_stuff = { static = inst_stuff, made = classMade, new = newInstance,
	subclass = subclass, virtual = makeVirtual, cast = secureCast, trycast = tryCast }
  metaObj[theClass] = { virtuals = duplicate(metaObj[baseClass].virtuals) }

  function class_stuff.name(class) return name end
  function class_stuff.super(class) return baseClass end
  function class_stuff.inherits(class, other)
	return (baseClass==other or baseClass:inherits(other))
  end

  local function newmethod(class, name, meth)
	inst_stuff[name] = meth;
	if metaObj[class].virtuals[name]~=nil then
		metaObj[class].virtuals[name] = meth
	end
  end

  local function tos() return ("class "..name) end
  setmetatable(theClass, { __newindex = newmethod, __index = class_stuff,
	__tostring = tos, __call = newInstance } )

  return theClass
end

-----------------------------------------------------------------------------------
-- The 'Object' class

Object = {}

local function obj_newitem() error "May not modify the class 'Object'. Subclass it instead." end
local obj_inst_stuff = {}
function obj_inst_stuff.init(inst,...) end
obj_inst_stuff.__index = obj_inst_stuff
obj_inst_stuff.__newindex = obj_newitem
function obj_inst_stuff.class() return Object end
function obj_inst_stuff.__tostring(inst) return ("a "..inst:class():name()) end

local obj_class_stuff = { static = obj_inst_stuff, made = classMade, new = newInstance,
	subclass = subclass, cast = secureCast, trycast = tryCast }
function obj_class_stuff.name(class) return "Object" end
function obj_class_stuff.super(class) return nil end
function obj_class_stuff.inherits(class, other) return false end
metaObj[Object] = { virtuals={} }

local function tos() return ("class Object") end
setmetatable(Object, { __newindex = obj_newitem, __index = obj_class_stuff,
	__tostring = tos, __call = newInstance } )

----------------------------------------------------------------------
-- function 'newclass'

function newclass(name, baseClass)
 baseClass = baseClass or Object
 return baseClass:subclass(name)
end

end -- 2 global things remain: 'Object' and 'newclass'

-- end of code



--------------------------------------------------------------------

local function onModifierHold(modifiers, timeoutMs, onHold, onRelease)
  local state = {
    held = false,
    holdTimer = nil,
    onHold = onHold,
    onRelease = onRelease,
  }

  local cancelTimer = function()
    if not state.holdTimer then return end

    state.holdTimer:stop()
    state.holdTimer = nil
  end

  state.tap = hs.eventtap.new(
    {
      hs.eventtap.event.types.flagsChanged,
    },
    function(event)
      local type = event:getType()
      local containsFlags = event:getFlags():containExactly(modifiers)

      if state.held then
        -- waiting for a release
        if not containsFlags then
          state.held = false
          onRelease()
          cancelTimer()
        end
      elseif state.holdTimer then
        -- we are waiting for the timeout timer to fire
        if not containsFlags then
          cancelTimer()
        end
      elseif containsFlags then
        state.holdTimer = hs.timer.doAfter(timeoutMs / 1000, function()
          state.held = true
          onHold()
        end)
      end

      return false
    end
  )

  state.tap:start()

  return state
end

--------------------------

local function rgba(r, g, b, a)
  a = a or 1.0

  return {
    red = r / 255,
    green = g / 255,
    blue = b / 255,
    alpha = a
  }
end

local KeyBinding = newclass("KeyBinding")

function KeyBinding:init(name)
  self.name = name
end

function KeyBinding:launch()
end

local ApplicationBinding = KeyBinding:subclass("ApplicationBinding")

function ApplicationBinding:init(applicationPath)
  local parts = hs.fnutils.split(applicationPath, "/")
  local name = parts[#parts]

  local nameParts = hs.fnutils.split(name, ".", nil, true)
  local basename = nameParts[1]

  self.super:init(basename)
  self.applicationPath = applicationPath
end

function ApplicationBinding:launch()
  hs.application.launchOrFocus(self.applicationPath)
end

local FunctionBinding = KeyBinding:subclass('FunctionBinding')

function FunctionBinding:init(name, fn)
  self.super:init(name)
  self.fn = fn
end

function FunctionBinding:launch()
  self.fn()
end

----------------------------------------------------------------

local HyperSwitcher = newclass("HyperSwitcher")

function HyperSwitcher:init(hyperMods)
  self.hyperMods = hyperMods
  self.bindings = {}
  self.overlay = nil
end

function HyperSwitcher:showOverlay()
  self:_buildOverlay()
  self.overlay:show()
end

function HyperSwitcher:hideOverlay()
  self:_buildOverlay()
  self.overlay:hide()
end

function HyperSwitcher:bind(key)
  return {
    toApplication = function(_, applicationName)
      return self:_bind(key, ApplicationBinding:new(applicationName))
    end,
    toFunction = function(_, name, fn)
      return self:_bind(key, FunctionBinding:new(name, fn))
    end
  }
end

function HyperSwitcher:_buildOverlay()
  if self.overlay then return end

  local layerIndexes = {
    background = 1,
    keyIndex = 2,
  }

  table.sort(self.bindings, function(a, b)
    return a.key < b.key
  end)

  -- how much padding around the edges
  local containerPadding = 25

  local itemsPerColumn = 5
  local itemHeight = 25
  local itemBottomMargin = 10
  local itemContainer = itemHeight + itemBottomMargin

  local columnWidth = 275
  local columnCount = math.ceil(#self.bindings / itemsPerColumn)

  local defaultWidth = (containerPadding * 2) + (columnCount * columnWidth)
  local defaultHeight = (containerPadding * 2) + (itemsPerColumn * itemContainer) - itemBottomMargin

  self.overlay = hs.canvas.new{
    w = defaultWidth,
    h = defaultHeight,
    x = 100,
    y = 100,
  }

  -- show in center
  local frame = hs.screen.mainScreen():frame()

  self.overlay:level("overlay")
  self.overlay:topLeft({
    x = (frame.w / 2) - (defaultWidth / 2),
    y = (frame.h / 2) - (defaultHeight / 2),
  })

  -- render the background rectangle
  self.overlay:insertElement(
    {
      type = 'rectangle',
      action = 'fill',
      roundedRectRadii = { xRadius = 10, yRadius = 10 },
      fillColor = rgba(24, 135, 250, 1),
      strokeColor = { white = 1.0 },
      strokeWidth = 3.0,
      frame = { x = "0%", y = "0%", h = "100%", w = "100%", },
    },
    layerIndexes.background
  )

  local currentLayerIndex = layerIndexes.keyIndex

  for index, entry in pairs(self.bindings) do
    local zeroIndex = index - 1

    local keySize = 25
    local keyRightMargin = 10

    local columnIndex = math.floor(zeroIndex / itemsPerColumn)

    local startX = containerPadding + (columnIndex * columnWidth)
    local startY = containerPadding + ((zeroIndex % itemsPerColumn) * itemContainer)

    self.overlay:insertElement(
      {
        type = 'rectangle',
        action = 'fill',
        roundedRectRadii = { xRadius = 5, yRadius = 5 },
        fillColor = rgba(255, 255, 255, 1.0),
        frame = {
          x = startX,
          y = startY,
          w = keySize,
          h = keySize,
        },
        withShadow = true,
        shadow = {
          blurRadius = 5.0,
          color = { alpha = 1/3 },
          offset = { h = -2.0, w = 2.0 },
        }
      },
      currentLayerIndex
    )

    currentLayerIndex = currentLayerIndex + 1

    self.overlay:insertElement(
      {
        type = 'text',
        text = entry.key,
        action = 'fill',
        frame = {
          x = startX,
          y = startY + 3,
          h = keySize,
          w = keySize,
        },
        textAlignment = "center",
        textColor = rgba(38, 38, 38, 1.0),
        textFont = "Helvetica Bold",
        textSize = 14,
      },
      currentLayerIndex
    )

    currentLayerIndex = currentLayerIndex + 1

    self.overlay:insertElement(
      {
        type = 'text',
        text = hs.styledtext.new(
          entry.binding.name,
          {
            font = { name = "Helvetica Neue", size = 16 },
            color = rgba(255, 255, 255, 1.0),
            kerning = 1.2,
            shadow = {
              blurRadius = 10,
            }
          }
        ),
        action = 'fill',
        frame = {
          x = startX + keySize + keyRightMargin,
          y = startY,
          h = keySize,
          w = 300,
        },
      },
      currentLayerIndex
    )

    currentLayerIndex = currentLayerIndex + 1
  end
end

function HyperSwitcher:_bind(key, binding)
  table.insert(self.bindings, {
    key = key,
    binding = binding
  })

  hs.hotkey.bind(self.hyperMods, key, function()
    binding:launch()
  end)

  self.overlay = nil

  return self
end

----------------------------------------------------------------

hyperSwitcher = HyperSwitcher:new(hyper)

hyperSwitcher
  :bind('1'):toApplication('/Applications/1Password 7.app')
  :bind('a'):toApplication('/Applications/Slack.app')
  :bind('c'):toApplication('/Applications/Google Chrome.app')
  :bind('i'):toApplication('/Applications/Signal.app')
  :bind('s'):toApplication('/Applications/Spotify.app')
  :bind('t'):toApplication('/Applications/Alacritty.app')

local onHold = function()
  hyperSwitcher:showOverlay()
end

local onRelease = function()
  hyperSwitcher:hideOverlay()
end

hyperTap = onModifierHold(hyper, 100, onHold, onRelease)

----------------------------------------------------------------
