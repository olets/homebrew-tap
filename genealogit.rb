class Genealogit < Formula
  desc "Genealogy with Git"
  homepage "https://github.com/olets/genealogit"
  url "https://github.com/olets/genealogit/archive/v1.0.1.tar.gz"
  sha256 "ad525166170044048814211fb36d0d2dade6c22d53b5baaca0326aa06b313d8e"
  head "https://github.com/olets/genealogit"

  def install
    inreplace "bin/genealogit", /^CLIENT_HOME=/, "export GENEALOGIT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
  end

  test do
    system bin/"genealogit", "version"
  end
end
