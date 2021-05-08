MetaProxy's allow you to use object oriented programming like never before. Now, you can bind functions to property changes of your object. It's easy to setup, and works alongside objects with methods. I've been told by a few people that this form of OOP is not recommended. I thought it was pretty cool though, and so I thought I'd share, for anyone interested in how to use table proxies, and who are looking for a way to bind functions to property changes.

```lua
-- OBJECT
local MetaProxy = require "MetaProxy"

local Test = {}
Test.__index = Test

function Test.new()

    local self = setmetatable({}, Test)

    self.Enabled = false

    return MetaProxy(self) --> wrapps the object in MetaProxy

end

function Test:Enable()
    print("enabled")
end

function Test:Disable()
    print("disabled")
end
```

```lua
-- MAIN

local TestObject = "require(Test)" --> require object
Test = TestObject.new()
Test("Enabled", function(tab, key, val)
    print("tab") --> the proxy
    print("key") --> Enabled
    print("val") --> what ever the value is that's been written

    if val then -- value == true
        Test:Enable()
    else -- value == false
        Test:Disable()
    end
end)
```

As you can see, you can easily bind functions to property changes. This is more a demo than something you should actually use, but it's an intersting implementation, and allows oopers to  program in an interesting way.
