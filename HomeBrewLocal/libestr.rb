require 'formula'

class Libestr < Formula
  homepage 'http://libestr.adiscon.com/'
  url 'http://libestr.adiscon.com/files/download/libestr-0.1.9.tar.gz'
  sha256 '822c6e2d01eaca1e72201f403a2ca01f3e86410b880e508e5204e3c2694d751a'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end
end
