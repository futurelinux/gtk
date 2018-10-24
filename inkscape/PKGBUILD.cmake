# Contributions from ArchLinux: https://git.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/inkscape

pkgname=inkscape
pkgver=0.92.3
pkgrel=3
pkgdesc='Professional vector graphics editor'
url='https://inkscape.org/'
license=('GPL' 'LGPL')
arch=('x86_64')
depends=('gc' 'gsl' 'gtkmm' 'gtkspell' 'libmagick6' 'libxslt' 'libvisio' 'libwpg'
         'poppler-glib' 'popt' 'potrace' 'ttf-dejavu' 'python2' 'desktop-file-utils'
         'hicolor-icon-theme')
# python is needed for glib-genmarshal (at least with GLib 2.54)
makedepends=('boost' 'intltool' 'python3' 'cmake' 'clang' 'openmp')
optdepends=('pstoedit: latex formulas'
            'python2-scour: optimized SVG output'
            'texlive-core: latex formulas'
            'python2-numpy: some extensions'
            'python2-lxml: some extensions and filters'
            'uniconvertor: reading/writing to some proprietary formats')
source=("https://media.inkscape.org/dl/resources/file/${pkgname}-${pkgver}.tar.bz2"
        'poppler-fixes-from-master.patch')
sha256sums=('063296c05a65d7a92a0f627485b66221487acfc64a24f712eb5237c4bd7816b2'
            'dbe0fa84f990ba76306ec5cda13b3ebe0303f325377ebdb64b061b83d453bd63')

prepare() {
	cd $pkgname-$pkgver

        # poppler 0.64 & up needed patches
        patch -Np1 -i ${srcdir}/poppler-fixes-from-master.patch

	sed -i 's| abs(| std::fabs(|g' src/ui/tools/flood-tool.cpp
        mkdir $srcdir/build       
}

build() {
	cd build
	export PKG_CONFIG_PATH='/usr/lib/imagemagick6/pkgconfig'
	export FREETYPE_CONFIG="/usr/bin/pkg-config freetype2"
        export CC=clang
        export CXX=clang++

	cmake ../${pkgname}-${pkgver} \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX:PATH=/usr \
          -DENABLE_BINRELOC=TRUE \
	  -DCMAKE_WITH_NLS=ON \
          -DWITH_DBUS=ON \
          -DWITH_LIBCDR=ON \
          -DWITH_LIBVISIO=ON \
          -DWITH_LIBWPG=ON \
          -DWITH_NLS=ON \
          -DWITH_OPENMP=ON \
          -DWITH_PROFILING=ON
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="${pkgdir}" install
}
