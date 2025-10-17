--!strict
export type Object = {
	isA: (self: Object, className: string) -> boolean,
	GetClassName: (self: Object) -> string,
	Destroy: (self: Object) -> (),
	ToString: (self: Object) -> string,

	_className: string?,
	_parent: any?,
}

type InternalObject = Object & { _init: ((self: Object, ...any) -> ())? }

local Object = {}
Object.__index = Object

Object._className = "Object"
Object._parent = nil

function Object.new(...: any): Object
	local instance = {} :: any
	setmetatable(instance, Object)

	local self = instance :: InternalObject

	if type(self._init) == "function" then
		self._init(self, ...)
	end

	return self
end

function Object:IsA(className: string): boolean
	local current: any = getmetatable(self)

	while current ~= nil do
		local name = rawget(current, "_className")
		if name == className then
			return true
		end

		local parent = rawget(current, "_parent")
		if parent == nil then
			break
		end

		current = parent
	end

	return false
end

function Object:GetClassName(): string
	return self._className or "Unknown"
end

function Object:Destroy()
	for key in pairs(self) do
		(self :: any)[key] = nil
	end
	setmetatable(self, nil)
end

function Object:ToString(): string
	return string.format("[%s Instance]", self._className or "Object")
end

return Object
