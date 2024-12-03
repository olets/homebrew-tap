class GitCommitMessageSummaryLengthAT1 < Formula
  desc "Check the length of a commit message's first line. Version 1.x"
  homepage "https://github.com/olets/git-commit-message-summary-length"
  url ""
  sha256 ""
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
