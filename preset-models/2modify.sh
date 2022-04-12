#!/bin/sh

#修改登录IP
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

#修改主机名
#sed -i 's/OpenWrt/H3C-Tx1801-Plus/g' package/base-files/files/bin/config_generate
\cp -rf preset-models/target/linux target

#删除自带低版本xray-core
#rm -rf feeds/packages/net/xray-core
#rm -rf package/feeds/packages/xray-core

# 修改默认wifi名称ssid为H3C-Tx1801-Plus
sed -i 's/ssid=OpenWrt/ssid=H3C-Tx1801-Plus/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

#配置smartdns、ipv6、主题、vssr
sed -i '/exit 0/d' package/lean/default-settings/files/zzz-default-settings
cat default-settings/config_smartdns >> package/lean/default-settings/files/zzz-default-settings
cat default-settings/config_ipv6 >> package/lean/default-settings/files/zzz-default-settings
cat default-settings/config_theme >> package/lean/default-settings/files/zzz-default-settings
cat default-settings/config_vssr >> package/lean/default-settings/files/zzz-default-settings
echo "exit 0" >> package/lean/default-settings/files/zzz-default-settings

# 版本号里显示一个自己的名字（KingKong build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /KingKong build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 默认开启WIFI
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#切换ramips内核到5.10
#sed -i '/KERNEL_PATCHVER/cKERNEL_PATCHVER:=5.10' target/linux/ramips/Makefile
#切换ramips内核到5.15
sed -i '/KERNEL_PATCHVER/cKERNEL_PATCHVER:=5.15' target/linux/ramips/Makefile
#切换ramips内核到5.4
#sed -i '/KERNEL_PATCHVER/cKERNEL_PATCHVER:=5.4' target/linux/ramips/Makefile

sed -i '$a src-git destan https://github.com/destan19/OpenAppFilter' feeds.conf.default
