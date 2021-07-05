class GitReplay < Formula
  desc "Automate the rebasing of Git branches and creation of stage branches"
  homepage "https://github.com/olets/git-replay"
  url "https://github.com/olets/git-replay/releases/download/v3.0.0/v3.0.0.tar.gz"
  sha256 "6f4dbcd92b85fa75b57369f287f87ed8b8ec7a891a5d8b43fdf785c2154ba7be"
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
