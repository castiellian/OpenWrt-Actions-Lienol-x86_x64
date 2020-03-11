
#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================

# 自定义定制选项
sed -i 's/192.168.1.1/192.168.1.8/g' package/base-files/files/bin/#CONFIG_generate #定制默认IP
sed -i 's/o.default = "admin"/o.default = ""/g' lienol/luci-app-passwall/luasrc/model/cbi/passwall/balancing.lua #去除haproxy默认密码(最新版已无密码)

# 添加第三方软件包
git clone https://github.com/vernesong/OpenClash package/OpenClash
git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash
git clone https://github.com/kang-mk/luci-app-serverchan package/luci-app-serverchan
git clone https://github.com/kang-mk/luci-app-smartinfo package/luci-app-smartinfo

# 创建自定义配置文件 - OpenWrt-x86-64

rm -f ./.#CONFIG*
touch ./.#CONFIG

#
# ========================固件定制部分========================
# 

# 
# 如果不对本区块做出任何编辑, 则生成默认配置固件. 
# 

# 以下为定制化固件选项和说明:
#

#
# 有些插件/选项是默认开启的, 如果想要关闭, 请参照以下示例进行编写:
# 
#          =========================================
#         |  # 取消编译VMware镜像:                   |
#         |  cat >> .#CONFIG <<EOF                   |
#         |  # #CONFIG_VMDK_IMAGES is not set        |
#         |  EOF                                    |
#          =========================================
#

# 
# 以下是一些提前准备好的一些插件选项.
# 直接取消注释相应代码块即可应用. 不要取消注释代码块上的汉字说明.
# 如果不需要代码块里的某一项配置, 只需要删除相应行.
#
# 如果需要其他插件, 请按照示例自行添加.
# 注意, 只需添加依赖链顶端的包. 如果你需要插件 A, 同时 A 依赖 B, 即只需要添加 A.
# 
# 无论你想要对固件进行怎样的定制, 都需要且只需要修改 EOF 回环内的内容.
# 

# 编译x64固件:
cat >> .#CONFIG <<EOF
#CONFIG_TARGET_x86=y
#CONFIG_TARGET_x86_64=y
#CONFIG_TARGET_x86_64_Generic=y
EOF

