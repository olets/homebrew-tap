class GitReplay < Formula
  desc "Automate the rebasing of Git branches and creation of stage branches"
  homepage "https://github.com/olets/git-replay"
  url "https://github.com/olets/git-replay/releases/download/v3.0.0-beta/v3.0.0-beta.tar.gz"
  sha256 "b22023d7c1df1c4552f705523200904231a6e7850ca80450f55815084e96bb5b"
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
