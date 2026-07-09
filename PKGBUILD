# Maintainer: Ian Bradley <ian@pennyfoss.org>

_pkgname=plenv
pkgname="$_pkgname-git"
pkgver=1.4.4.r255.g3f29d0b
epoch=1
pkgrel=3
pkgdesc="Version manager for Perl 5 written in shell"
arch=(any)
url="https://github.com/tokuhirom/plenv"
license=('GPL')
depends=(perl-perl-build-git)
makedepends=(git go-md2man)
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
  
  mkdir -p man/man1

  perl -MText::Wrap -Mv5.40 -pi -e 'wrap("", "", $_)' README.md

  go-md2man --in README.md --out man/man1/plenv.1
  bsdtar -cvf man/man1/plenv.1.gz man/man1/plenv.1

  install -vdm755 "$pkgdir/usr/share/man/man1"
  install -vDm644 man/man1/plenv.1{,.gz} "$pkgdir/usr/share/man/man1"
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md 
  install -vdm755 "$pkgdir/usr/bin"

  ln -vs "/usr/lib/$_pkgname/libexec/$_pkgname" \
    "$pkgdir/usr/bin/$_pkgname"

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