cat >> .#CONFIG <<EOF
CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_Generic=y
CONFIG_LIBSODIUM_MINIMAL=y
CONFIG_PACKAGE_6in4=y
CONFIG_PACKAGE_UnblockNeteaseMusicGo=y
CONFIG_PACKAGE_adbyby=y
# CONFIG_PACKAGE_autosamba is not set
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_brook=y
CONFIG_PACKAGE_cgi-io=y
CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
CONFIG_PACKAGE_ddns-scripts_freedns_42_pl=y
CONFIG_PACKAGE_ddns-scripts_godaddy.com-v1=y
CONFIG_PACKAGE_ddns-scripts_no-ip_com=y
CONFIG_PACKAGE_ddns-scripts_route53-v1=y
CONFIG_PACKAGE_frpc=y
CONFIG_PACKAGE_hd-idle=y
CONFIG_PACKAGE_ip-full=y
# CONFIG_PACKAGE_ip-tiny is not set
CONFIG_PACKAGE_iperf3=y
CONFIG_PACKAGE_iptables-mod-conntrack-extra=y
CONFIG_PACKAGE_iptables-mod-ipopt=y
CONFIG_PACKAGE_iptables-mod-ipsec=y
CONFIG_PACKAGE_iputils-arping=y
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_kcptun-client=y
CONFIG_PACKAGE_kmod-crypto-acompress=y
CONFIG_PACKAGE_kmod-crypto-authenc=y
CONFIG_PACKAGE_kmod-crypto-cbc=y
CONFIG_PACKAGE_kmod-crypto-deflate=y
CONFIG_PACKAGE_kmod-crypto-des=y
CONFIG_PACKAGE_kmod-crypto-echainiv=y
CONFIG_PACKAGE_kmod-crypto-hmac=y
CONFIG_PACKAGE_kmod-crypto-iv=y
CONFIG_PACKAGE_kmod-crypto-md5=y
CONFIG_PACKAGE_kmod-crypto-rng=y
CONFIG_PACKAGE_kmod-crypto-sha256=y
CONFIG_PACKAGE_kmod-crypto-wq=y
CONFIG_PACKAGE_kmod-ifb=y
CONFIG_PACKAGE_kmod-ipsec=y
CONFIG_PACKAGE_kmod-ipsec4=y
CONFIG_PACKAGE_kmod-ipsec6=y
CONFIG_PACKAGE_kmod-ipt-conntrack-extra=y
CONFIG_PACKAGE_kmod-ipt-ipopt=y
CONFIG_PACKAGE_kmod-ipt-ipsec=y
CONFIG_PACKAGE_kmod-ipt-nat6=y
CONFIG_PACKAGE_kmod-ipt-raw=y
CONFIG_PACKAGE_kmod-iptunnel4=y
CONFIG_PACKAGE_kmod-iptunnel6=y
CONFIG_PACKAGE_kmod-lib-lz4=y
CONFIG_PACKAGE_kmod-lib-lzo=y
CONFIG_PACKAGE_kmod-lib-zlib-deflate=y
CONFIG_PACKAGE_kmod-lib-zlib-inflate=y
CONFIG_PACKAGE_kmod-macvlan=y
CONFIG_PACKAGE_kmod-nf-nat6=y
CONFIG_PACKAGE_kmod-nft-bridge=y
CONFIG_PACKAGE_kmod-nft-core=y
CONFIG_PACKAGE_kmod-nft-netdev=y
CONFIG_PACKAGE_kmod-sched-cake=y
CONFIG_PACKAGE_kmod-sched-core=y
CONFIG_PACKAGE_kmod-sit=y
CONFIG_PACKAGE_kmod-tun=y
CONFIG_PACKAGE_kmod-usb-ehci=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb-printer=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb3=y
CONFIG_PACKAGE_kmod-zram=y
CONFIG_PACKAGE_libbz2=y
CONFIG_PACKAGE_libcap=y
CONFIG_PACKAGE_libdb47=y
CONFIG_PACKAGE_libelf=y
CONFIG_PACKAGE_libev=y
CONFIG_PACKAGE_libexif=y
CONFIG_PACKAGE_libexpat=y
CONFIG_PACKAGE_libffi=y
CONFIG_PACKAGE_libffmpeg-audio-dec=y
CONFIG_PACKAGE_libflac=y
CONFIG_PACKAGE_libfreetype=y
CONFIG_PACKAGE_libgdbm=y
CONFIG_PACKAGE_libiconv-full=y
CONFIG_PACKAGE_libid3tag=y
CONFIG_PACKAGE_libjpeg=y
CONFIG_PACKAGE_libminiupnpc=y
CONFIG_PACKAGE_libnatpmp=y
CONFIG_PACKAGE_libnftnl=y
CONFIG_PACKAGE_libogg=y
CONFIG_PACKAGE_libpng=y
CONFIG_PACKAGE_libsodium=y
CONFIG_PACKAGE_libsqlite3=y
CONFIG_PACKAGE_libustream-openssl=y
CONFIG_PACKAGE_libvorbis=y
CONFIG_PACKAGE_libxml2=y
CONFIG_PACKAGE_luci-app-adbyby-plus=y
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-autoreboot=y
CONFIG_PACKAGE_luci-app-clash=y
# CONFIG_PACKAGE_luci-app-fileassistant is not set
CONFIG_PACKAGE_luci-app-filetransfer=y
CONFIG_PACKAGE_luci-app-frpc=y
CONFIG_PACKAGE_luci-app-haproxy-tcp=y
CONFIG_PACKAGE_luci-app-hd-idle=y
CONFIG_PACKAGE_luci-app-ipsec-vpnserver-manyusers=y
CONFIG_PACKAGE_luci-app-kcptun=y
CONFIG_PACKAGE_luci-app-minidlna=y
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-mwan3helper=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_socks=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_socks=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_kcptun=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_simple-obfs=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_v2ray-plugin=y
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-serverchan=y
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-smartinfo=y
CONFIG_PACKAGE_luci-app-softethervpn=y
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_luci-app-ssr-libev-server=y
CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Socks=y
CONFIG_PACKAGE_luci-app-ssr-python-pro-server=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic-go=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_luci-app-usb-printer=y
CONFIG_PACKAGE_luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-app-xlnetacc=y
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-i18n-adbyby-plus-zh-cn=y
CONFIG_PACKAGE_luci-i18n-autoreboot-zh-cn=y
CONFIG_PACKAGE_luci-i18n-filetransfer-zh-cn=y
CONFIG_PACKAGE_luci-i18n-haproxy-tcp-zh-cn=y
CONFIG_PACKAGE_luci-i18n-hd-idle-zh-cn=y
CONFIG_PACKAGE_luci-i18n-ipsec-vpnserver-manyusers-zh-cn=y
CONFIG_PACKAGE_luci-i18n-kcptun-zh-cn=y
CONFIG_PACKAGE_luci-i18n-minidlna-zh-cn=y
CONFIG_PACKAGE_luci-i18n-mwan3-zh-cn=y
CONFIG_PACKAGE_luci-i18n-mwan3helper-zh-cn=y
CONFIG_PACKAGE_luci-i18n-nlbwmon-zh-cn=y
CONFIG_PACKAGE_luci-i18n-smartdns-zh-cn=y
CONFIG_PACKAGE_luci-i18n-smartinfo-zh-cn=y
CONFIG_PACKAGE_luci-i18n-softethervpn-zh-cn=y
CONFIG_PACKAGE_luci-i18n-ssr-libev-server-zh-cn=y
CONFIG_PACKAGE_luci-i18n-ssr-python-pro-server-zh-cn=y
CONFIG_PACKAGE_luci-i18n-upnp-zh-cn=y
CONFIG_PACKAGE_luci-i18n-usb-printer-zh-cn=y
CONFIG_PACKAGE_luci-i18n-webadmin-zh-cn=y
CONFIG_PACKAGE_luci-i18n-wrtbwmon-zh-cn=y
CONFIG_PACKAGE_luci-i18n-zerotier-zh-cn=y
CONFIG_PACKAGE_luci-lib-fs=y
CONFIG_PACKAGE_luci-lib-json=y
CONFIG_PACKAGE_luci-mod-rpc=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
CONFIG_PACKAGE_luci-theme-bootstrap-mod=y
CONFIG_PACKAGE_luci-theme-argon-dark-mod=y
CONFIG_PACKAGE_luci-theme-argon-light-mod=y
CONFIG_PACKAGE_luci-theme-freifunk-generic=y
CONFIG_PACKAGE_luci-theme-material=y
CONFIG_PACKAGE_luci-theme-openwrt=y
CONFIG_PACKAGE_minidlna=y
CONFIG_PACKAGE_miniupnpd=y
CONFIG_PACKAGE_mwan3=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_nft-qos=y
CONFIG_PACKAGE_nftables=y
CONFIG_PACKAGE_nlbwmon=y
CONFIG_PACKAGE_p910nd=y
CONFIG_PACKAGE_python=y
CONFIG_PACKAGE_python-base=y
CONFIG_PACKAGE_python-codecs=y
CONFIG_PACKAGE_python-compiler=y
CONFIG_PACKAGE_python-ctypes=y
CONFIG_PACKAGE_python-db=y
CONFIG_PACKAGE_python-decimal=y
CONFIG_PACKAGE_python-distutils=y
CONFIG_PACKAGE_python-email=y
CONFIG_PACKAGE_python-gdbm=y
CONFIG_PACKAGE_python-light=y
CONFIG_PACKAGE_python-logging=y
CONFIG_PACKAGE_python-multiprocessing=y
CONFIG_PACKAGE_python-ncurses=y
CONFIG_PACKAGE_python-openssl=y
CONFIG_PACKAGE_python-pydoc=y
CONFIG_PACKAGE_python-sqlite3=y
CONFIG_PACKAGE_python-unittest=y
CONFIG_PACKAGE_python-xml=y
# CONFIG_PACKAGE_samba36-server is not set
CONFIG_PACKAGE_shadowsocks-libev-config=y
CONFIG_PACKAGE_shadowsocks-libev-ss-local=y
CONFIG_PACKAGE_shadowsocks-libev-ss-redir=y
CONFIG_PACKAGE_shadowsocksr-libev-server=y
CONFIG_PACKAGE_shadowsocksr-libev-ssr-local=y
CONFIG_PACKAGE_simple-obfs=y
CONFIG_PACKAGE_smartdns=y
CONFIG_PACKAGE_smartmontools=y
CONFIG_PACKAGE_softethervpn5-bridge=y
CONFIG_PACKAGE_softethervpn5-client=y
CONFIG_PACKAGE_softethervpn5-libs=y
CONFIG_PACKAGE_softethervpn5-server=y
CONFIG_PACKAGE_sqm-scripts=y
CONFIG_PACKAGE_srelay=y
CONFIG_PACKAGE_strongswan=y
CONFIG_PACKAGE_strongswan-charon=y
CONFIG_PACKAGE_strongswan-ipsec=y
CONFIG_PACKAGE_strongswan-minimal=y
CONFIG_PACKAGE_strongswan-mod-aes=y
CONFIG_PACKAGE_strongswan-mod-gmp=y
CONFIG_PACKAGE_strongswan-mod-hmac=y
CONFIG_PACKAGE_strongswan-mod-kernel-netlink=y
CONFIG_PACKAGE_strongswan-mod-nonce=y
CONFIG_PACKAGE_strongswan-mod-pubkey=y
CONFIG_PACKAGE_strongswan-mod-random=y
CONFIG_PACKAGE_strongswan-mod-sha1=y
CONFIG_PACKAGE_strongswan-mod-socket-default=y
CONFIG_PACKAGE_strongswan-mod-stroke=y
CONFIG_PACKAGE_strongswan-mod-updown=y
CONFIG_PACKAGE_strongswan-mod-x509=y
CONFIG_PACKAGE_strongswan-mod-xauth-generic=y
CONFIG_PACKAGE_strongswan-mod-xcbc=y
CONFIG_PACKAGE_tc=y
CONFIG_PACKAGE_uclibcxx=y
CONFIG_PACKAGE_v2ray-plugin=y
CONFIG_PACKAGE_zerotier=y
CONFIG_PACKAGE_zoneinfo-asia=y
CONFIG_PACKAGE_zram-swap=y
CONFIG_SQLITE3_DYNAMIC_EXTENSIONS=y
CONFIG_SQLITE3_FTS3=y
CONFIG_SQLITE3_FTS4=y
CONFIG_SQLITE3_FTS5=y
CONFIG_SQLITE3_JSON1=y
CONFIG_SQLITE3_RTREE=y
CONFIG_STRONGSWAN_ROUTING_TABLE="220"
CONFIG_STRONGSWAN_ROUTING_TABLE_PRIO="220"
EOF

