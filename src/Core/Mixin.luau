local Mixin = {}

function Mixin.Apply(builder, mixinTable)
	for name, value in pairs(mixinTable) do
		if type(value) == "function" then
			builder:method(name, value)
		else
			builder:property(name, value)
		end
	end
	return builder
end

return Mixin
