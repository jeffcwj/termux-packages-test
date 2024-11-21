TERMUX_PKG_HOMEPAGE=https://www.kde.org/
TERMUX_PKG_DESCRIPTION="The KDE GUI Add-ons"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="Simeon Huang <symeon@librehat.com>"
TERMUX_PKG_VERSION=5.103.0
TERMUX_PKG_SRCURL="https://download.kde.org/stable/frameworks/${TERMUX_PKG_VERSION%.*}/kguiaddons-${TERMUX_PKG_VERSION}.tar.xz"
TERMUX_PKG_SHA256=e63280fdefc4d82b42fc7b8e8e30c0b92e05538b00fb31086683019cc2d5b232
TERMUX_PKG_DEPENDS="libc++, qt5-qtbase"
TERMUX_PKG_BUILD_DEPENDS="extra-cmake-modules"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DCMAKE_INSTALL_PREFIX=${TERMUX_PREFIX}"