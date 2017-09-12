# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit latex-package

MY_P=${PN/latex-/}${PV//./}

DESCRIPTION="LaTeX package for American Astronomical Society journals. (AASTeX)"
HOMEPAGE="http://journals.aas.org/authors/aastex.html"
SRC_URI="http://journals.aas.org/authors/aastex/aastexv${PV}.tar.gz"

LICENSE="LPPL-1.3c"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~mips ~ppc ~sparc ~x86"
IUSE=""

# This is version 6.1, however there is a subfolder.
S="${WORKDIR}/v611"

src_install() {
	export VARTEXFONTS="${T}/fonts"
	latex-package_src_install
}