# 设置固件大小:
cat >> .#CONFIG <<EOF
#CONFIG_TARGET_KERNEL_PARTSIZE=16
#CONFIG_TARGET_ROOTFS_PARTSIZE=160
EOF

# 固件压缩:
cat >> .#CONFIG <<EOF
#CONFIG_TARGET_IMAGES_GZIP=y
EOF

# 编译UEFI固件(暂不支持):
# cat >> .#CONFIG <<EOF
# #CONFIG_EFI_IMAGES=y
# EOF

# IPv6支持:
cat >> .#CONFIG <<EOF
#CONFIG_PACKAGE_ipv6helper=y
#CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
EOF

# 多文件系统支持:
# cat >> .#CONFIG <<EOF
# #CONFIG_PACKAGE_kmod-fs-nfs=y
# #CONFIG_PACKAGE_kmod-fs-nfs-common=y
# #CONFIG_PACKAGE_kmod-fs-nfs-v3=y
# #CONFIG_PACKAGE_kmod-fs-nfs-v4=y
# #CONFIG_PACKAGE_kmod-fs-ntfs=y
# #CONFIG_PACKAGE_kmod-fs-squashfs=y
# EOF

# USB3.0支持:
 cat >> .#CONFIG <<EOF
 #CONFIG_PACKAGE_kmod-usb-ohci=y
 #CONFIG_PACKAGE_kmod-usb-ohci-pci=y
 #CONFIG_PACKAGE_kmod-usb2=y
 #CONFIG_PACKAGE_kmod-usb2-pci=y
 #CONFIG_PACKAGE_kmod-usb3=y
 EOF

