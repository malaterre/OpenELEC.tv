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

PKG_NAME="rapidjson"
PKG_VERSION="v1.1.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="http://rapidjson.org/"
PKG_GIT_URL="https://github.com/miloyip/rapidjson.git"
PKG_GIT_BRANCH="master"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="textproc"
PKG_SHORTDESC="rapidjson: A fast JSON parser/generator for C++ with both SAX/DOM style API"
PKG_LONGDESC="rapidjson is a fast JSON parser/generator for C++ with both SAX/DOM style API"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

configure_target() {
  cmake -DCMAKE_BUILD_TYPE:STRING=Release \
        -DRAPIDJSON_BUILD_DOC:BOOL=OFF \
        -DRAPIDJSON_BUILD_EXAMPLES:BOOL=OFF \
        -DRAPIDJSON_BUILD_TESTS:BOOL=OFF \
        ..
}
