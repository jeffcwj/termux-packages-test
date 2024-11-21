TERMUX_PKG_HOMEPAGE=https://dev.lovelyhq.com/libburnia
TERMUX_PKG_DESCRIPTION="Library to pack up hard disk files and directories into a ISO 9660 disk image"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.5.4
TERMUX_PKG_REVISION=3
TERMUX_PKG_SRCURL=https://files.libburnia-project.org/releases/libisofs-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=aaa0ed80a7501979316f505b0b017f29cba0ea5463b751143bad2c360215a88e
TERMUX_PKG_DEPENDS="libiconv, zlib"
TERMUX_PKG_BREAKS="libisofs-dev"
TERMUX_PKG_REPLACES="libisofs-dev"
TERMUX_PKG_BUILD_IN_SRC=true
