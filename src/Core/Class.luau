--!strict
local Object = require(script.Parent.Object)

export type Builder = {
	extends: (self: Builder, parent: any) -> Builder,
	constructor: (self: Builder, fn: (self: any, ...any) -> ()) -> Builder,
	method: (self: Builder, name: string, fn: (self: any, ...any) -> any) -> Builder,
	methods: (self: Builder, tbl: { [string]: (self: any, ...any) -> any }) -> Builder,
	static: (self: Builder, members: { [string]: any }) -> Builder,
	statics: (self: Builder, members: { [string]: any }) -> Builder,
	property: (self: Builder, name: string, value: any) -> Builder,
	properties: (self: Builder, tbl: { [string]: any }) -> Builder,
	build: (self: Builder) -> any,
}

local Class = {}
Class.__index = Class

type InternalBuilder = Builder & {
	_name: string,
	_parent: any?,
	_constructor: ((self: any, ...any) -> ())?,
	_methods: { [string]: (self: any, ...any) -> any },
	_properties: { [string]: any },
	_static: { [string]: any },
}

function Class.new(className: string): Builder
	local builder = {
		_name = className,
		_parent = nil,
		_constructor = nil,
		_methods = {},
		_properties = {},
		_static = {},
	} :: any

	function builder:extends(parent)
		self._parent = parent
		return self
	end

	function builder:constructor(fn)
		self._constructor = fn
		return self
	end

	function builder:method(name, fn)
		self._methods[name] = fn
		return self
	end

	function builder:methods(tbl)
		for name, fn in tbl do
			self._methods[name] = fn
		end
		return self
	end

	function builder:property(name, value)
		self._properties[name] = value
		return self
	end

	function builder:properties(tbl)
		for name, value in tbl do
			self._properties[name] = value
		end
		return self
	end

	function builder:static(members)
		for k, v in members do
			self._static[k] = v
		end
		return self
	end

	function builder:statics(members)
		return self:static(members)
	end

	function builder:build()
		local class = {}
		class.__index = class
		class._className = self._name

		if self._parent == nil then
			class._parent = Object
		else
			class._parent = self._parent
		end

		if class._parent then
			for k, v in pairs(class._parent) do
				if class[k] == nil then
					class[k] = v
				end
			end
		end

		for name, fn in self._methods do
			class[name] = fn
		end
		for name, value in self._properties do
			class[name] = value
		end

		function class.new(...: any)
			local self = setmetatable({}, class)
			if class._parent and class._parent.new then
				class._parent.new(self, ...)
			end
			if builder._constructor then
				builder._constructor(self, ...)
			end
			return self
		end

		for name, value in self._static do
			rawset(class, name, value)
		end

		return class
	end

	return builder :: InternalBuilder
end

return Class
