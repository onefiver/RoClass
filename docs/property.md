# Property

**Property** is a utility module in RoClass that allows you to define and manage class properties with custom behaviors.  
It provides getter/setter functionality, default values, and property definitions for objects.

---

## Table of Contents

- [Overview](#overview)
- [API](#api)
  - [Property.add](#propertyadd)
- [Examples](#examples)

---

## Overview

The Property module provides tools to:

- Define properties for classes and instances  
- Use default values and custom getter/setter logic  
- Simplify instance management and encapsulation  
- Work seamlessly with RoClass Builder and `--!strict`

---

## API

### `Property.add(target: table, name: string, definition: table | any): nil`
Adds a property to a class or instance.  
- **Parameters:**
  - `target` → Class or instance table.
  - `name` → Name of the property.
  - `definition` → Either a value or a table containing:
    - `default` → Default value
    - `get` → Optional getter function `(self) -> any`
    - `set` → Optional setter function `(self, value) -> ()`
- **Returns:** None

---

## Examples

### Adding a simple property

```lua
local Player = RoClass.new("Player")
    :constructor(function(self)
        self.Health = 100
    end)
    :build()

-- Add a property to an instance
RoClass.AddProp(Player, "Mana", 50)

local p1 = Player.new()
print(p1.Mana) -- 50
````

### Adding a property with getter and setter

```lua
RoClass.AddProp(Player, "Health", {
    default = 100,
    get = function(self)
        return self._health
    end,
    set = function(self, value)
        self._health = math.clamp(value, 0, 100)
    end
})

local p1 = Player.new()
p1.Health = 150
print(p1.Health) -- 100, clamped
```

---

## Related Modules

* [Class](classes.md) – Properties can be added to classes
* [Registry](registry.md) – Track property instances
* [Helpers](helpers.md) – Useful for property manipulation

---

> This documentation is part of RoClass.
> For more examples and detailed guides, see [RoClass Docs](index.md).
