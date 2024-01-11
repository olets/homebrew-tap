class GitRandom < Formula
  desc "Automate the rebasing of Git branches and creation of stage branches"
  homepage "https://github.com/olets/git-random"
  url "https://github.com/olets/git-random/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a52405b8e5f159a8f369ba4b573c0c4affb957fc84738555209cdce32b57a3ac"
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
