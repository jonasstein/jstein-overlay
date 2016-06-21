# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="Components and example files for McStas neutron ray-trace simulation"
HOMEPAGE="http://www.mcstas.org/"
SRC_URI="http://downloads.mcstas.org/mcstas-${PV}/unix/McStas-${PV}-UNIX-src/mcstas-comps-${PV}-src.tar.gz"
LICENSE="GPL-2"
SLOT="2.3"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/${P}-src"
DEPEND=""
RDEPEND="=sci-physics/mcstas-${PV}"

COMPSFOLDER="/usr/share/mcstas-${PV}/"

src_install()
{
	insinto ${COMPSFOLDER} ; doins -r contrib contrib data examples libs misc monitors obsolete optics samples share sources
}
