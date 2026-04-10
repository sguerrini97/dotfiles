local hyper = {"cmd", "alt", "ctrl"}
local mash = {"cmd", "alt"}
local ghosttyBundleID = "com.mitchellh.ghostty"
local windowFramesBeforeMaximize = {}

local function windowKey(win)
  return win:id()
end

local function clearSavedFrame(win)
  local key = windowKey(win)
  if key then
    windowFramesBeforeMaximize[key] = nil
  end
end

local function saveFrame(win)
  local key = windowKey(win)
  if key then
    windowFramesBeforeMaximize[key] = hs.geometry.copy(win:frame())
  end
end

local function restoreFrame(win)
  local key = windowKey(win)
  if not key then
    return false
  end

  local frame = windowFramesBeforeMaximize[key]
  if not frame then
    return false
  end

  win:setFrame(frame)
  windowFramesBeforeMaximize[key] = nil
  return true
end

local function withFocusedWindow(fn)
  local win = hs.window.focusedWindow()
  if not win then
    return
  end

  fn(win)
end

local function openGhosttyWindow()
  local app = hs.application.get(ghosttyBundleID)

  if not app then
    hs.application.launchOrFocusByBundleID(ghosttyBundleID)
    return
  end

  app:activate()

  -- Ghostty doesn't expose a straightforward macOS "new window" API here,
  -- so once the app is active we send its standard new-window shortcut.
  hs.timer.doAfter(0.2, function()
    hs.eventtap.keyStroke({"cmd"}, "n", 0, app)
  end)
end

local function maximizeWindow(win)
  saveFrame(win)
  win:maximize()
end

local function unmaximizeWindow(win)
  if restoreFrame(win) then
    return
  end

  win:moveToUnit(hs.geometry.unitrect(0.1, 0.1, 0.8, 0.8))
end

hs.hotkey.bind(hyper, "R", function()
  hs.reload()
end)

hs.hotkey.bind(mash, "return", openGhosttyWindow)

hs.hotkey.bind(mash, "Left", function()
  withFocusedWindow(function(win)
    clearSavedFrame(win)
    win:moveToUnit(hs.layout.left50)
  end)
end)

hs.hotkey.bind(mash, "Right", function()
  withFocusedWindow(function(win)
    clearSavedFrame(win)
    win:moveToUnit(hs.layout.right50)
  end)
end)

hs.hotkey.bind(mash, "Up", function()
  withFocusedWindow(maximizeWindow)
end)

hs.hotkey.bind(mash, "Down", function()
  withFocusedWindow(unmaximizeWindow)
end)

hs.hotkey.bind(mash, "F", function()
  withFocusedWindow(function(win)
    clearSavedFrame(win)
    win:toggleFullScreen()
  end)
end)

hs.notify.new({
  title = "Hammerspoon",
  informativeText = "Config loaded",
}):send()