# 第三方插件选择:
cat >> .#CONFIG <<EOF
#CONFIG_PACKAGE_luci-app-serverchan=y #微信推送
#CONFIG_PACKAGE_luci-app-openclash=y #OpenClash客户端
#CONFIG_PACKAGE_luci-app-smartinfo=y #磁盘健康监控
EOF

# Passwall插件:
cat >> .#CONFIG <<EOF
#CONFIG_PACKAGE_luci-app-passwall=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ipt2socks=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_socks=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_socks=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ChinaDNS_NG=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_v2ray-plugin=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_simple-obfs=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_kcptun=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_haproxy=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_dns2socks=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_pdnsd=y
#CONFIG_PACKAGE_luci-app-ssr-plus=y
#CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Kcptun=y
#CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks=y
#CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Server=y
#CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Socks=y
#CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Simple_obfs=y
#CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan=y
#CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray=y
#CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray_plugin=y
#CONFIG_PACKAGE_kcptun-client=y
#CONFIG_PACKAGE_chinadns-ng=y
#CONFIG_PACKAGE_haproxy=y
#CONFIG_PACKAGE_v2ray=y
#CONFIG_PACKAGE_v2ray-plugin=y
#CONFIG_PACKAGE_simple-obfs=y
#CONFIG_PACKAGE_trojan=y
#CONFIG_PACKAGE_brook=y
#CONFIG_PACKAGE_ipt2socks=y
#CONFIG_PACKAGE_shadowsocks-libev-#CONFIG=y
#CONFIG_PACKAGE_shadowsocks-libev-ss-local=y
#CONFIG_PACKAGE_shadowsocks-libev-ss-redir=y
#CONFIG_PACKAGE_shadowsocksr-libev-alt=y
#CONFIG_PACKAGE_shadowsocksr-libev-ssr-local=y
EOF

