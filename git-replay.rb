class GitReplay < Formula
  desc "Automate the rebasing of Git branches and creation of stage branches"
  homepage "https://github.com/olets/git-replay"
  url "https://github.com/olets/git-replay/releases/download/v3.1/v3.1.tar.gz"
  sha256 "4e1905dc30b95b1443a0a2211563b232474709bc26c80abebbb5de4b6060ca59"
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
