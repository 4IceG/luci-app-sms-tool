## Luci-app-sms-tool

![GitHub release (latest by date)](https://img.shields.io/github/v/release/4IceG/luci-app-sms-tool?style=flat-square)
![GitHub stars](https://img.shields.io/github/stars/4IceG/luci-app-sms-tool?style=flat-square)
![GitHub forks](https://img.shields.io/github/forks/4IceG/luci-app-sms-tool?style=flat-square)
![GitHub All Releases](https://img.shields.io/github/downloads/4IceG/luci-app-sms-tool/total)

#### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Luci-app-sms-tool is a mini gui for handling messages via sms_tool application/project https://eko.one.pl/?p=openwrt-sms_tool. Works with mPCI-E and USB 3G/LTE modems. Don't work with HiLink/RNDIS modems.

#### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Luci-app-sms-tool jest prostym interfejsem użytkownika dla projetu/aplikacji sms_tool https://eko.one.pl/?p=openwrt-sms_tool. Aplikacji umożliwia obsługę wiadomości sms i kodów ussd. Działa z modemami mPCI-E oraz USB 3G/LTE. Nie działa z modemami HiLink/RNDIS.

#### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Preview and quick configuration (modem Quectel EM160R-GL) / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Podgląd oraz szybka konfiguracja (modem Quectel EM160R-GL)

![](https://github.com/4IceG/Personal_data/blob/master/zrzuty/1.9.4-20220325/1.9.4-20220325.gif?raw=true)

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> What You Should Know / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Co powinieneś wiedzieć
> Preferred version OpenWrt =< 19.07 | Package may run with incomplete functionality on 21.02.0 (+luci-compat).

> Preferowana wersja OpenWrt =< 19.07 | Pakiet może działać z niepełną funkcjonalnością na 21.02.0 (+luci-compat).

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Installation / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Instalacja

#### Package dependencies for conventional modems.
Modem drivers are required for proper operation.
``` bash
opkg install kmod-usb-serial kmod-usb-serial-option sms-tool
```
The sms-tool package is available in the OpenWrt Master repository.

#### Step 1a. Install sms-tool from Master.
``` bash
opkg update
opkg install sms-tool
```

#### Step 1b. Download the sms-tool package and install manualy.
An example link to the package.

In the link below, replace ```*architecture*``` with the architecture of your router, e.g. arm_cortex-a7_neon-vfpv4, mipsel_24kc.
``` bash
https://downloads.openwrt.org/snapshots/packages/*architecture*/packages/sms-tool_2022-03-21-f07699ab-1_*architecture*.ipk
```

#### Step 2. Add my repository (https://github.com/4IceG/Modem-extras) to the image and follow the commands.
``` bash
opkg update
opkg install luci-app-sms-tool
```
For images downloaded from eko.one.pl.
Installation procedure is similar, only there is no need to manually download the sms-tool package.

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> User compilation / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Kompilacja przez użytkownika
``` bash
#The package can be added to Openwrt sources in two ways:

cd feeds/luci/applications/
git clone https://github.com/4IceG/luci-app-sms-tool.git
cd ../../..
./scripts feeds update -a; ./scripts/feeds install -a
make menuconfig

or e.g.

cd packages/
git clone https://github.com/4IceG/luci-app-sms-tool.git
git pull
make package/symlinks
make menuconfig

#You may need to correct the file paths and the number of folders to look like this:
feeds/luci/applications/luci-app-sms-tool/Makefile
or
packages/luci-app-sms-tool/Makefile

#Then you can compile the packages one by one, an example command:
make V=s -j1 feeds/luci/applications/luci-app-sms-tool/compile
```

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Screenshots / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Zrzuty ekranu

- "Received Messages" window / Okno odebranych wiadomości:

![](https://github.com/4IceG/Personal_data/blob/master/zrzuty/1.9.4-20220325/Odebrane%20wiadomo%C5%9Bci%20-%20LuCI.png?raw=true)

- "Sending Message" window / Okno wysyłania wiadomości:

![](https://github.com/4IceG/Personal_data/blob/master/zrzuty/1.9.4-20220325/Wysy%C5%82anie%20wiadomo%C5%9Bci%20-%20LuCI.png?raw=true)

- "USSD Codes" window / Okno kodów USSD:

![](https://github.com/4IceG/Personal_data/blob/master/zrzuty/1.9.4-20220325/Kody%20USSD%20-%20LuCI.png?raw=true)

- "AT Commands" window / Okno poleceń AT:

![](https://github.com/4IceG/Personal_data/blob/master/zrzuty/1.9.4-20220325/Polecenia%20AT%20-%20LuCI.png?raw=true)

- "Configuration" window / Okno konfiguracji:

![](https://github.com/4IceG/Personal_data/blob/master/zrzuty/1.9.4-20220325/Konfiguracja%20-%20LuCI1.png?raw=true)
![](https://github.com/4IceG/Personal_data/blob/master/zrzuty/1.9.4-20220325/Konfiguracja%20-%20LuCI2.png?raw=true)
![](https://github.com/4IceG/Personal_data/blob/master/zrzuty/1.9.4-20220325/Konfiguracja%20-%20LuCI3.png?raw=true)
![](https://github.com/4IceG/Personal_data/blob/master/zrzuty/1.9.4-20220325/Konfiguracja%20-%20LuCI4.png?raw=true)

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Thanks to / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Podziękowania dla
- [obsy (Cezary Jackiewicz)](https://github.com/obsy)
- [eko.one.pl](https://eko.one.pl/forum/viewtopic.php?id=20096)
