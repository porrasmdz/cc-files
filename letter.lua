local args = { ... }

msg = ""

if not args[1] then
    print("Escribe tu mensaje entre comillas \"<mensaje>\"")
    msg = read()
else
    msg = args[1]
end


local display = peripheral.wrap("top")
local width, height = display.getSize()
local function wrapText(text, maxWidth)
    local lines = {}
    local line = ""

    for word in text:gmatch("%S+") do
        if #line + #word + 1 <= maxWidth then
            if line == "" then
                line = word
            else
                line = line .. " " .. word
            end
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
display.clear()
display.setCursorPos(1, 1)
local lines = wrapText(msg, width)
for i, line in ipairs(lines) do
    if i > height then break end 

    display.setCursorPos(1, i)
    display.write(line)
end
display.setCursorPos(1, height)
display.update()