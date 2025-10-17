# RoClass
**RoClass** is a lightweight, type-safe OOP library for Roblox (Luau) designed to simplify class creation, property management, events, mixins, and instance tracking.  
It’s built for developers who want clean, maintainable, and scalable code in Roblox Studio.
## Features
- **Class Builder** - Easily create classes with constructors, methods, and properties.
- **Properties & Observables** - Add and manage object properties cleanly.
- **Events** - Create and handle events on any object.
- **Mixins** - Reuse functionality across classes without traditional inheritance.
- **Registry** - Automatically track classes and instances.
- **Helpers** - Utility functions like `Clone()` and `IsInstanceOf()`.

---

## 📦 Getting Started
Copy the `RoClass` .rbxm file into `ReplicatedStorage` or `ServerStorage` (not recommended) and require it in your scripts:
```lua
local RoClass = require(pathToRoClass)
```

### Example
```lua
local Player = RoClass.new("Player")
    :constructor(function(self)
        self.Health = 100
        self.Mana = 50
    end)
    :method("TakeDamage", function(self, dmg)
        self.Health -= dmg
    end)
    :method("CastSpell", function(self, cost)
        if self.Mana >= cost then
            self.Mana -= cost
        end
    end)
    :build()

local p1 = Player.new()
p1:TakeDamage(20)
print(p1.Health) -- 80
```

---

## 📚 Learn More
Full documentation, detailed API references, and advanced examples are available on [docs](https://onefiver.github.io/RoClass).

---

##🔖 License
MIT License © onefiver
