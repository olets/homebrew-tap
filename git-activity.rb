class GitActivity < Formula
  desc "Record and show your Git activity across multiple repos, optionally filtered"
  homepage "https://github.com/olets/git-activity"
  url "https://github.com/olets/git-activity/archive/refs/tags/v1.0.0-beta.1.tar.gz"
  sha256 "90767a260971b45ab220063c18248a539645347ec30f094c3deda4f96f15e054"
  head "https://github.com/olets/git-activity.git", branch: "main"

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
