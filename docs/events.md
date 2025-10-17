# Events

**Events** is a core module in RoClass that provides an easy way to create and manage custom events on objects.  
It allows connecting multiple listeners, firing events, and safely disconnecting them.

---

## Table of Contents

- [Overview](#overview)
- [API](#api)
  - [Event.new](#eventnew)
  - [event:Connect](#eventconnect)
  - [event:Disconnect](#eventdisconnect)
  - [event:Fire](#eventfire)
- [Examples](#examples)

---

## Overview

The Events module provides a lightweight **event system**:

- Create custom events per instance  
- Connect multiple listeners to a single event  
- Fire events with arguments  
- Disconnect listeners safely  

This system works for both **RoClass objects** and regular Roblox instances.

---

## API

### `Event.new(): Event`
Creates a new event object.  
- **Returns:**  
  - A new `Event` instance.

### `event:Connect(callback: (...any) -> ()): RBXScriptConnection`
Connects a listener function to the event.  
- **Parameters:**
  - `callback` → Function to execute when the event is fired.
- **Returns:**  
  - A connection object that can be disconnected.

### `event:Disconnect(connection: RBXScriptConnection): nil`
Disconnects a previously connected listener.  
- **Parameters:**
  - `connection` → The connection returned by `Connect`.
- **Returns:** None

### `event:Fire(...: any): nil`
Fires the event, executing all connected listeners.  
- **Parameters:**
  - `...` → Arguments to pass to the listeners.
- **Returns:** None

---

## Examples

### Creating and connecting to an event

```lua
local Event = RoClass.Event
local MyEvent = Event.new()

local conn = MyEvent:Connect(function(msg)
    print("Event received:", msg)
end)

MyEvent:Fire("Hello") -- Output: "Event received: Hello"
````

### Disconnecting a listener

```lua
MyEvent:Disconnect(conn)
MyEvent:Fire("Won't print") -- No output
```

---

## Related Modules

* [Class](classes.md) – Define classes that can use events
* [Object Helpers](object.md) – Check instance types and class info
* [Mixins](mixin.md) – Reuse event-handling functionality

---

> This documentation is part of RoClass.
> For more examples and detailed guides, see [RoClass Docs](index.md).
