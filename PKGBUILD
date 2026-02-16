# Maintainer: Ian Bradley <crabapp@pennyfoss.org>

_pkgname=plenv
pkgname="$_pkgname-git"
pkgver=1.4.4.r255.g3f29d0b
pkgrel=5
pkgdesc="Version manager for Perl 5 written in shell"
arch=(any)
url="https://github.com/tokuhirom/plenv"
license=('GPL')
depends=(perl-perl-build)
makedepends=(git cpanminus go-md2man)
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"

_commit=3f29d0bc29d4d864bb6008808eb2014f83f31430

source=("git+$url.git#commit=$_commit")

sha512sums=('bff48289cf965577203cba674f62a442dba63ff1c8c4ea0691b345f9219677f7a825bb46f451d82e535dfea377556dc410ffb2c4b229ec62d0ad365232cf52f0')
b2sums=('54c57221a05e11e7fcdc7d1017939c2ef9480e0baa139d06c45597c4a202428d93f77c22e48d1acd02275d643b4855a2d304b30e0cff5bc25aaf10de1a966d9e')

pkgver() {
  cd "$srcdir/$_pkgname"
  (
    set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

check() {
  cd "$srcdir/$_pkgname"
  make test
}

package() {
  cd "$srcdir/$_pkgname"

  install -vDm755 -t "$pkgdir/usr/lib/$_pkgname/libexec" libexec/*
  install -vDm644 -t "$pkgdir/usr/lib/$_pkgname/completions" completions/*
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" plenv.1 
  install -vdm755 "$pkgdir/usr/bin"

  ln -vs "/usr/lib/$_pkgname/libexec/$_pkgname" \
    "$pkgdir/usr/bin/$_pkgname"

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

