class GitRandom < Formula
  desc "Create random-content Git commits, for experimentation and learning"
  homepage "https://github.com/olets/git-random"
  url "https://github.com/olets/git-random/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "0b06d4c1dfb6fed05baae0696190e2520e19ce5ea8b2b750cbb01fff9b355808"
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
