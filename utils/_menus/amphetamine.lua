-- variation on https://gist.github.com/heptal/50998f66de5aba955c00

local ampOnIcon = [[ASCII:
.....1a..........AC..........E
..............................
......4.......................
1..........aA..........CE.....
e.2......4.3...........h......
..............................
..............................
.......................h......
e.2......6.3..........t..q....
5..........c..........s.......
......6..................q....
......................s..t....
.....5c.......................
]]

local ampOffIcon = [[ASCII:
.....1a.....x....AC.y.......zE
..............................
......4.......................
1..........aA..........CE.....
e.2......4.3...........h......
..............................
..............................
.......................h......
e.2......6.3..........t..q....
5..........c..........s.......
......6..................q....
......................s..t....
...x.5c....y.......z..........
]]

-- caffeine replacement
local menubar    = require"hs.menubar"
local caffeinate = require"hs.caffeinate"

local module = {}

local function setIcon(state)
  module.menu:setIcon(state and ampOnIcon or ampOffIcon)
end

module.menu = menubar.new()
module.menu:setClickCallback(function() setIcon(caffeinate.toggle("displayIdle")) end)
setIcon(hs.caffeinate.get("displayIdle"))

return module