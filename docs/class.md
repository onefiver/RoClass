# Class
**Class** is the core module of RoClass responsible for creating and managing classes in Roblox.  
It provides a builder pattern to define constructors, methods, properties, static members, and inheritance.

---

## Table of Contents
- [Overview](#overview)
- [API](#api)
  - [RoClass.new](#roclassnew)
  - [Builder Methods](#builder-methods)
    - [constructor](#constructor)
    - [method](#method)
    - [methods](#methods)
    - [property](#property)
    - [properties](#properties)
    - [static](#static)
    - [statics](#statics)
    - [extends](#extends)
    - [build](#build)
- [Examples](#examples)

---

## Overview
The Class module provides a **builder-based approach** to create classes in Roblox:  
- Define constructors, methods, properties, and static members.  
- Support inheritance through `extends()`.  
- Simplifies OOP patterns without manually handling metatables.

---

## API
### `RoClass.new(className: string): Builder`
Creates a new class builder.  
- **Parameters:**
  - `className` → Name of the class.
- **Returns:**  
  - `Builder` → A class builder object with chainable methods.

---

## Builder Methods
### `builder:constructor(fn: (self: any, ...any) -> ())`
Sets the constructor function for the class.  
- **Parameters:**
  - `fn` → Constructor function.

### `builder:method(name: string, fn: (self: any, ...any) -> any)`
Adds a single method to the class.  
- **Parameters:**
  - `name` → Name of the method.
  - `fn` → Function implementation.

### `builder:methods(tbl: { [string]: (self: any, ...any) -> any })`
Adds multiple methods at once from a table.  

### `builder:property(name: string, value: any)`
Adds a property to instances.  

### `builder:properties(tbl: { [string]: any })`
Adds multiple properties at once from a table.  

### `builder:static(tbl: { [string]: any })` / `builder:statics(tbl: { [string]: any })`
Adds static members to the class (accessible from the class table).  

### `builder:extends(parent: any)`
Sets a parent class for inheritance. Methods and properties are copied from the parent.  

### `builder:build(): any`
Finalizes the class and returns the class table ready to instantiate.

---

## Examples
### Creating a simple class
```lua
local Player = RoClass.new("Player")
    :constructor(function(self)
        self.Health = 100
        self.Mana = 50
    end)
    :method("TakeDamage", function(self, dmg)
        self.Health -= dmg
    end)
    :build()

local p1 = Player.new()
p1:TakeDamage(20)
print(p1.Health) -- 80
```

### Inheriting from another class
```lua
local Enemy = RoClass.new("Enemy")
    :extends(Player)
    :constructor(function(self)
        self.Health = 150
    end)
    :build()

local e1 = Enemy.new()
print(e1.Health) -- 150
e1:TakeDamage(30) -- inherited method
```

### Using static members
```lua
local Player = RoClass.new("Player")
    :static({ MaxHealth = 200 })
    :build()

print(Player.MaxHealth) -- 200
```

---

## Related Modules
* [Object Helpers](object.md) – Check instance types and class info
* [Registry](registry.md) – Track classes and instances
* [Mixins](mixin.md) – Reuse methods/properties across multiple classes

---

> This documentation is part of RoClass.
> For more examples and detailed guides, see [RoClass Docs](index.md).
