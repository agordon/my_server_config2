require 'formula'

class Liblognorm < Formula
  homepage 'http://www.liblognorm.com/'
  url 'http://www.liblognorm.com/files/download/liblognorm-0.3.7.tar.gz'
  sha256 'b000ab7aab9ed3d7a2c23303463b5bcceb7bb6538714bd41248d02913a82e223'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end
end
