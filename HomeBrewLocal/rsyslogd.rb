require 'formula'

class Rsyslogd < Formula
  homepage 'http://www.rsyslog.com'
  url 'http://www.rsyslog.com/files/download/rsyslog/rsyslog-7.5.8.tar.gz'
  sha256 '38a8b5be53feaae9225e46f2c93d7cc87954ead58ac9526ffc63de71f3d4a542'

  def install
    ENV.j1
    system "./configure", "--prefix=#{prefix}",
                          "--disable-silent-rules",
                         "--enable-regexp",
                         "--enable-zlib",
                         "--enable-inet",
                         "--enable-unlimited-select",
                         "--enable-usertools",
                         "--enable-uuid",
                         "--enable-gnutls",
                         "--enable-mail",
                         "--enable-mmnormalize",
                         "--enable-mmjsonparse",
                         "--enable-relp",
                         "--enable-imfile",
                         "--enable-imptcp",
                         "--enable-imttcp",
                         "--enable-impstats",
                         "--enable-omstdout",
                         "--enable-omruleset"

    system "make"
    system "make", "install"
  end
end
