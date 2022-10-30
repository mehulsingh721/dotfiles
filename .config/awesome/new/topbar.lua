-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
local vicious = require("vicious")

-- Notification library
-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), "iron-man")
beautiful.init(theme_path)

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.max,
    awful.layout.suit.magnifier
}

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

cpuWidget = wibox.widget.textbox()

cpuBox = wibox.container.background(
    cpuWidget,
    {
        forced_height = 10,
        forced_width = 10,
        color = "#FFFFFF",
    }
)
cpu = wibox.container.margin(
    cpuBox,
    10, 10, 5, 2,
    {
        color = "transparent",
        forced_height = 5,
        forced_width = 5,
    }
)
vicious.register(cpuWidget, vicious.widgets.cpu, "$1", 3)


-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)
awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    --
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        border_color = "red",
        --layout = wibox.layout.flex.horizontal,
        style = {
            shape = gears.shape.circle,
            font = 6,
        },
    }
    --Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    s.mytagbox = wibox.widget.textbox("This is it")
    --     markup = "This IS IT",
    --     align = "center",
    --     valign = "center",
    -- }

    -- Create the wibox
    -- Topbar
    s.mywibox = awful.wibar({
            position = "top",
            height = beautiful.height_topbar,
            border_width = beautiful.border_width_topbar,
            screen = s,
            bg = beautiful.bg_topbar,
            stretch = true,
    })

    wibox.container.background(s.mytagbox, "red", gears.shape.circle)
    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",

        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = 10,
            mylauncher,
            -- s.mytasklist, -- Middle widget
            s.mytagbox

        },
        s.mytaglist,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mytextclock,
            cpu,
            s.mylayoutbox,

        },
    }
end)
-- }}}
