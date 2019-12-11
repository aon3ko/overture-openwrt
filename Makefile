include $(TOPDIR)/rules.mk

PKG_NAME:=overture
PKG_VERSION:=1.6-rc6
PKG_RELEASE:=1
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
#PKG_SOURCE_URL:=https://github.com/shawn1m/overture/archive/v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/shawn1m/overture/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=d2a7976811cec3f39ccdd65e264415f072e02d1cfdbc674d7494be29faab8b38

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1

GO_PKG:=github.com/shawn1m/overture
GO_PKG_LDFLAGS:=-s -w
GO_PKG_LDFLAGS_X:=main.version=$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/overture
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=IP Addresses and Names
  TITLE:=A customized DNS forwarder written in Go
  URL:=https://github.com/shawn1m/overture
endef

define Package/overture/description
  Overture means an orchestral piece at the beginning of a classical music composition, just like DNS which is nearly the first step of surfing the Internet.
endef

define Package/overture/install
	$(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))

	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/sbin/overture
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/overture.init $(1)/etc/init.d/overture
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/config/overture $(1)/etc/config/overture
	$(INSTALL_DIR) $(1)/etc/overture
	$(INSTALL_CONF) ./files/overture/* $(1)/etc/overture/
endef

$(eval $(call GoBinPackage,overture))
$(eval $(call BuildPackage,overture))
