class GitRandomAT2 < Formula
  desc "Create random-content Git commits, for experimentation and learning. Version 2.x"
  homepage "https://github.com/olets/git-random"
  url "https://github.com/olets/git-random/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "96f8fa5d720ae840b50738a0f1ff2888620c98e6632873794241ff7612fc3fe3"
  head "https://github.com/olets/git-random.git", branch: "v2"

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
