# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2-utils prefix qmake-utils xdg-utils

DESCRIPTION="Free cross-platform LaTeX editor (fork from texmakerX)"
HOMEPAGE="http://texstudio.sourceforge.net/"
#SRC_URI="mirror://sourceforge/${PN}/${PN}/TeXstudio%20${PV}/${P}.tar.gz"
# ^^ temporary disabled
# * upstream could not solve gentoo bug #627062 for 2 months.
#   Our tar ball does not include the questioned file.
# * a released tar ball was silently for the second time. We can not rely on the
MY_COMMIT=e7c5fe74067b367d11af2177fe3e46d103a9fa3b
SRC_URI="https://github.com/texstudio-org/${PN}/tarball/${MY_COMMIT} -> ${P}.tar.gz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~x86-fbsd"
IUSE="video"

COMMON_DEPEND="
	app-text/hunspell:=
	app-text/poppler[qt5]
	>=dev-libs/quazip-0.7.2[qt5(+)]
	dev-qt/designer:5
	dev-qt/qtcore:5
	dev-qt/qtconcurrent:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtprintsupport:5
	dev-qt/qtscript:5
	dev-qt/qtsingleapplication[qt5,X]
	dev-qt/qtsvg:5
	dev-qt/qttest:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	sys-libs/zlib
	x11-libs/libX11
	x11-libs/libXext
	video? ( media-libs/phonon[qt5(+)] )"
RDEPEND="${COMMON_DEPEND}
	app-text/ghostscript-gpl
	app-text/psutils
	media-libs/netpbm
	virtual/latex-base"
DEPEND="${COMMON_DEPEND}
	virtual/pkgconfig"

S=${WORKDIR}/texstudio-org-texstudio-e7c5fe7

src_prepare() {
	default
	#  find hunspell quazip utilities/poppler-data qtsingleapplication -delete || die

	if use video; then
		sed "/^PHONON/s:$:true:g" -i ${PN}.pro || die
	fi

	sed \
		-e '/qtsingleapplication.pri/d' \
		-i ${PN}.pro || die

	cp "${FILESDIR}"/texmakerx_my.pri ${PN}.pri || die
	eprefixify ${PN}.pri

	# fix build with quazip-0.7.2 - bug 597930
	sed -i ${PN}.pro -e "s|include/quazip|&5|" || die
	sed -i ${PN}.pri -i ${PN}.pro -e "s/-lquazip/&5/" || die
}

src_configure() {
	eqmake5 USE_SYSTEM_HUNSPELL=1 USE_SYSTEM_QUAZIP=1
}

src_install() {
	local i
	for i in 16x16 22x22 32x32 48x48 64x64 128x128; do
		newicon -s ${i} utilities/${PN}${i}.png ${PN}.png
	done
	emake DESTDIR="${D}" INSTALL_ROOT="${ED}" install
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}
