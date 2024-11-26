class GitActivity < Formula
  desc "Record and show your Git activity across multiple repos, optionally filtered"
  homepage "https://github.com/olets/git-activity"
  url "https://github.com/olets/git-activity/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "8853acc7f6f8523b8afa05a5a2129dbc422ca343c8f699639e22988cafcbd948"
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
