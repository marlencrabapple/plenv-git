# Maintainer: Ian Bradley <crabapp@hikki.tech>
_pkgname=plenv
pkgname="$_pkgname-git"
pkgver=1.4.4.r255.g3f29d0b
pkgrel=3
epoch=1
pkgdesc="Version manager for Perl 5 written in shell script"
arch=(any)
url="https://github.com/tokuhirom/plenv"
license=('GPL')
depends=(perl-perl-build)
makedepends=(git cpanminus)
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"

_commit=3f29d0bc29d4d864bb6008808eb2014f83f31430
#_perlbuild_commit=e56e4e44816cb1f9912bf560cc8b86bff609da68

source=("git+$url.git#commit=$_commit")
#  "git+${url/%plenv/Perl-Build.git}#commit=$_perlbuild_commit")

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

#prepare() {
#  cd "$srcdir/$_pkgname"
#  export PERL5LIB="$(pwd)/local/lib/perl5"
#  export PERL_CPANM_OPT="--verbose --save-dists . -"
#}


#build() {
#  set -x
#  cd "$srcdir/$_pkgname"
#}

check() {
  cd "$srcdir/$_pkgname"
  make test
}

package() {
  set -x

  cd "$srcdir/$_pkgname"
  install -vdm755 "$pkgdir/usr/lib/$_pkgname/plugins"

  cp -vaf plugins "$pkgdir/usr/lib/$_pkgname/plugins"
  chmod -R 755 "$pkgdir/usr/lib/$_pkgname/plugins"

  install -vDm755 -t "$pkgdir/usr/lib/$_pkgname/libexec" libexec/*
  install -vDm644 -t "$pkgdir/usr/lib/$_pkgname/completions" completions/*
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  #install -vDm644 -t "$pkgdir/usr/share/man/man1" share/man/man1/
  install -vdm755 "$pkgdir/usr/bin"

  ln -vs "/usr/lib/$_pkgname/libexec/$_pkgname" \
    "$pkgdir/usr/bin/$_pkgname"

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
