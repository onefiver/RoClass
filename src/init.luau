--!strict
local Strict = require(script.Strict)

-- Core
local Class = require(script.Core.Class)
local Object = require(script.Core.Object)
local Event = require(script.Core.Event)
local Mixin = require(script.Core.Mixin)

-- Utils
local Property = require(script.Utils.Property)
local Registry = require(script.Utils.Registry)
local Helpers = require(script.Utils.Helpers)

local RoClass = Strict({
	-- Core
	Event = Event,
	Mixin = Mixin,

	-- Class
	Class = Class,
	new = function(className: string)
		return Class.new(className)
	end,

	-- Object
	Object = Object,
	isA = function(instance: any, className: string)
		return Object.IsA(instance, className)
	end,
	GetClassName = function(instance: any)
		return Object.GetClassName(instance)
	end,
	ToString = function(instance: any)
		return Object.ToString(instance)
	end,

	-- Utils
	Property = Property,
	AddProp = function(self, name, definition)
		return Property.add(self, name, definition)
	end,
	
	Registry = Registry,
	RegisterClass = function(class)
		return Registry.RegisterClass(class)
	end,
	RegisterInstance = function(instance)
		return Registry.RegisterInstance(instance)
	end,
	DeregisterInstance = function(instance)
		return Registry.DeregisterInstance(instance)
	end,
	GetInstances = function(className)
		return Registry.GetInstances(className)
	end,
	GetClass = function(className)
		return Registry.GetClass(className)
	end,
	
	Helpers = Helpers,
	Clone = function(instance)
		return Helpers.Clone(instance)
	end,
	IsInstanceOf = function(instance, className)
		return Helpers.IsInstanceOf(instance, className)
	end,
})

return RoClass
