--v1.0.1
local args = { ... }

msg = ""

if not args[1] then
    print("Escribe tu mensaje entre comillas \"<mensaje>\"")
    msg = read()
else
    msg = table.concat(args, " ")
end


local display = peripheral.wrap("top")
local height, width = display.getSize()

local function wrapText(text, maxWidth)
    local lines = {}
    local line = ""

    for word in text:gmatch("%S+") do
        if #line == 0 then
            line = word

        elseif #line + #word + 1 <= maxWidth then
            line = line .. " " .. word

        else
            table.insert(lines, line)
            line = word
        end
    end

    if line ~= "" then
        table.insert(lines, line)
    end

    return lines
end
local clean = {}

local lines = wrapText(msg, width)
for _, l in ipairs(lines) do
    if l ~= "" then
        table.insert(clean, l)
    end
end

lines = clean

display.clear()
local function pad(text, width)
    return string.rep(" ", width) .. text .. string.rep(" ", width)
end

local animated = {}

for _, line in ipairs(lines) do
    table.insert(animated, pad(line, width))
end


display.setCursorPos(1, 1)
for i, line in ipairs(lines) do
    if i > height then break end 

    display.setCursorPos(1, i)
    display.write(line)
end
display.setCursorPos(1, height)
display.update()

