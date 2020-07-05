-- Copyright 2020 IceG <eko.one.pl>
-- Licensed to the public under the Apache License 2.0.

require("nixio.fs")

local m
local s
local dev
local try_devices = nixio.fs.glob("/dev/ttyUSB*") or nixio.fs.glob("/dev/ttyACM*") or nixio.fs.glob("/dev/cdc*")

m = Map("sms_tool", translate("Configuration sms-tool"),
	translate("Configuration panel for sms_tool and gui application."))

s = m:section(NamedSection, 'general', "sms_tool", "<p>&nbsp;</p>" .. translate(""))
s.anonymous = true

dev = s:option(Value, "device", translate("Device"))
if try_devices then
local node
for node in try_devices do
dev:value(node, node)
end
end

return m
