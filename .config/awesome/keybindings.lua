local awful = require("awful")
local gears = require("gears")


-- {{{ Key bindings
globalkeys = gears.table.join(
    --{{{
    --dmenu
    awful.key({ modkey, "Shift" }, "Return",
        function()
            awful.spawn(string.format("dmenu_run", beautiful.bg_normal, beautiful.bg_focus, beautiful.fg_focus))
        end,
        {descriptio = "show dmenu", group = "hotkeys"}
    ),
    --browser
    awful.key({ altkey  }, "b",
        function ()
            awful.spawn(browser)
        end,
        {description = "open browser", group = "hotkeys"}
    ),
    --file manager
    awful.key({ modkey, "Shift" }, "f",
        function()
            awful.spawn(filemanager)
        end,
        {description = "open filemanager", group = "hotkeys"}
    ),
    -- Open terminal
    awful.key({ modkey,           }, "Return", function () awful.spawn( terminal) end,
            {description = "terminal", group = "super"}),


    -- Tag browsing with modkey
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
        {description = "view previous", group = "tag"}
    ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
        {description = "view next", group = "tag"}
    ),
    awful.key({ altkey,           }, "Escape", awful.tag.history.restore,
        {description = "go back", group = "tag"}
    ),

     -- Tag browsing alt + tab
    awful.key({ modkey  }, "l",   awful.tag.viewnext,
        {description = "view next", group = "tag"}
    ),
    awful.key({ modkey   }, "h",  awful.tag.viewprev,
    {description = "view previous", group = "tag"}
    ),

    -- Default client focus
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx(1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

    -- layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
        {description = "swap with next client by index", group = "client"}
    ),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
        {description = "swap with previous client by index", group = "client"}
    ),
    awful.key({ modkey }, ",", function () awful.screen.focus_relative(-1) end,
        {description = "focus the previous screen", group = "screen"}
    ),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),


    awful.key({ modkey, "Shift" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q",  function () awesome.quit() end,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1) end,
              {description = "select next", group = "layout"})

)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey   }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Shift" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}
