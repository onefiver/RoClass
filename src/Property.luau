--!strict

export type PropertyDefinition = {
	value: any,
	get: ((self: any, value: any) -> any)?,
	set: ((self: any, value: any) -> any)?,
}

export type PropertyTable = { [string]: PropertyDefinition }

local Property = {}
Property.__index = Property

function Property.add(self: any, name: string, definition: PropertyDefinition)
	self._properties = self._properties or {}
	self._properties[name] = definition

	rawset(self, name, definition.value)

	local mt: { __index: any?, __newindex: any? } = getmetatable(self) or {}
	local __index = mt.__index
	local __newindex = mt.__newindex

	mt.__index = function(obj, key)
		if self._properties and self._properties[key] and self._properties[key].get then
			return self._properties[key].get(obj, rawget(obj, key))
		elseif rawget(obj, key) ~= nil then
			return rawget(obj, key)
		elseif __index then
			return __index(obj, key)
		end
	end

	mt.__newindex = function(obj, key, value)
		if self._properties and self._properties[key] then
			local def = self._properties[key]
			if def.set then
				def.set(obj, value)
			else
				rawset(obj, key, value)
			end
		else
			rawset(obj, key, value)
		end
	end

	setmetatable(self, mt)
end

return Property