# 常用LuCI插件(禁用):
cat >> .#CONFIG <<EOF
#CONFIG_PACKAGE_luci-app-smartdns=y #smartdnsDNS服务
#CONFIG_PACKAGE_luci-app-adguardhome=y #ADguardHome去广告服务
#CONFIG_PACKAGE_luci-app-unblockneteasemusic-go=y #解锁网易云灰色歌曲
#CONFIG_PACKAGE_luci-app-xlnetacc=y#迅雷快鸟
#CONFIG_PACKAGE_luci-app-usb-printer=y#USB打印机
#CONFIG_PACKAGE_luci-app-mwan3helper=y#多拨负载均衡
#CONFIG_PACKAGE_luci-app-mwan3=y多线多拨
#CONFIG_PACKAGE_luci-app-hd-idle=y #磁盘休眠
#CONFIG_PACKAGE_luci-app-wrtbwmon=y#实时流量监测
#
# passwall相关(禁用):
#
#
# VPN相关插件(禁用):
#
#CONFIG_PACKAGE_luci-app-ipsec-vpnserver-manyusers=y #ipsec VPN服务
#CONFIG_PACKAGE_luci-app-zerotier=y #Zerotier内网穿透
#CONFIG_PACKAGE_luci-app-pppoe-relay=y #PPPoE穿透
#CONFIG_PACKAGE_luci-app-pppoe-server=y #PPPoE服务器
#CONFIG_PACKAGE_luci-app-pptp-vpnserver-manyusers=y #PPTP VPN 服务器
#CONFIG_PACKAGE_luci-app-trojan-server is=y#Trojan服务器
#CONFIG_PACKAGE_luci-app-v2ray-server is=y#V2ray服务器
#CONFIG_PACKAGE_luci-app-brook-server is=y#brook服务端
#CONFIG_PACKAGE_luci-app-ssr-libev-server=y#ssr-libev服务端
#CONFIG_PACKAGE_luci-app-ssr-python-pro-server=y#ssr-python服务端
#CONFIG_PACKAGE_luci-app-kcptun=y #Kcptun客户端
#
# 文件共享相关(禁用):
#
# #CONFIG_PACKAGE_luci-app-aria2 is not set #Aria2离线下载
#CONFIG_PACKAGE_luci-app-minidlna=y #miniDLNA服务
# #CONFIG_PACKAGE_luci-app-kodexplorer is not set #可到私有云
# #CONFIG_PACKAGE_luci-app-filebrowser is not set #File Browser私有云
# #CONFIG_PACKAGE_luci-app-fileassistant is not set #文件助手
# #CONFIG_PACKAGE_luci-app-vsftpd is not set #FTP 服务器
# #CONFIG_PACKAGE_luci-app-samba is not set #网络共享
# #CONFIG_PACKAGE_autosamba is not set #网络共享
# #CONFIG_PACKAGE_samba36-server is not set #网络共享
EOF

