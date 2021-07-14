## Luci-app-sms-tool

![GitHub release (latest by date)](https://img.shields.io/github/v/release/4IceG/luci-app-sms-tool?style=flat-square)
![GitHub stars](https://img.shields.io/github/stars/4IceG/luci-app-sms-tool?style=flat-square)
![GitHub forks](https://img.shields.io/github/forks/4IceG/luci-app-sms-tool?style=flat-square)
![GitHub All Releases](https://img.shields.io/github/downloads/4IceG/luci-app-sms-tool/total)

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="32">
Luci-app-sms-tool is a mini gui for handling messages via sms_tool application/project https://eko.one.pl/?p=openwrt-sms_tool
Works with mPCI-E and USB 3G/LTE modems. Don't work with HiLink/RNDIS modems.

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="32">
Luci-app-sms-tool jest prostym interfejsem użytkownika dla projetu/aplikacji sms_tool https://eko.one.pl/?p=openwrt-sms_tool. Aplikacji umożliwia obsługę wiadomości sms i kodów ussd. Działa na modemach mPCI-E oraz USB 3G/LTE. Nie działa z modemami HiLink/RNDIS.

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="32"> Preview and quick configuration (modem Quectel EM160R-GL) / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="32"> Podgląd oraz szybka konfiguracja (modem Quectel EM160R-GL)

![](https://raw.githubusercontent.com/4IceG/Personal_data/master/zrzuty/1.8.8F/1.8.8F.gif)

## <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="32"> Installation / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="32"> Instalacja
``` bash
#Modem drivers are required for proper operation.
opkg install kmod-usb-serial kmod-usb-serial-option luci-compat

#Install sms-tool.
opkg install sms-tool_2021-05-07-e9efc352-1_XXXXXX.ipk

#Install gui.
opkg install luci-app-sms-tool_1.8.9-14072021_all.ipk

```

## <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="32"> Screenshots / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="32"> Zrzuty ekranu

- "Received Messages" window / Okno odebranych wiadomości:

![](https://raw.githubusercontent.com/4IceG/Personal_data/master/zrzuty/1.8.8F/1.8.8FPLreadsms.png)

- "Sending Message" window / Okno wysyłania wiadomości:

![](https://raw.githubusercontent.com/4IceG/Personal_data/master/zrzuty/1.8.8F/1.8.8FPLsendsms.png)

- "USSD Codes" window / Okno kodów USSD:

![](https://raw.githubusercontent.com/4IceG/Personal_data/master/zrzuty/1.8.8F/1.8.8FPLussd.png)

- "AT Commands" window / Okno poleceń AT:

![](https://raw.githubusercontent.com/4IceG/Personal_data/master/zrzuty/1.8.8F/1.8.8FPLatcommandz.png)

- "Configuration" window / Okno konfiguracji:

![](https://raw.githubusercontent.com/4IceG/Personal_data/master/zrzuty/1.8.8F/1.8.8FPLsmsconfig.png)
![](https://raw.githubusercontent.com/4IceG/Personal_data/master/zrzuty/1.8.8F/1.8.8FPLsmsconfig%20(1).png)
![](https://raw.githubusercontent.com/4IceG/Personal_data/master/zrzuty/1.8.8F/1.8.8FPLsmsconfig%20(2).png)
![](https://raw.githubusercontent.com/4IceG/Personal_data/master/zrzuty/1.8.8F/1.8.9FPLsmsconfig%20(3).png)

## <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="32"> Thanks to / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="32"> Podziękowania dla
- [obsy (Cezary Jackiewicz)](https://github.com/obsy)
- [eko.one.pl](https://eko.one.pl/forum/viewtopic.php?id=20096)
