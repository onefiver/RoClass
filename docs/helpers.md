# Helpers

**Helpers** is a utility module in RoClass that provides general-purpose functions for working with classes and instances.  
It includes functions for cloning, checking instance types, and other common operations.

---

## Table of Contents

- [Overview](#overview)
- [API](#api)
  - [Helpers.Clone](#helpersclone)
  - [Helpers.IsInstanceOf](#helpersisinstanceof)
- [Examples](#examples)

---

## Overview

The Helpers module offers **common utilities** to simplify working with RoClass objects:

- Clone instances or tables safely  
- Check if an instance belongs to a specific class (`IsInstanceOf`)  
- Works seamlessly with RoClass Builder, Object, and Registry

---

## API

### `Helpers.Clone(instance: any): any`
Clones an instance or table.  
- **Parameters:**
  - `instance` → The object or table to clone.
- **Returns:**  
  - A new instance or deep-copied table

### `Helpers.IsInstanceOf(instance: any, className: string): boolean`
Checks if an instance is of a given class or inherits from it.  
- **Parameters:**
  - `instance` → The object or class instance
  - `className` → Name of the class
- **Returns:**  
  - `true` if the instance is of the class or inherits from it, otherwise `false`

---

## Examples

### Cloning an instance

```lua
local Player = RoClass.new("Player"):build()
local p1 = Player.new()

local p2 = RoClass.Clone(p1)
print(p2 ~= p1) -- true
print(p2.Health == p1.Health) -- true
```

### Checking instance type

```lua
local Player = RoClass.GetClass("Player")
local p1 = Player.new()

print(RoClass.IsInstanceOf(p1, "Player")) -- true
print(RoClass.IsInstanceOf(p1, "Enemy")) -- false
```

---

## Related Modules

* [Class](classes.md) – Clone class instances
* [Object Helpers](object.md) – Check class information
* [Registry](registry.md) – Track instances

---

> This documentation is part of RoClass.
> For more examples and detailed guides, see [RoClass Docs](index.md).
