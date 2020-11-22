class GitReplay < Formula
  desc "Automate the rebasing of Git branches and creation of stage branches"
  homepage "https://github.com/olets/git-replay"
  url "https://github.com/olets/git-replay/releases/download/v2.2.0/v2.2.0.tar.gz"
  sha256 "aea8ff9065de78ea25d4f127b1f03d6c8dbe8816b48f0c258a4bc21a8de3183b"
  head "https://github.com/olets/git-replay.git", branch: "main"

  bottle :unneeded
  depends_on "yq"

  def install
    bin.install "git-replay"

    man1.mkpath
    man1.install "man/man1/abbr.1"
  end

  test do
    assert_match "0",
      shell_output("zsh -c 'command -v git-replay && echo 0'")
  end
end
