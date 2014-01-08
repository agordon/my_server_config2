require 'formula'
##
## installs the latest GNU CoreUtils from source.
## Does not add the "g" prefix (like the official homebrew does),
## because linuxes use GNU CoreUtils by default (this will simply be an upgrade).
## while MacOS uses BSD's coreutils by default (and so there could be some conflicts).
##
class Coreutils < Formula
  homepage 'http://www.gnu.org/software/coreutils'
  url 'http://ftp.gnu.org/gnu/coreutils/coreutils-8.22.tar.xz'
  sha1 'cc7fe47b21eb49dd2ee4cdb707570f42fb2c8cc6'

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--without-gmp"
    system "make install"
  end
end
