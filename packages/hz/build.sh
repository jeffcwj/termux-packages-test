TERMUX_PKG_HOMEPAGE=https://www.cloudwego.io
TERMUX_PKG_DESCRIPTION="A high-performance and strong-extensibility Go HTTP framework that helps developers build microservices"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.5.2"
TERMUX_PKG_SRCURL=https://github.com/cloudwego/hertz/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=2931fc67934ce73fc4dec532545b24820687518b8c2084185f64b237948ff7b7
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	cd "$TERMUX_PKG_SRCDIR"/cmd/hz

	termux_setup_golang

	go mod init || :
	go mod tidy
}

termux_step_make() {
	cd "$TERMUX_PKG_SRCDIR"/cmd/hz
	go build -o hz
}

termux_step_make_install() {
	install -Dm700 -t "${TERMUX_PREFIX}"/bin "$TERMUX_PKG_SRCDIR"/cmd/hz/hz
}