# 常用LuCI插件(启用):
cat >> .#CONFIG <<EOF
#CONFIG_PACKAGE_luci-app-adbyby-plus=y #adbyby去广告
#CONFIG_PACKAGE_luci-app-webadmin=y #Web管理页面设置
#CONFIG_PACKAGE_luci-app-filetransfer=y #系统-文件传输
#CONFIG_PACKAGE_luci-app-autoreboot=y #定时重启
#CONFIG_PACKAGE_luci-app-frpc=y #Frp内网穿透
#CONFIG_PACKAGE_luci-app-upnp=y #通用即插即用UPnP(端口自动转发)
#CONFIG_PACKAGE_luci-app-softethervpn=y #SoftEtherVPN服务器
#CONFIG_DEFAULT_luci-app-vlmcsd=y #KMS激活服务器
#CONFIG_PACKAGE_luci-app-sqm=y #SQM智能队列管理
#CONFIG_PACKAGE_luci-app-ddns=y #DDNS服务
#CONFIG_PACKAGE_luci-app-wol=y #网络唤醒
#CONFIG_PACKAGE_luci-app-control-mia=y #时间控制
#CONFIG_PACKAGE_luci-app-control-timewol=y #定时唤醒
#CONFIG_PACKAGE_luci-app-control-webrestriction=y #访问限制
#CONFIG_PACKAGE_luci-app-control-weburl=y #网址过滤
#CONFIG_PACKAGE_luci-app-flowoffload=y #Turbo ACC 网络加速
#CONFIG_PACKAGE_luci-app-nlbwmon=y #宽带流量监控
EOF

# LuCI主题:
cat >> .#CONFIG <<EOF
#CONFIG_PACKAGE_luci-theme-argon-dark-mod=y
#CONFIG_PACKAGE_luci-theme-argon-light-mod=y
#CONFIG_PACKAGE_luci-theme-bootstrap=y
#CONFIG_PACKAGE_luci-theme-bootstrap-mod=y
#CONFIG_PACKAGE_luci-theme-netgear-mc=y
#CONFIG_PACKAGE_luci-theme-darkmatter=y
#CONFIG_PACKAGE_luci-theme-freifunk-generic=y
#CONFIG_PACKAGE_luci-theme-material=y
#CONFIG_PACKAGE_luci-theme-openwrt=y
EOF

