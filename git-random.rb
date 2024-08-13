class GitRandom < Formula
  desc "Create random-content Git commits, for experimentation and learning"
  homepage "https://github.com/olets/git-random"
  url "https://github.com/olets/git-random/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "2f73e1102a7d071c8b22fe5f78511f8c156b8c27ec3a7e5945659097d915c8e8"
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
