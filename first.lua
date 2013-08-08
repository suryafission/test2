--[[variable_one = "hello"

print(variable_one .. "Mac")
io.write("Enter a Value: ")
variable_one = io.read()
print("Entered Value is " .. variable_one)

variable_one = true
print(type(variable_one))]]

--t = {foo = "bar", [123] = 456}w
----print(t.foo)
--for key,value in pairs(t) do print(key,value) end

w = {x=0, y=0, label="console"}
x = {math.sin(0), math.sin(1), math.sin(2)}
w[1] = "another field"
x.f = w
print(w["x"])
print(w[1])
print(x.f[1])
w.x = nil