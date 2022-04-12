#!/bin/sh
# 下载源码
git clone https://github.com/coolsnowwolf/lede.git
mv ./lede/* ./

sed -i '$a src-git kenzo https://github.com/kenzok8/small-package' feeds.conf.default

# 下载自定义插件
rm -rf package/lean/luci-theme-argon
cd package
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git luci-theme-argon-18.06
git clone https://github.com/jerrykuku/luci-app-argon-config.git
git clone https://github.com/kenzok8/openwrt-packages.git
git clone https://github.com/Ausaci/luci-app-nat6-helper.git
git clone -b packages --single-branch https://github.com/xiaorouji/openwrt-passwall.git
git clone https://github.com/ntlf9t/luci-app-easymesh.git
git clone https://github.com/destan19/OpenAppFilter.git
