class GitActivityAT1 < Formula
  desc "Record and show your Git activity across multiple repos, optionally filtered. Version 1.x"
  homepage "https://github.com/olets/git-activity"
  url "https://github.com/olets/git-activity/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "388a5c9218180687dd73dfcf0b40a74dd24671e45c48973c4b9f06a484bda58b"
  head "https://github.com/olets/git-activity.git", branch: "v1"

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
