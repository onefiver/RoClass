--!strict
local Helpers = {}

function Helpers.Clone(instance: any)
	local copy = {}
	for k, v in pairs(instance) do
		copy[k] = v
	end
	return copy
end

function Helpers.IsInstanceOf(instance: any, className: string)
	local class = instance._className or instance.ClassName
	if class == className then
		return true
	end

	local parent = instance._parent
	while parent do
		if parent._className == className then
			return true
		end
		parent = parent._parent
	end

	return false
end

return Helpers
