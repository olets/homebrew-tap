class GitRandom < Formula
  desc "Automate the rebasing of Git branches and creation of stage branches"
  homepage "https://github.com/olets/git-random"
  url "https://github.com/olets/git-random/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "7fdc47743d5bbe68951069f43c0f241e0ee23551a2d2339698a04f28aa736739"
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
