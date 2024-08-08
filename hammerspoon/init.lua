local log = hs.logger.new('init.lua', 'debug')

-- Use Hyper + ` to reload Hammerspoon config
hs.hotkey.bind({'shift', 'ctrl', 'alt', 'cmd'}, '`', nil, function()
  hs.reload()
end)

-- Inspired by webpro dotfiles https://github.com/webpro/dotfiles/tree/master/config/hammerspoon

-- Use Hyper + l to lock screen (screen saver)
-- hs.hotkey.bind({'shift', 'ctrl', 'alt', 'cmd'}, 'l', nil, function()
--   hs.caffeinate.startScreensaver()
-- end)

-- Use Hyper + w to print `¯\_(ツ)_/¯`
-- hs.hotkey.bind({'shift', 'ctrl', 'alt', 'cmd'}, 'q', nil, function()
--   hs.eventtap.keyStrokes('¯\\_(ツ)_/¯')
-- end)

keyUpDown = function(modifiers, key)
  -- Un-comment & reload config to log each keystroke that we're triggering
  -- log.d('Sending keystroke:', hs.inspect(modifiers), key)

  hs.eventtap.keyStroke(modifiers, key, 0)
end

-- Subscribe to the necessary events on the given window filter such that the
-- given hotkey is enabled for windows that match the window filter and disabled
-- for windows that don't match the window filter.
--
-- windowFilter - An hs.window.filter object describing the windows for which
--                the hotkey should be enabled.
-- hotkey       - The hs.hotkey object to enable/disable.
--
-- Returns nothing.
enableHotkeyForWindowsMatchingFilter = function(windowFilter, hotkey)
  windowFilter:subscribe(hs.window.filter.windowFocused, function()
    hotkey:enable()
  end)

  windowFilter:subscribe(hs.window.filter.windowUnfocused, function()
    hotkey:disable()
  end)
end

-- require('keyboard.hyper')
-- require('keyboard.panes')
-- require('keyboard.delete-words')
-- require('keyboard.control-escape')
-- require('keyboard.markdown')
-- require('keyboard.microphone')
-- require('keyboard.windows')

hs.notify.new({title='Hammerspoon', informativeText='Ready to rock 🤘'}):send()
