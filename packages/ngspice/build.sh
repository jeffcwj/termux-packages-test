TERMUX_PKG_HOMEPAGE=https://ngspice.sourceforge.net/
TERMUX_PKG_DESCRIPTION="A mixed-level/mixed-signal circuit simulator"
TERMUX_PKG_LICENSE="BSD 3-Clause, LGPL-2.1"
TERMUX_PKG_LICENSE_FILE="COPYING"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=39
TERMUX_PKG_SRCURL=https://downloads.sourceforge.net/ngspice/ngspice-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=b89c6bbce6e82ca9370b7f5584c9a608b625a7ed25e754758c378a6fb7107925
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--enable-xspice
--enable-cider
--with-readline=yes
--enable-openmp
"
TERMUX_PKG_HOSTBUILD=true
TERMUX_PKG_EXTRA_HOSTBUILD_CONFIGURE_ARGS="
--with-x=no
--enable-cider
--enable-xspice
"
TERMUX_PKG_DEPENDS="fftw, libc++, ncurses, readline"
TERMUX_PKG_GROUPS="science"

termux_step_host_build() {
	autoreconf -fi $TERMUX_PKG_SRCDIR
	$TERMUX_PKG_SRCDIR/configure $TERMUX_PKG_EXTRA_HOSTBUILD_CONFIGURE_ARGS

	# compiles ngspice codemodel preprocessor
	cd src/xspice/cmpp && make
}

termux_step_pre_configure() {
	autoreconf -fi
}

termux_step_post_configure() {
	cp -ru $TERMUX_PKG_HOSTBUILD_DIR/src/xspice/cmpp \
		src/xspice
	cd src/xspice/cmpp && cp cmpp build/cmpp

	# prevents building again on copied precompiled cmpp.
	touch -d "next hour" *
}
