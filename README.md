# pandora

Pandora (/pænˈdɔːrə/ pan-DOR-ə; Greek: Πανδώρα, from the XVII moon of Saturn) is a small pure-lua object oriented library.

Pandora adds classes with the common `class` syntax to Lua, which makes you able to build classes without the need of transpilation (Like [Moonscript][moonscript], which is a great language by the way), and without the classical metatable syntax.

## Example

An example of a module, let this "file" be Person.lua:

```lua
-- Remember to import class and operator functions!
----
-- Person example
----
return class 'Person' {
  ----
  -- Name
  -- @type {string}
  ----
  name = '<no name>',

  ----
  -- Constructor
  -- @param {string} name
  ----
  Person = function(this, name)
    this.name = name
  end,

  ----
  -- Compares two persons by name
  -- @param {string} other
  ----
  [operator'=='] = function(this, other)
    return this.name == other.name
  end,

  ----
  -- Shouts the name
  ----
  shout = function(this)
    print('My name is ' ..  this.name .. '!')
  end
}
```

And use just like:

```lua
local Person = require 'Person'

local john = Person('John')
john:shout()
```

Extending is easy:

```lua
local Building = class 'Building' {
  foo = function(this) println('foo') end
}
local House = class 'House' { [extends] = Building,
  bar = function(this) println('bar') end
}
```

## Testing

Tested with Lua 5.3.

Run `lua Pandora.test.lua`

[moonscript]: https://moonscript.org/
