################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2017 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="openvpn"
PKG_VERSION="2.4.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://openvpn.net"
PKG_URL="http://swupdate.openvpn.org/community/releases/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain lzo libressl"
PKG_PRIORITY="optional"
PKG_SECTION="network"
PKG_SHORTDESC="openvpn: a full featured SSL VPN software solution that integrates OpenVPN server capabilities."
PKG_LONGDESC="OpenVPN Access Server is a full featured SSL VPN software solution that integrates OpenVPN server capabilities, enterprise management capabilities, simplified OpenVPN Connect UI, and OpenVPN Client software packages that accommodate Windows, MAC, and Linux OS environments. OpenVPN Access Server supports a wide range of configurations, including secure and granular remote access to internal network and/ or private cloud network resources and applications with fine-grained access control."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_have_decl_TUNSETPERSIST=no \
                           --enable-lzo \
                           --disable-lz4 \
                           --disable-crypto \
                           --enable-ofb-cfb \
                           --disable-x509-alt-username \
                           --enable-multi \
                           --disable-server \
                           --disable-plugins \
                           --enable-management \
                           --disable-pkcs11 \
                           --enable-fragment \
                           --disable-multihome \
                           --disable-port-share \
                           --disable-debug \
                           --disable-small \
                           --enable-iproute2 IPROUTE=/sbin/ip \
                           --enable-def-auth \
                           --enable-pf \
                           --disable-selinux \
                           --disable-systemd"

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    ln -sf ../sbin/openvpn $INSTALL/usr/bin/openvpn
}
