
local colors = require("colors")

sbar.bar({
  height = 40,
  color = colors.bar.bg,
  border_width = 1,
  border_color = colors.white,
  corner_radius = 8,
  shadow = true,
  sticky = true,
  padding_right = 10,
  padding_left = 10,
  y_offset = 10,
  margin = 10,
  topmost = "window",
})
