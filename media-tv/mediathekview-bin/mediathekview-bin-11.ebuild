# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit java-pkg-2

DESCRIPTION="Download files from the public broadcasting services"
HOMEPAGE="http://zdfmediathk.sourceforge.net/"
SRC_URI="mirror://sourceforge/zdfmediathk/Mediathek/Mediathek%20${PV}/MediathekView_${PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jdk-1.7"
RDEPEND=">=virtual/jre-1.7
	media-video/vlc
	media-video/flvstreamer
	>=dev-java/commons-compress-1.8.1:0
	>=dev-java/commons-lang-3.3.2:3.3
	dev-java/jgoodies-common:1.8
	dev-java/jgoodies-forms:1.8
	dev-java/xz-java:0
	"

S="${WORKDIR}"

src_prepare() {
	rm lib/commons-compress-1.8.1.jar || die
	rm lib/commons-lang3-3.3.2.jar || die
	rm lib/jgoodies-common-1.8.0.jar || die
	rm lib/jgoodies-forms-1.8.0.jar || die
	rm lib/xz.jar || die

	ewarn "Bundled libs remaining:"
	ewarn "$(find lib -name '*.jar' | sort)"
}

src_compile() {
	:
}

src_install() {
	java-pkg_dojar MediathekView.jar
	java-pkg_dojar lib/*.jar

	exeinto /usr/share/${PN}/lib/bin/
	doexe bin/flv.sh || die

	java-pkg_register-dependency commons-compress commons-compress.jar
	java-pkg_register-dependency commons-lang-3.3 commons-lang.jar
	java-pkg_register-dependency jgoodies-common-1.8 jgoodies-common.jar
	java-pkg_register-dependency jgoodies-forms-1.8 jgoodies-forms.jar
	java-pkg_register-dependency xz-java xz.jar

	java-pkg_dolauncher ${PN} --main mediathek.Main
}
