class GitRandom < Formula
  desc "Automate the rebasing of Git branches and creation of stage branches"
  homepage "https://github.com/olets/git-random"
  url "https://github.com/olets/git-random/archive/refs/tags/v1.0.0-beta.2.tar.gz"
  sha256 "84e3c6acd071782dd00b6ee0b32af39ef3497cc0e678cff7deb3f52ee86b766d"
  head "https://github.com/olets/git-random.git", branch: "main"

  def install
    bin.install "git-random"

    man1.mkpath
    man1.install "man/man1/git-random.1"
  end

  test do
    assert_match "0",
      shell_output("zsh -c 'command -v git-random && echo 0'")
  end
end
