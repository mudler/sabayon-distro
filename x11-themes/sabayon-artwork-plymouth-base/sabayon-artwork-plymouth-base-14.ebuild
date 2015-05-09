# Copyright 1999-2015 Sabayon
# Distributed under the terms of the GNU General Public License v2
#

EAPI=5
inherit eutils mount-boot sabayon-artwork

DESCRIPTION="Official Sabayon Linux Plymouth base Artwork"
HOMEPAGE="http://www.sabayon.org/"
SRC_URI="mirror://sabayon/${CATEGORY}/${PN}/${PN}-${PVR}.tar.xz"
LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~arm ~x86 ~amd64"
IUSE=""
RDEPEND="
	sys-apps/findutils
	sys-boot/plymouth
	!<=x11-themes/sabayon-artwork-core-13
"
S="${WORKDIR}/${PN}"
src_install() {
	# Plymouth bizcom logo
	insinto /usr/share/plymouth
	doins -r "${S}"/bizcom.png
	
	# Plymouth default config file
	insinto /etc/plymouth
	doins "${FILESDIR}"/plymouthd.conf

}

pkg_postinst() {
	einfo "Please report bugs or glitches to"
	einfo "http://bugs.sabayon.org"
}
