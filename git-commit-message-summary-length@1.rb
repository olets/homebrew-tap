class GitCommitMessageSummaryLengthAT1 < Formula
  desc "Check the length of a commit message's first line. Version 1.x"
  homepage "https://github.com/olets/git-commit-message-summary-length"
  url "https://github.com/olets/git-commit-message-summary-length/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "455a3bf78ffe1e1fd86f0e03618b355aacf01dd3a947e89f7af3bda215ba1538"
  head "https://github.com/olets/git-commit-message-summary-length.git", branch: "v1"

  def install
    bin.install "git-commit-message-summary-length"

    man1.mkpath
    man1.install "man/man1/git-commit-message-summary-length.1"
  end

  test do
    assert_match "0",
      shell_output("zsh -c 'command -v git-commit-message-summary-length && echo 0'")
  end
end
