
local mon = peripheral.wrap("right")

mon.setTextScale(0.5) 
mon.setBackgroundColor(colors.black)
mon.clear()

local w, h = mon.getSize()

function pixel(x, y, color)
  mon.setCursorPos(x, y)
  mon.setBackgroundColor(color)
  mon.write(" ")
end

local palette = {
  colors.red,
  colors.orange,
  colors.yellow,
  colors.green,
  colors.blue,
  colors.purple,
  colors.white
}

for y = 1, h do
  for x = 1, w do
    local c = palette[((x + y) % #palette) + 1]
    pixel(x, y, c)
  end
end

mon.setBackgroundColor(colors.black)
mon.setCursorPos(1,1)