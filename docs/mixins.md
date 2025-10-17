# Mixins

**Mixins** is a core module in RoClass that allows you to add reusable functionality to classes.  
It provides a simple system to apply methods, properties, or behaviors across multiple classes without inheritance.

---

## Table of Contents

- [Overview](#overview)
- [API](#api)
  - [Mixin.apply](#mixinapply)
- [Examples](#examples)

---

## Overview

The Mixins module helps to **share functionality** among classes:

- Apply reusable methods and properties to multiple classes  
- Avoid code duplication  
- Works seamlessly with RoClass Builder system  
- Fully compatible with `--!strict`

---

## API

### `Mixin.apply(targetClass: table, mixin: table): nil`
Applies a mixin to a class, adding methods and properties.  
- **Parameters:**
  - `targetClass` → The class table returned by `RoClass.new(...):build()`.
  - `mixin` → Table containing methods and properties to apply.
- **Returns:** None

---

## Examples

### Creating and applying a mixin

```lua
local Mixin = RoClass.Mixin

-- Define a mixin
local HealthMixin = {
    TakeDamage = function(self, dmg)
        self.Health -= dmg
    end,
    Heal = function(self, amount)
        self.Health += amount
    end
}

-- Create a class
local Player = RoClass.new("Player")
    :constructor(function(self)
        self.Health = 100
    end)
    :build()

-- Apply the mixin
Mixin.apply(Player, HealthMixin)

local p1 = Player.new()
p1:TakeDamage(25)
print(p1.Health) -- 75
p1:Heal(10)
print(p1.Health) -- 85
```

---

## Related Modules

* [Class](classes.md) – Classes that can receive mixins
* [Object Helpers](object.md) – Type checking for instances
* [Events](event.md) – Can be combined with mixin behavior

---

> This documentation is part of RoClass.
> For more examples and detailed guides, see [RoClass Docs](index.md).
