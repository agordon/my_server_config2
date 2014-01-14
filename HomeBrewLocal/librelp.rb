require 'formula'

class Librelp < Formula
  homepage 'http://www.librelp.com/'
  url 'http://download.rsyslog.com/librelp/librelp-1.2.2.tar.gz'
  sha256 'f02778d9661c4746be9c16338991e99a482e4a0018f2220e7d9da18791265f48'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
