local BindBin = require "BindBin"
return function(t)
	
	local self = {}
	
	self.BindBins = {}
	
	setmetatable(self, {
		__index = function(tab, val)
			return t[val]
		end,
		
		__newindex = function(tab, key, val)
			t[key] = val
			if self.BindBins[key] then
				self.BindBins[key]:Fire(tab, key, val)
			end
		end,
		
		__call = function(t, bindBin, callback)
			if not self.BindBins[bindBin] then
				self.BindBins[bindBin] = BindBin.new()
			end
			self.BindBins[bindBin]:Bind(callback)
		end
	})
	
	return self
	
end

