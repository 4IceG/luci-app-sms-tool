## Luci-app-sms-tool

![GitHub release (latest by date)](https://img.shields.io/github/v/release/4IceG/luci-app-sms-tool?style=flat-square)
![GitHub stars](https://img.shields.io/github/stars/4IceG/luci-app-sms-tool?style=flat-square)
![GitHub forks](https://img.shields.io/github/forks/4IceG/luci-app-sms-tool?style=flat-square)
![GitHub All Releases](https://img.shields.io/github/downloads/4IceG/luci-app-sms-tool/total)

#### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Luci-app-sms-tool is a mini gui for handling messages via sms_tool application/project https://eko.one.pl/?p=openwrt-sms_tool. Works with mPCI-E and USB 3G/LTE modems. Don't work with HiLink/RNDIS modems.

#### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Luci-app-sms-tool jest prostym interfejsem użytkownika dla projetu/aplikacji sms_tool https://eko.one.pl/?p=openwrt-sms_tool. Aplikacji umożliwia obsługę wiadomości sms i kodów ussd. Działa z modemami mPCI-E oraz USB 3G/LTE. Nie działa z modemami HiLink/RNDIS.

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> What You Should Know / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Co powinieneś wiedzieć
> Preferred version OpenWrt =< 19.07 | Package may run with incomplete functionality on 21.02.0 (+luci-compat).   
> For OpenWrt versions >= 21.02 it is recommended to use the JS version (https://github.com/4IceG/luci-app-sms-tool-js).

> Preferowana wersja OpenWrt =< 19.07 | Pakiet może działać z niepełną funkcjonalnością na 21.02.0 (+luci-compat).   
> W przypadku wersji OpenWrt >= 21.02 zalecane jest używanie wersji JS (https://github.com/4IceG/luci-app-sms-tool-js).


#### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Preview and quick configuration (modem Quectel EM160R-GL) / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Podgląd oraz szybka konfiguracja (modem Quectel EM160R-GL)

![](https://github.com/4IceG/Personal_data/blob/master/zrzuty/1.9.4-20220325/1.9.4-20220325.gif?raw=true)

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Installation / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Instalacja

<details>
   <summary>Pokaż | Show me</summary>

#### Package dependencies for conventional modems.
Modem drivers are required for proper operation.
``` bash
opkg install kmod-usb-serial kmod-usb-serial-option sms-tool
```
The sms-tool package is available in the OpenWrt Master repository.


#### Step 1a. Install sms-tool from Master (Only the current snapshot image).
``` bash
opkg update
opkg install sms-tool
```

#### Step 1b. Download the sms-tool package and install manualy (For older stable version images).

   #### To install the sms-tool package, we need to know the architecture name for router.

<details>
   <summary>Pokaż jak znaleźć architekturę routera | Show how to find a router architecture.</summary>
   

   
   > For example, we are looking for sms-tool for Zbtlink router ZBT-WE3526.   
   
   #### Step 1.
   > We go to the page and enter the name of our router.  
   https://firmware-selector.openwrt.org/
   
   
   #### Step 2.
   > Click on the folder icon and go to the image download page.   
   
   ![](https://github.com/4IceG/Personal_data/blob/master/OpenWrt%20Firmware%20Selector.png?raw=true)
   
   > It should take us to a page   
   https://downloads.openwrt.org/snapshots/targets/ramips/mt7621/
   
   #### Step 3.
   > Then go into the "packages" folder at the bottom of the page.   
   https://downloads.openwrt.org/snapshots/targets/ramips/mt7621/packages/
   
   > We check what the architecture name is for our router. All packets have names ending in mipsel_24kc.ipk, so the architecture we are looking for is mipsel_24kc.
   

</details>

#### Example of sms-tool installation using the command line.
> In the link below, replace ```*architecture*``` with the architecture of your router, e.g. arm_cortex-a7_neon-vfpv4, mipsel_24kc.

``` bash
wget https://downloads.openwrt.org/snapshots/packages/*architecture*/packages/sms-tool_2023-09-21-1b6ca032-1_*architecture*.ipk -O /tmp/sms-tool_2023-09-21.ipk
opkg install /tmp/sms-tool_2023-09-21.ipk
```

#### Another way is to download the package manually.
> To do this, we go to the page.   
https://downloads.openwrt.org/snapshots/packages/

> We choose our architecture, e.g. arm_cortex-a7_neon-vfpv4, mipsel_24kc.   
https://downloads.openwrt.org/snapshots/packages/mipsel_24kc/

> Go to the "packages" folder.   
https://downloads.openwrt.org/snapshots/packages/mipsel_24kc/packages/

> Looking for "sms-tool_2023-09-21". We can use search by using Ctr + F and typing "sms-tool".
Save the package to your computer for further installation on the router.

#### Step 2. Add my repository (https://github.com/4IceG/Modem-extras) to the image and follow the commands.
``` bash
opkg update
opkg install luci-app-sms-tool
```
For images downloaded from eko.one.pl.
Installation procedure is similar, only there is no need to manually download the sms-tool package.
   
</details>

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> User compilation / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Kompilacja przez użytkownika

<details>
   <summary>Pokaż | Show me</summary>

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
   
</details>

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
- [Users of the eko.one.pl forum](https://eko.one.pl/forum/viewtopic.php?id=20096)
