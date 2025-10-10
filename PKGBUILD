# Maintainer: Ian Bradley <crabapp@hikki.tech>
pkgname=plenv-git
pkgver=1.4.4.r255.g3f29d0b
pkgrel=10
pkgdesc="Version manager for Perl 5 written in shell script"
arch=(any)
url="https://github.com/tokuhirom/plenv"
license=('GPL')
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=plenv.install
_commit=3f29d0bc29d4d864bb6008808eb2014f83f31430
_perlbuild_commit=e56e4e44816cb1f9912bf560cc8b86bff609da68
source=("git+$url.git#commit=$_commit"
  "git+https://github.com/tokuhirom/Perl-Build.git#commit=$_perlbuild_commit"
  'plenv-init.sh')
sha512sums=('bff48289cf965577203cba674f62a442dba63ff1c8c4ea0691b345f9219677f7a825bb46f451d82e535dfea377556dc410ffb2c4b229ec62d0ad365232cf52f0'
  'de0582f0b10ef3425a026fd7c1c1060840dd379438b576cc00fd9e8b13b544bb0a622f000d7ce327a1b5c739f8b4bf8909062046b8ee7f1b79209b341713ea2f'
  'be688838ca8686e5c90689bf2ab585cef1137c999b48c70b92f67a5c34dc15697b5d11c982ed6d71be1e1e7f7b4e0733884aa97c3f7a339a8ed03577cf74be09')
b2sums=('54c57221a05e11e7fcdc7d1017939c2ef9480e0baa139d06c45597c4a202428d93f77c22e48d1acd02275d643b4855a2d304b30e0cff5bc25aaf10de1a966d9e'
  '2ba24ccd7141b748de94a2dcbb682301e816b1657cc44dfb1203d8287ca19bd22d79c61c60179ecaa42c368d12281405dcdb400af0f07e0fe140cf19e5b7826d'
  'ca6914d2e33b83f2b2c66e4e625bc1d08674fae605008a215165d3c3a997d7d92945905207a539a7327be0f2728fa9aee005da9641407e5f3e4ef55b446b470a')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  (
    set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  git clone ../Perl-Build/ plugins/perl-build
}

check() {
  cd "$srcdir/${pkgname%-git}"
  make test
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -vdm755 "$pkgdir/usr/lib/${pkgname%-git}/plugins"

  cp -vaf plugins "$pkgdir/usr/lib/${pkgname%-git}/plugins"
  chmod -R 755 "$pkgdir/usr/lib/${pkgname%-git}/plugins"

  install -vDm755 -t "$pkgdir/usr/lib/${pkgname%-git}/libexec" libexec/*
  #install -vDm755 -t "$pkgdir/usr/lib/${pkgname%-git}/plugins/perl-build" plugins/perl-build/*
  install -vDm644 -t "$pkgdir/usr/lib/${pkgname%-git}/completions" completions/*
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  #install -vDm644 -t "$pkgdir/usr/share/man/man1" share/man/man1/
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vdm755 "$pkgdir/usr/bin"

  ln -vs "/usr/lib/${pkgname%-git}/libexec/${pkgname%-git}" \
    "$pkgdir/usr/bin/${pkgname%-git}"

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
