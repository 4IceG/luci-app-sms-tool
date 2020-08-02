## Luci-app-sms-tool

![GitHub All Releases](https://img.shields.io/github/downloads/IceG2020/luci-app-sms-tool/total)
![GitHub stars](https://img.shields.io/github/stars/IceG2020/luci-app-sms-tool?style=flat-square)
![GitHub forks](https://img.shields.io/github/forks/IceG2020/luci-app-sms-tool?style=flat-square)

Luci-app-sms-tool is a mini gui for handling messages via sms_tool application/project https://eko.one.pl/?p=openwrt-sms_tool
Works with mPCI-E and USB 3G/LTE modems. Don't work with HiLink/RNDIS modems.
/
Luci-app-sms-tool jest prostym interfejsem użytkownika dla projetu/aplikacji sms_tool https://eko.one.pl/?p=openwrt-sms_tool. Zadaniem aplikacji jest obsługa wiadomości sms i kodów ussd. Działa na modemach mPCI-E oraz USB 3G/LTE. Nie działa z modemami HiLink/RNDIS.

## Installation / Instalacja
``` bash
#Modem drivers are required for proper operation.
opkg install kmod-usb-serial kmod-usb-serial-option

#Install sms-tool.
opkg install sms-tool.ipk

#Install gui.
opkg install luci-app-sms-tool_all.ipk
```

## Screenshots / Zrzuty ekranu

- "Received Messages" window / Okno odebranych wiadomości:

![](https://raw.githubusercontent.com/IceG2020/luci-app-sms-tool/master/screenshots/1.3q.PNG)

- "Sending Message" window / Okno wysyłania wiadomości:

![](https://raw.githubusercontent.com/IceG2020/luci-app-sms-tool/master/screenshots/1.3w.PNG)

- "USSD" window / Okno kodów USSD:

![](https://raw.githubusercontent.com/IceG2020/luci-app-sms-tool/master/screenshots/1.3e.PNG)

- "Configuration" window / Okno konfiguracji:

![](https://raw.githubusercontent.com/IceG2020/luci-app-sms-tool/master/screenshots/1.3r.PNG)


## Thanks to / Podziękowania
- [luci-app-smstool](https://github.com/lzto/luci-app-smstool)
- [sms_tool](https://eko.one.pl/?p=openwrt-sms_tool)
- [koshev-msk](https://github.com/koshev-msk)
- [eko.one.pl](https://eko.one.pl/forum/viewtopic.php?id=20096)
