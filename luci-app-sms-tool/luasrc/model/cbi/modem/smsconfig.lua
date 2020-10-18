-- Copyright 2020 Rafał Wabik (IceG) - From eko.one.pl forum
-- Licensed to the GNU General Public License v3.0.

local util = require "luci.util"
local fs = require "nixio.fs"
local sys = require "luci.sys"
local http = require "luci.http"
local dispatcher = require "luci.dispatcher"
local http = require "luci.http"
local sys = require "luci.sys"
local uci = require "luci.model.uci".cursor()

local USSD_FILE_PATH = "/etc/config/ussd.user"
local PHB_FILE_PATH = "/etc/config/phonebook.user"
local SMSC_FILE_PATH = "/etc/config/smscommands.user"

local led = tostring(uci:get("sms_tool", "general", "smsled"))
local ledtime = tostring(uci:get("sms_tool", "general", "checktime"))

local m
local s
local dev1, dev2, dev3, leds
local try_devices1 = nixio.fs.glob("/dev/ttyUSB*") or nixio.fs.glob("/dev/ttyACM*") or nixio.fs.glob("/dev/cdc*")
local try_devices2 = nixio.fs.glob("/dev/ttyUSB*") or nixio.fs.glob("/dev/ttyACM*") or nixio.fs.glob("/dev/cdc*")
local try_devices3 = nixio.fs.glob("/dev/ttyUSB*") or nixio.fs.glob("/dev/ttyACM*") or nixio.fs.glob("/dev/cdc*")
local try_leds = nixio.fs.glob("/sys/class/leds/*")


local devv = tostring(uci:get("sms_tool", "general", "readport"))

local statusb = luci.util.exec("sms_tool -s SM -d ".. devv .. " status")

local smsnum = string.sub (statusb, 23, 27)

local smscount = string.match(smsnum, '%d+')

m = Map("sms_tool", translate("Configuration sms-tool"),
	translate("Configuration panel for sms_tool and gui application."))

s = m:section(NamedSection, 'general' , "sms_tool" , "<p>&nbsp;</p>" .. translate("SMS Settings"))
s.anonymous = true

dev1 = s:option(Value, "readport", translate("SMS Reading Port"))
if try_devices1 then
local node
for node in try_devices1 do
dev1:value(node, node)
end
end

local msm = s:option(Flag, "mergesms", translate("Merge split Messages"), translate("Checking this option will make it easier to read the message, but it will cause a discrepancy in the number of messages shown and received."))
msm.rmempty = false

dev2 = s:option(Value, "sendport", translate("SMS Sending Port"))
if try_devices2 then
local node
for node in try_devices2 do
dev2:value(node, node)
end
end


local ta = s:option(TextValue, "user_phonebook", translate("User Phonebook"), translate("Each line must have the following format: 'Contact name;Phone number'. Save to file '/etc/config/phonebook.user'."))
ta.rows = 7
ta.rmempty = false

function ta.cfgvalue(self, section)
    return fs.readfile(PHB_FILE_PATH)
end

function ta.write(self, section, value)
    		value = value:gsub("\r\n", "\n")
    		fs.writefile(PHB_FILE_PATH, value)
end

local t = s:option(Value, "pnumber", translate("Prefix Number"), translate("The phone number should be preceded by the country prefix (for Poland it is 48, without '+'). If the number is 5, 4 or 3 characters, it is treated as 'short' and should not be preceded by a country prefix."))
t.rmempty = true
t.default = 48

local f = s:option(Flag, "prefix", translate("Add Prefix to Phone Number"), translate("Automatically add prefix to the phone number field."))
f.rmempty = false


local i = s:option(Flag, "information", translate("Explanation of number and prefix"), translate("Display a window to remind you of the correct phone number and prefix."))
i.rmempty = false


s = m:section(NamedSection, 'general' , "sms_tool" , "<p>&nbsp;</p>" .. translate("USSD Codes Settings"))
s.anonymous = true

dev3 = s:option(Value, "ussdport", translate("USSD Sending Port"))
if try_devices3 then
local node
for node in try_devices3 do
dev3:value(node, node)
end
end

local u = s:option(Flag, "ussd", translate("Sending USSD Code in plain text"), translate("Send the USSD code in plain text. Command is not being coded to the PDU."))
u.rmempty = false

local p = s:option(Flag, "pdu", translate("Receive message without PDU decoding"), translate("Receive and display the message without decoding it as a PDU."))
p.rmempty = false

local tb = s:option(TextValue, "user_ussd", translate("User USSD Codes"), translate("Each line must have the following format: 'Code name;Code'. Save to file '/etc/config/ussd.user'."))
tb.rows = 7
tb.rmempty = true

function tb.cfgvalue(self, section)
    return fs.readfile(USSD_FILE_PATH)
end

function tb.write(self, section, value)
    		value = value:gsub("\r\n", "\n")
    		fs.writefile(USSD_FILE_PATH, value)
end


s = m:section(NamedSection, 'general' , "sms_tool" , "<p>&nbsp;</p>" .. translate("Notification Settings"))
s.anonymous = true

local uw = s:option(Flag, "lednotify", translate("Notify new messages"), translate("The LED informs about a new message. Before activating this function, please config and save the SMS reading port, time to check SMS inbox and select the notification LED."))
uw.rmempty = false


function uw.write(self, section, value)
if devv ~= nil or devv ~= '' then
if ( smscount ~= nil and led ~= nil ) then
    if value == '1' then

        luci.sys.call("echo " .. smscount .. " > /etc/config/sms_count")
	    luci.sys.call("uci set sms_tool.general.lednotify=" .. 1 .. ";/etc/init.d/smsled enable;/etc/init.d/smsled start")

    elseif value == '0' then
       luci.sys.call("uci set sms_tool.general.lednotify=" .. 0 .. ";/etc/init.d/smsled stop;/etc/init.d/smsled disable")
	   luci.sys.call("echo 0 > '/sys/class/leds/" .. led .. "/brightness'")
    end
return Flag.write(self, section ,value)
  end
end
end


local time = s:option(Value, "checktime", translate("Check inbox every minute(s)"), translate("Specify how many minutes you want your inbox to be checked."))
time.rmempty = false
time.maxlength = 2
time.default = 5

function time.validate(self, value)
	if ( tonumber(value) < 60 and tonumber(value) > 0 ) then
	return value
	end
end


leds = s:option(Value, "smsled", translate("Notification LED"), translate("Select the notification LED."))
if try_leds then
local node
local status
for node in try_leds do
local status = node
local all = string.sub (status, 17)
leds:value(all, all)
end
end

local timeon = s:option(Value, "ledtimeon", translate("Turn on the LED for seconds(s)"), translate("Specify for how long the LED should be on."))
timeon.rmempty = false
timeon.maxlength = 3
timeon.default = 1

local timeoff = s:option(Value, "ledtimeoff", translate("Turn off the LED for seconds(s)"), translate("Specify for how long the LED should be off."))
timeoff.rmempty = false
timeoff.maxlength = 3
timeoff.default = 5

return m
