# Luci-app-sms-tool

![GitHub All Releases](https://img.shields.io/github/downloads/IceG2020/luci-app-sms-tool/total)

Luci-app-sms-tool is a mini gui for handling messages via sms_tool application/project https://eko.one.pl/?p=openwrt-sms_tool
Works with mPCI-E and USB 3G/LTE modems.

# Installation
``` bash
#Modem drivers are required for proper operation.
opkg install kmod-usb-serial kmod-usb-serial-option

#Install sms-tool.
opkg install sms-tool.ipk

#Install gui.
opkg install luci-app-sms-tool_all.ipk
```

# Screenshots

- "Received Messages" window:

![](https://raw.githubusercontent.com/IceG2020/luci-app-sms-tool/master/sms1.PNG)

- "Send SMS" window:

![](https://raw.githubusercontent.com/IceG2020/luci-app-sms-tool/master/sms2.PNG)
