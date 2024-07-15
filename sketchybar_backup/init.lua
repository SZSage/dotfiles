#!/usr/bin/env lua
-- Add the sketchybar module to the package cpath
package.cpath = package.cpath .. ";/Users/" .. os.getenv("USER") .. "/.local/share/sketchybar_lua/?.so"
-- import sketchybar module
sbar = require("sketchybar")
-- Debugging: Print a message
print("Loaded sketchybar module")
sbar.begin_config()
require("bar")
require("default")
require("items")
sbar.end_config()

-- Run the event loop of the sketchybar module (without this there will be no
-- callback functions executed in the lua module)
sbar.event_loop()
