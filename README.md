## Luci-app-sms-tool

![GitHub All Releases](https://img.shields.io/github/downloads/IceG2020/luci-app-sms-tool/total)
![GitHub stars](https://img.shields.io/github/stars/IceG2020/luci-app-sms-tool?style=flat-square)
![GitHub forks](https://img.shields.io/github/forks/IceG2020/luci-app-sms-tool?style=flat-square)

Luci-app-sms-tool is a mini gui for handling messages via sms_tool application/project https://eko.one.pl/?p=openwrt-sms_tool
Works with mPCI-E and USB 3G/LTE modems. Don't work with HiLink/RNDIS modems.

## Installation
``` bash
#Modem drivers are required for proper operation.
opkg install kmod-usb-serial kmod-usb-serial-option

#Install sms-tool.
opkg install sms-tool.ipk

#Install gui.
opkg install luci-app-sms-tool_all.ipk
```

## Screenshots

- "Received Messages" window:

![](https://raw.githubusercontent.com/IceG2020/luci-app-sms-tool/master/screenshots/1.3a.PNG)

- "Sending Message" window:

![](https://raw.githubusercontent.com/IceG2020/luci-app-sms-tool/master/screenshots/1.3b.PNG)

- "USSD" window:

![](https://raw.githubusercontent.com/IceG2020/luci-app-sms-tool/master/screenshots/1.3c.PNG)

- "Configuration" window:

![](https://raw.githubusercontent.com/IceG2020/luci-app-sms-tool/master/screenshots/1.3d.PNG)


## Thanks to
- [luci-app-smstool](https://github.com/lzto/luci-app-smstool)
- [sms_tool](https://eko.one.pl/?p=openwrt-sms_tool)
- [koshev-msk](https://github.com/koshev-msk)
- [eko.one.pl](https://eko.one.pl/forum/viewtopic.php?id=20096)
