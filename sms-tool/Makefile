include $(TOPDIR)/rules.mk

PKG_NAME:=sms-tool
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/obsy/sms_tool
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2021-02-16
PKG_SOURCE_VERSION:=55e5946ff45773fe0ed0c7bae3f65d976e90bbd9

include $(INCLUDE_DIR)/package.mk

define Package/sms-tool
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=sms tool
  URL:=https://github.com/obsy/sms_tool
endef

define Package/sms-tool/description
	SMS Tool for Various of 3G Modems
endef

define Package/sms-tool/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sms_tool $(1)/usr/bin/
endef

$(eval $(call BuildPackage,sms-tool))
