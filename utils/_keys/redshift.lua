--local redshift   = require("hs.redshift")
local hotkey     = require("hs.hotkey")
local mods       = require("hs._asm.extras").mods
local alert      = require("hs.alert")
--local settings   = require("hs.settings")
local screen     = require("hs.screen")

local module = {
    help = "⌘-F11 and ⌘⌥-F11"
}

-- settings.clear("hs.redshift.inverted.override")
-- settings.clear("hs.redshift.disabled.override")

--redshift.start(2800,'21:00','7:00','4h')

hotkey.bind(mods.Casc, "F11", function()
    alert("Toggle Invert")
    for i,v in ipairs(screen.allScreens()) do
        local gamma = v:getGamma()
        if gamma then
            v:setGamma(gamma.blackpoint, gamma.whitepoint)
        else
            print("~~ could not get gamma for " .. tostring(v:name()))
        end
    end
--    redshift.toggleInvert()
end)

--hotkey.bind(mods.CAsc, "F11", function()
--    alert("Toggle Redshift")
--    redshift.toggle()
--end)
--
--local watchable = require("hs.watchable")
--module.watchCaffeinatedState = watchable.watch("generalStatus.caffeinatedState", function(w, p, i, old, new)
--    if new == 0 or new == 9 then -- systemDidWake or screensaverDidStop
--        redshift.start(2800,'21:00','7:00','4h')
--    elseif new == 1 or new == 7 then -- systemWillSleep or screensaverDidStart
--        redshift.stop()
--    end
--end)

return module
