class GitReplay < Formula
  desc "Automate the rebasing of Git branches and creation of stage branches"
  homepage "https://github.com/olets/git-replay"
  url "https://github.com/olets/git-replay/releases/download/v2.2.1/v2.2.1.tar.gz"
  sha256 "36fa3fb0ffe4399216a4b9e5fd558478f43caf13cee9e8b22adbafeb97260e10"
  head "https://github.com/olets/git-replay.git", branch: "main"

  bottle :unneeded
  depends_on "yq"

  def install
    bin.install "git-replay"

    man1.mkpath
    man1.install "man/man1/git-replay.1"
  end

  test do
    assert_match "0",
      shell_output("zsh -c 'command -v git-replay && echo 0'")
  end
end
