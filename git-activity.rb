class GitActivity < Formula
  desc "Record and show your Git activity across multiple repos, optionally filtered"
  homepage "https://github.com/olets/git-activity"
  url "https://github.com/olets/git-activity/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "7218c205874e2903d664f623226a18353fd6e3e36bc10cbdbdd212acfe58bb79"
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
