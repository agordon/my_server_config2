require 'formula'

class Libee < Formula
  homepage 'http://www.libee.org/'
  url 'http://www.libee.org/download/files/download/libee-0.4.1.tar.gz'
  sha1 '06bcd1be5c60e60a1e8d9a5844b3e9edc76b14e3'

  def install
    ENV.j1
    system "./configure", "--prefix=#{prefix}",
                          "--disable-silent-rules"
    system "make"
    system "make", "install"
  end
end
