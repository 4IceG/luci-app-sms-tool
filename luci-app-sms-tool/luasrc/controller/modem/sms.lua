-- Copyright 2020 IceG <eko.one.pl>
-- Licensed to the public under the Apache License 2.0.


	local util = require "luci.util"
	local fs = require "nixio.fs"
	local sys = require "luci.sys"
	local http = require "luci.http"
	local dispatcher = require "luci.dispatcher"
	local http = require "luci.http"
	local sys = require "luci.sys"
	local uci = require "luci.model.uci".cursor()

module("luci.controller.modem.sms", package.seeall)

function index()
	entry({"admin", "modem"}, firstchild(), "Modem", 30).dependent=false
	entry({"admin", "modem", "sms"}, alias("admin", "modem", "sms", "readsms"), translate("SMS Messages"), 20)
	entry({"admin", "modem", "sms", "readsms"},template("modem/readsms"),translate("Received Messages"), 10)
-- 	entry({"admin", "modem", "sms", "sendsms"},template("modem/sendsms"),translate("Send Messages"), 20)
 	entry({"admin", "modem", "sms", "ussd"},template("modem/ussd"),translate("USSD"), 20)
	entry({"admin", "modem", "sms", "smsconfig"},cbi("modem/smsconfig"),translate("Configuration"), 30)
	entry({"admin", "modem", "sms", "delete_one"}, call("delete_sms", smsindex), nil).leaf = true
	entry({"admin", "modem", "sms", "delete_all"}, call("delete_all_sms"), nil).leaf = true
	entry({"admin", "modem", "sms", "run_ussd"}, call("ussd"), nil).leaf = true
end


function delete_sms(smsindex)
	local devv = tostring(uci:get("sms_tool", "general", "device"))
	os.execute("sms_tool -d " .. devv .. " delete " .. smsindex .. "")
end

function delete_all_sms()
	local devv = tostring(uci:get("sms_tool", "general", "device"))
	os.execute("sms_tool -d " .. devv .. " delete all")
end

function ussd()
    local devv = tostring(uci:get("sms_tool", "general", "device"))
    local ussd_code = http.formvalue("code")
    if ussd_code then
	    local odpall = io.popen("sms_tool -d " .. devv .. " ussd " .. tostring(ussd_code) .." 2>&1")
	    local odp =  odpall:read("*a")
	    odpall:close()
        http.write(tostring(odp))
    else
        http.write_json(http.formvalue())
    end
end
