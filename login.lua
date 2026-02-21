-- /bin/login.lua

term.clear()
term.setCursorPos(1,1)

print("=== CC LOGIN SYSTEM ===\n")

local function loadUsers()
  if not fs.exists("/users.json") then
    error("/users.json no existe")
  end

  local f = fs.open("/users.json", "r")
  local data = f.readAll()
  f.close()

  local users = textutils.unserializeJSON(data)

  if not users then
    error("users.json invalido")
  end

  return users
end

local users = loadUsers()

local function readHidden()
  local s = ""
  while true do
    local e, key = os.pullEvent("char")
    if key == "\n" then break end
    s = s .. "*"
    term.write("*")
  end
  print()
  return s
end

write("Usuario: ")
local user = read()

if not users[user] then
  print("Usuario no existe")
  sleep(2)
  os.reboot()
end

write("Clave: ")
local pass = read("*")

if pass ~= users[user].pass then
  print("\nClave incorrecta")
  sleep(2)
  os.reboot()
end

if not fs.exists(users[user].dir) then
  fs.makeDir(users[user].dir)
end


shell.setDir(users[user].dir)

print("\nBienvenido,", user)
sleep(1)


shell.run("shell")