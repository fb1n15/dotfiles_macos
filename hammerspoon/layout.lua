-- https://shantanugoel.com/2020/08/21/hammerspoon-multiscreen-window-layout-macos/

-- Define position values that don't exist by default in hs.layout.*
local positions = {
  full = {x = 0, y = 0, w = 1, h = 1},
  leftTop = {x=0, y=0, w=0.5, h=0.5},
  leftBottom = {x=0, y=0.5, w=0.5, h=0.5},
  rightTop = {x=0.5, y=0, w=0.5, h=0.5},
  rightBottom = {x=0.5, y=0.5, w=0.5, h=0.5},
  left = {x=0, y=0, w=0.5, h=1},
  right = {x=0.5, y=0, w=1, h=1},
  top = {x=0, y=0, w=1, h=0.5},
  bottom = {x=0, y=0.5, w=1, h=1},
  leftThird = {x=0, y=0, w=0.33, h=1},
  rightTwoThirds = {x=0.33, y=0, w=1, h=1},
}

-- layout for the wide screen on the third floor
local layoutWideScreen = {
  {"Google Chrome", nil, WIDE_MONITOR, positions.leftThird, nil, nil},
  {"PyCharm", nil, WIDE_MONITOR, positions.rightTwoThirds, nil, nil},
  {"Safari", nil, MACBOOK_MONITOR, positions.full, nil, nil},
}

-- layout for the two screen (one in landscape and one in portrait)
local layoutTwoScreens = {
  {"Google Chrome", nil, DELL_MONITOR, positions.top, nil, nil},
  {"PyCharm", nil, ACER_MONITOR, positions.full, nil, nil},
  {"Safari", nil, DELL_MONITOR, positions.bottom, nil, nil},
}
-- layout for a single screen
local layoutSingleScreen = {
  {"Google Chrome", nil, MACBOOK_MONITOR, hs.layout.maximized, nil, nil},
  {"PyCharm", nil, MACBOOK_MONITOR, hs.layout.maximized, nil, nil},
  {"Safari", nil, MACBOOK_MONITOR, hs.layout.maximized, nil, nil},
}

-- launch a bunch of Apps
local appNames = {
  "Google Chrome",
  "PyCharm",
  "Safari",
  "iTerm",
  "Things"
}

local function launchApps()
  for i, appName in ipairs(appNames) do
    hs.application.launchOrFocus(appName)
  end
end

-- add a menu icon
local menu = hs.menubar.new()
local function setSingleScreen()
  menu:setTitle("🖥")
  menu:setTooltip("Single Screen Layout")
  hs.layout.apply(layoutSingleScreen)
end

local function setWideScreen()
  menu:setTitle("🖥")
  menu:setTooltip("Wide Screen Layout")
  hs.layout.apply(layoutWideScreen)
end

local function setTwoScreens()
  menu:setTitle("🖥")
  menu:setTooltip("Two Screens Layout")
  hs.layout.apply(layoutTwoScreens)
end

local function enableMenu()
  menu:setTitle("🖥")
  menu:setTooltip("No Layout")
  menu:setMenu({
      { title = "Launch Apps", fn = launchApps },
      { title = "Set Wide Screen Layout", fn = setWideScreen },
      { title = "Set Two Screens Layout", fn = setTwoScreens },
      { title = "Set Single Screen Layout", fn = setSingleScreen },
  })
end

enableMenu()