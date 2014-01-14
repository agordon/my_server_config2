require 'formula'

class Libjsonc < Formula
  homepage 'https://github.com/json-c/json-c/wiki'
  head 'https://github.com/json-c/json-c', :using => :git
  url 'https://s3.amazonaws.com/json-c_releases/releases/json-c-0.11.tar.gz'
  sha256 '28dfc65145dc0d4df1dfe7701ac173c4e5f9347176c8983edbfac9149494448c'

  if build.head?
    depends_on :autoconf => :build
    depends_on :automake => :build
  end
  depends_on :libtool => :build

  def install
    ENV.j1
    if build.head?
      system "./autogen.sh"
    end

    system "./configure", "--prefix=#{prefix}",
                          "--disable-silent-rules"
    system "make"
    system "make", "install"
  end
end