# 常用软件包:
cat >> .#CONFIG <<EOF
#CONFIG_PACKAGE_curl=y
#CONFIG_PACKAGE_htop=y
#CONFIG_PACKAGE_nano=y
# #CONFIG_PACKAGE_screen=y
# #CONFIG_PACKAGE_tree=y
# #CONFIG_PACKAGE_vim-fuller=y
#CONFIG_PACKAGE_wget=y
EOF

# 其他软件包:
cat >> .#CONFIG <<EOF
#CONFIG_PACKAGE_autocore=y
#CONFIG_PACKAGE_zram-swap=y
#CONFIG_PACKAGE_luci-lib-json=y
#CONFIG_PACKAGE_luci-lib-jsonc=y
#CONFIG_PACKAGE_luci-mod-rpc=y
#CONFIG_PACKAGE_cgi-io=y
#CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
#CONFIG_PACKAGE_ddns-scripts_freedns_42_pl=y
#CONFIG_PACKAGE_ddns-scripts_godaddy.com-v1=y
#CONFIG_PACKAGE_ddns-scripts_no-ip_com=y
#CONFIG_PACKAGE_ddns-scripts_route53-v1=y
#CONFIG_PACKAGE_iperf3=y
#CONFIG_PACKAGE_kmod-crypto-acompress=y
#CONFIG_PACKAGE_kmod-crypto-authenc=y
#CONFIG_PACKAGE_kmod-crypto-cbc=y
#CONFIG_PACKAGE_kmod-crypto-deflate=y
#CONFIG_PACKAGE_kmod-crypto-des=y
#CONFIG_PACKAGE_kmod-crypto-ecb=y
#CONFIG_PACKAGE_kmod-crypto-echainiv=y
#CONFIG_PACKAGE_kmod-crypto-hmac=y
#CONFIG_PACKAGE_kmod-crypto-iv=y
#CONFIG_PACKAGE_kmod-crypto-md5=y
#CONFIG_PACKAGE_kmod-crypto-rng=y
#CONFIG_PACKAGE_kmod-crypto-sha1=y
#CONFIG_PACKAGE_kmod-crypto-sha256=y
#CONFIG_PACKAGE_kmod-crypto-wq=y
#CONFIG_PACKAGE_kmod-gre=y
#CONFIG_PACKAGE_kmod-iptunnel6=y
#CONFIG_PACKAGE_kmod-lib-lz4=y
#CONFIG_PACKAGE_kmod-lib-lzo=y
#CONFIG_PACKAGE_kmod-lib-zlib-deflate=y
#CONFIG_PACKAGE_kmod-lib-zlib-inflate=y
#CONFIG_PACKAGE_kmod-macvlan=y
#CONFIG_PACKAGE_kmod-mppe=y
#CONFIG_PACKAGE_kmod-nft-core=y
#CONFIG_PACKAGE_kmod-nft-netdev=y
#CONFIG_PACKAGE_kmod-zram=y
#CONFIG_PACKAGE_libbz2=y
#CONFIG_PACKAGE_libdb47=y
#CONFIG_PACKAGE_libexpat=y
#CONFIG_PACKAGE_libfreetype=y
#CONFIG_PACKAGE_libgdbm=y
#CONFIG_PACKAGE_libminiupnpc=y
#CONFIG_PACKAGE_libnatpmp=y
#CONFIG_PACKAGE_libnftnl=y
#CONFIG_PACKAGE_libvorbis=y
#CONFIG_PACKAGE_nft-qos=y
#CONFIG_PACKAGE_nftables=y
#CONFIG_PACKAGE_zoneinfo-asia=y
EOF

# 
# ========================固件定制部分结束========================
# 

sed -i 's/^[ \t]*//g' ./.#CONFIG

# 配置文件创建完成

