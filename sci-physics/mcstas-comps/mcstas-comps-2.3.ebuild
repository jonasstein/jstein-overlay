# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="Components and example files for McStas neutron ray-trace simulation"
HOMEPAGE="http://www.mcstas.org/"
SRC_URI="http://downloads.mcstas.org/mcstas-2.3/unix/McStas-2.3-UNIX-src/mcstas-comps-2.3-src.tar.gz"
LICENSE="GPL-2"
SLOT="2.3"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/${P}-src"
DEPEND=""
RDEPEND=">=sci-physics/mcstas-2.3"

COMPSFOLDER="/usr/share/mcstas-2.3/"

src_install()
{
	insinto ${COMPSFOLDER}/contrib ; doins -r contrib/*
	insinto ${COMPSFOLDER}/data ; doins -r data/*
	insinto ${COMPSFOLDER}/examples ; doins -r examples/*
	insinto ${COMPSFOLDER}/libs ; doins -r libs/*
	insinto ${COMPSFOLDER}/misc ; doins -r misc/*
	insinto ${COMPSFOLDER}/monitors ; doins -r monitors/*
	insinto ${COMPSFOLDER}/obsolete ; doins -r obsolete/*
	insinto ${COMPSFOLDER}/optics ; doins -r optics/*
	insinto ${COMPSFOLDER}/samples ; doins -r samples/*
	insinto ${COMPSFOLDER}/share ; doins -r share/*
	insinto ${COMPSFOLDER}/sources ; doins -r sources/*
}
