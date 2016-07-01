# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Meta package of gentoo tools, everybody [TM] wants to install on a fresh system"
SLOT="0"
KEYWORDS="~amd64 ~x86 "
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="metapackage"

RDEPEND="
	app-portage/conf-update
	app-portage/cpuinfo2cpuflags
	app-portage/diffmask
	app-portage/distpatch
	app-portage/eclass-manpages
	app-portage/eix
	app-portage/elogv
	app-portage/elogviewer
	app-portage/esearch
	app-portage/etc-proposals
	app-portage/euscan
	app-portage/euses
	app-portage/flaggie
	app-portage/fquery
	app-portage/genlop
	app-portage/gentoolkit
	app-portage/gentoolkit-dev
	app-portage/metagen
	app-portage/mirrorselect
	app-portage/overlint
	app-portage/perl-info
	app-portage/portage-utils
	app-portage/porthole
	app-portage/portpeek"
