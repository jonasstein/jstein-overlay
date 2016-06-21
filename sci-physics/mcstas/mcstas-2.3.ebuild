# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="A neutron ray-trace simulation package"
HOMEPAGE="http://www.mcstas.org/"
SRC_URI="http://downloads.mcstas.org/mcstas-${PV}/unix/McStas-${PV}-UNIX-src/mcstas-${PV}-src.tar.gz"
LICENSE="GPL-2"
SLOT="2.3"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/${P}-src"
DEPEND="dev-util/cmake
	sys-devel/flex
	sys-libs/glibc"
RDEPEND="sys-devel/flex
	sys-libs/glibc"

# >= cmake 3 which supports the "target_compile_options" directive
CMAKE_MIN_VERSION=3

src_install()
{
	dobin "${BUILD_DIR}"/mcstas "${BUILD_DIR}"/mcpltool "${BUILD_DIR}"/mcformat
	doman "${BUILD_DIR}"/work/doc/man/mcstas.1
	doman "${BUILD_DIR}"/work/doc/man/mcformat.1
}
