# Object

**Object** is a utility module in RoClass that provides helper functions to work with instances and classes.  
It allows you to check types, get class names, and convert instances to strings safely.

---

## Table of Contents

- [Overview](#overview)
- [API](#api)
  - [Object.IsA](#objectisa)
  - [Object.GetClassName](#objectgetclassname)
  - [Object.ToString](#objecttostring)
- [Examples](#examples)

---

## Overview

The Object module provides **common helpers for class instances**:

- Check if an instance belongs to a class (`IsA`)  
- Retrieve the class name of an instance (`GetClassName`)  
- Convert an instance to a string (`ToString`)  

These helpers are fully compatible with **RoClass-created classes** and standard Roblox instances.

---

## API

### `Object.IsA(instance: any, className: string): boolean`
Checks if an instance is of the given class or inherits from it.  
- **Parameters:**
  - `instance` → The object or class instance to check.
  - `className` → Name of the class.
- **Returns:**  
  - `true` if the instance is of the given class, otherwise `false`.

### `Object.GetClassName(instance: any): string`
Returns the class name of an instance.  
- **Parameters:**
  - `instance` → The object or class instance.
- **Returns:**  
  - The class name as a string.

### `Object.ToString(instance: any): string`
Converts an instance to a string representation.  
- **Parameters:**
  - `instance` → The object or class instance.
- **Returns:**  
  - String representation of the instance, useful for debugging.

---

## Examples

### Checking instance type

```lua
local Player = RoClass.new("Player"):build()
local p1 = Player.new()

print(Object.IsA(p1, "Player")) -- true
print(Object.IsA(p1, "Enemy"))  -- false
````

### Getting class name

```lua
print(Object.GetClassName(p1)) -- "Player"
```

### Converting to string

```lua
print(Object.ToString(p1)) -- "Player: <table address>"
```

---

## Related Modules

* [Class](classes.md) – Create and manage classes
* [Events](event.md) – Event handling
* [Mixins](mixin.md) – Apply reusable functionality to classes

---

> This documentation is part of RoClass.
> For more examples and detailed guides, see [RoClass Docs](index.md).
