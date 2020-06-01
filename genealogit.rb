class Genealogit < Formula
  desc "Genealogy with Git"
  homepage "https://github.com/olets/genealogit"
  url "https://github.com/olets/genealogit/releases/download/v1.1.0/v1.1.0.tar.gz"
  sha256 "489dfc9018ebec8ec128299f205095b07e09a816b67d526ff3536ec8d907619f"
  head "https://github.com/olets/genealogit"

  def install
    inreplace "bin/genealogit", /^CLIENT_HOME=/, "export GENEALOGIT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
  end

  test do
    system bin/"genealogit", "version"
  end
end
