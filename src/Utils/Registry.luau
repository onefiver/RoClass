--!strict
export type RegistryTable = {
	classes: { [string]: any },
	instances: { [string]: {any} },
}

local Registry = {}
Registry.__index = Registry

Registry._classes = {} :: { [string]: any }
Registry._instances = {} :: { [string]: {any} }

function Registry.RegisterClass(class)
	local name = class._className or class.Name or tostring(class)
	Registry._classes[name] = class
	Registry._instances[name] = Registry._instances[name] or {}
end

function Registry.RegisterInstance(instance)
	local className = instance._className or instance.ClassName or tostring(instance)
	if not Registry._instances[className] then
		Registry._instances[className] = {}
	end
	table.insert(Registry._instances[className], instance)
end

function Registry.DeregisterInstance(instance)
	local className = instance._className or instance.ClassName or tostring(instance)
	local list = Registry._instances[className]
	if list then
		for i, v in ipairs(list) do
			if v == instance then
				table.remove(list, i)
				break
			end
		end
	end
end

function Registry.GetInstances(className)
	return Registry._instances[className] or {}
end

function Registry.GetClass(className)
	return Registry._classes[className]
end

return Registry
