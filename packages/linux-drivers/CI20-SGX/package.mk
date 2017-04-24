################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2017 Mathieu Malaterre (malat@debian.org)
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
set -x
#PKG_NAME="CI20-SGX"
PKG_NAME="SGX_DDK_Linux_XOrg_MAIN@3759903_source_km"
PKG_VERSION="3759903"
PKG_REV="1"
PKG_ARCH="mips"
PKG_LICENSE="GPL"
PKG_SITE="http://elinux.org/CI20-SGX_kernel_module"
#PKG_URL="http://mipscreator.imgtec.com/CI20/sgx/SGX_DDK_Linux_XOrg_MAIN%403759903_source_km.tgz"
PKG_URL="http://mipscreator.imgtec.com/CI20/sgx/SGX_DDK_Linux_XOrg_MAIN@3759903_source_km.tgz"
#PKG_URL="http://mipscreator.imgtec.com/CI20/sgx/${PKG_NAME}[@]${PKG_VERSION}_source_km.tgz"
PKG_DEPENDS_TARGET="toolchain linux"
#PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_PRIORITY="optional"
PKG_SECTION="driver"
PKG_SHORTDESC="CI20-SGX"
PKG_LONGDESC="CI20-SGX"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  unset LDFLAGS
}

# http://elinux.org/CI20-SGX_kernel_module
make_target() {
  CROSS_COMPILE=${TARGET_NAME} ARCH=$TARGET_KERNEL_ARCH KERNELDIR=/home/mathieu/tmp/OpenELEC.tv/build.OpenELEC-ci20.mips-8.0-devel/linux-3c61f45 make -C eurasiacon/build/linux2/jz4780_linux V=1
#  make V=1 \
#       ARCH=$TARGET_KERNEL_ARCH \
#       KSRC=$(get_pkg_build linux) \
#       CROSS_COMPILE=${TARGET_NAME}- \
#       CONFIG_POWER_SAVING=n
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/modules/$(get_module_dir)/$PKG_NAME
    cp *.ko $INSTALL/usr/lib/modules/$(get_module_dir)/$PKG_NAME
}
