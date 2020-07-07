# Copyright 2020 IceG <eko.one.pl>
# Licensed to the GNU General Public License v3.0.

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-sms-tool
LUCI_TITLE:=Mini gui for handling messages via sms_tool.
LUCI_PKGARCH:=all
DEPENDS:=+sms-tool
PKG_VERSION:=1.1
PKG_RELEASE:=beta
PKG_LICENSE:=GPLv3

include $(TOPDIR)/feeds/luci/luci.mk

define Package/luci-app-sms-tool/postinst
#!/bin/sh
rm -rf /tmp/luci-indexcache
rm -rf /tmp/luci-modulecache/
exit 0
endef

# call BuildPackage - OpenWrt buildroot signature
