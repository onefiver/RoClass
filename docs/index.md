# RoClass Documentation
Welcome to the official documentation for **RoClass**, a lightweight OOP library for Roblox.

## Modules
- [Class](class.md)
- [Object](object.md)
- [Events](event.md)
- [Mixins](mixin.md)
- [Property](property.md)
- [Registry](registry.md)
- [Helpers](helpers.md)

## Getting Started
Copy the `RoClass` .rbxm file into your **ReplicatedStorage**:
```lua
local RoClass = require(pathToRoClass)
```

Start creating classes, adding properties, using events, and applying mixins:
```lua
local Player = RoClass.new("Player")
    :constructor(function(self)
        self.Health = 100
    end)
    :method("TakeDamage", function(self, dmg)
        self.Health -= dmg
    end)
    :build()

local p1 = Player.new()
p1:TakeDamage(20)
print(p1.Health) -- 80
```
