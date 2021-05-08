local Bind = {}
Bind.__index = Bind

function Bind.new(bindBin, callback)

	local self = setmetatable({}, Bind)

	self.bindBin = bindBin
	self.callback = callback
	self.binded = true

	return self

end

function Bind:Fire(...)
	self.callback(...)
end

function Bind:Unbind()
	table.remove(self.bindBin.binds, self.callback)
	self.binded = false
	setmetatable(self, nil)
end

return Bind
