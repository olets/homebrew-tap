class GitActivity < Formula
  desc "Record and show your Git activity across multiple repos, optionally filtered"
  homepage "https://github.com/olets/git-activity"
  url "https://github.com/olets/git-activity/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "92ffbafd7800161d82febedede55cbef3b4a68bb6b3e75d6b7e35f11d7bbaca7"
  head "https://github.com/olets/git-activity.git", branch: "main"

  depends_on "awk"
  depends_on "coreutils"

  def install
    bin.install "git-activity"

    man1.mkpath
    man1.install "man/man1/git-activity.1"
  end

  test do
    assert_match "0",
      shell_output("zsh -c 'command -v git-activity && echo 0'")
  end
end
