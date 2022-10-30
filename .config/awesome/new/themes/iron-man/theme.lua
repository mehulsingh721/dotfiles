---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}


theme.wallpaper = string.format("%s/.config/awesome/themes/%s/background.jpg", os.getenv("HOME"), "iron-man")

-- Topbar
theme.height_topbar = 35
theme.border_width_topbar = 0
theme.bg_topbar = "transparent"

--Taglist
theme.taglist_shape_border_width = 1.5
theme.taglist_spacing = 4

theme.taglist_fg_focus = "#3F9BBF"
theme.taglist_bg_focus = "#3F9BBF"

theme.taglist_fg_empty = "transparent"
theme.taglist_bg_empty = "transparent"
theme.taglist_fg_occupied = "transparent"

theme.taglist_shape_border_color_empty = "#FFFFFF"
theme.taglist_shape_border_color_focus = "#3F9BBF"
theme.taglist_shape_border_color = "#5EF2F2"

theme.border_normal = "red"
theme.useless_gap = 3

theme.border_width = 1
theme.border_normal = "#000000"
theme.border_focus = "#3F9BBF"

function theme.at_screen_connect(s)
    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper(wallpaper, s)
end

return theme
