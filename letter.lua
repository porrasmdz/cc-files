local args = { ... }

msg = ""

if not args[1] then
    print("Escribe tu mensaje:")
    msg = read()
else
    msg = args[1]
end


local display = peripheral.wrap("top")

display.clear()
display.setCursorPos(1,1)
display.write(msg)

display.setCursorPos(1,2)
display.write("System OK")

display.update()