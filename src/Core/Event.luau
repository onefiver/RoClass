--!strict
local Event = {}
Event.__index = Event

type Callback = (...any) -> ()
export type Signal = {
	Connect: (self: Signal, fn: Callback) -> (),
	DisconnectAll: (self: Signal) -> (),
	Fire: (self: Signal, ...any) -> (),
	Wait: (self: Signal) -> (...any),
}

function Event.new(): Signal
	local self = setmetatable({}, Event) :: any
	self._connections = {} :: { Callback }
	return self
end

function Event:Connect(fn: Callback)
	table.insert(self._connections, fn)
end

function Event:DisconnectAll()
	self._connections = {}
end

function Event:Fire(...: any)
	for _, fn in ipairs(self._connections) do
		fn(...)
	end
end

function Event:Wait(): (...any)
	local result
	local finished = false

	while not finished do
		self:Connect(function(...)
			if not finished then
				result = {...}
				finished = true
			end
		end)

		game:GetService("RunService").Stepped:Wait()
	end

	return table.unpack(result)
end

return Event
