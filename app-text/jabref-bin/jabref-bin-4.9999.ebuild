# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils java-pkg-2

DESCRIPTION="Java GUI manages bibliographies in a BibTeX database"
HOMEPAGE="https://www.jabref.org/"
KEYWORDS=""

LICENSE="MIT"
SLOT="0"

DEPEND="app-arch/tar"

RDEPEND=""

S="${WORKDIR}"

src_unpack() {
	einfo "Downloading the latest Jabref development snapshot."
	einfo "Upstream updates these a few times per day."
	wget "https://builds.jabref.org/master/JabRef-portable_linux.tar.gz" -O ${P}.tar.gz || die "wget failed"
	tar --extract --file=${P}.tar.gz JabRef/bin/JabRef.png || die "icon extraction failed"
}

src_install() {
	newicon JabRef/bin/JabRef.png JabRef-bin-icon.png
	make_desktop_entry "${PN}" JabRef-bin JabRef-bin-icon Office
	ewarn "Jabref 5.x will convert old 3.x format .bib databases to a new format."
	ewarn "The conversion is irreversible, backup .bib files before starting Jabref."
	ewarn "Jabref 5.x is under heavy development and very unstable."
}
