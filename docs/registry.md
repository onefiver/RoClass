# Registry

**Registry** is a utility module in RoClass that keeps track of classes and instances.  
It allows you to register classes, register/deregister instances, and retrieve instances by class name.

---

## Table of Contents

- [Overview](#overview)
- [API](#api)
  - [Registry.RegisterClass](#registryregisterclass)
  - [Registry.RegisterInstance](#registryregisterinstance)
  - [Registry.DeregisterInstance](#registryderegisterinstance)
  - [Registry.GetInstances](#registrygetinstances)
  - [Registry.GetClass](#registrygetclass)
- [Examples](#examples)

---

## Overview

The Registry module provides a **centralized tracking system**:

- Keep track of all registered classes  
- Register and deregister instances automatically  
- Retrieve all instances of a given class  
- Retrieve class definitions by name  
- Works seamlessly with RoClass Builder and Object utilities

---

## API

### `Registry.RegisterClass(class: table): nil`
Registers a class with the registry.  
- **Parameters:**
  - `class` → Class table returned by `RoClass.new(...):build()`.
- **Returns:** None

### `Registry.RegisterInstance(instance: any): nil`
Registers an instance of a class.  
- **Parameters:**
  - `instance` → The instance to register.
- **Returns:** None

### `Registry.DeregisterInstance(instance: any): nil`
Removes an instance from the registry.  
- **Parameters:**
  - `instance` → The instance to remove.
- **Returns:** None

### `Registry.GetInstances(className: string): { any }`
Retrieves all registered instances of a class.  
- **Parameters:**
  - `className` → Name of the class.
- **Returns:**  
  - Array of instances

### `Registry.GetClass(className: string): table?`
Retrieves the class definition by name.  
- **Parameters:**
  - `className` → Name of the class.
- **Returns:**  
  - Class table, or `nil` if not found

---

## Examples

### Registering a class

```lua
local Player = RoClass.new("Player"):build()
RoClass.RegisterClass(Player)
```

### Registering and retrieving instances

```lua
local p1 = Player.new()
local p2 = Player.new()

RoClass.RegisterInstance(p1)
RoClass.RegisterInstance(p2)

local instances = RoClass.GetInstances("Player")
print(#instances) -- 2
```

### Deregistering an instance

```lua
RoClass.DeregisterInstance(p1)
local instances = RoClass.GetInstances("Player")
print(#instances) -- 1
```

### Getting class definition

```lua
local classDef = RoClass.GetClass("Player")
print(classDef._className) -- "Player"
```

---

## Related Modules

* [Class](classes.md) – Classes to register
* [Object Helpers](object.md) – Check instance types
* [Property](property.md) – Register properties on instances

---

> This documentation is part of RoClass.
> For more examples and detailed guides, see [RoClass Docs](index.md).
