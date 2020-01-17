-- Copyright 2019-2020 Pablo Blanco Celdrán
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy 
-- of this software and associated documentation files (the "Software"), to deal 
-- in the Software without restriction, including without limitation the rights 
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
-- copies of the Software, and to permit persons to whom the Software is 
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in 
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
-- SOFTWARE.
local pandora = require './Pandora'
local class, operator, static = pandora.class, pandora.operator, pandora.static

-- If does not error, it works.
print 'It passes if no errors are displayed'

local Person = class 'Person' {
  name = 'No name.',
  age = 0,
  Person = function(this, name, age)
    this.name = name or this.name
    this.age = age or this.age
  end,
  shout = function(this, what)
    if what == nil then return false end
    print(this.name .. ' shouted: "' .. what .. '"')
    return true
  end,
  [operator'=='] = function(this, other)
    return this.name == other.name and this.age == other.age
  end
}

local null = Person()
local john = Person('John', 33)

assert(null.age == 0, 'Default value for "age" must match with class def!')
assert(null.name == 'No name.', 'Default value for "name" must match with class def!')
assert(john.name == 'John', 'Class instance should be able to use it\'s primary constructor!')
assert(john.age == 33, 'Class instance should be able to use it\'s primary constructor!')

local johnClone = Person('John', 33)
assert(john == johnClone, 'Operator overload is failing')

assert(john:shout('Hello world!'), 'Method not passing parameters')
