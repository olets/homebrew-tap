class ZshTestRunner < Formula
  desc "Straight-forward tests and coverage reports for zsh"
  homepage "https://github.com/olets/zsh-test-runner"
  url "https://github.com/olets/zsh-test-runner/releases/download/v1.2.0/v1.2.0.tar.gz"
  sha256 "2495aeee8a17a4ca8a9decb90616b3084368cb41d301eb452ddaacdb64a0acea"
  head "https://github.com/olets/zsh-test-runner.git", branch: "main"

  def install
    pkgshare.install "ztr.zsh"

    man1.mkpath
    man1.install "man/man1/ztr.1"
  end

  def caveats
    <<~EOS

      To activate ztr, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/zsh-test-runner/ztr.zsh

      If you prefer to manage the package with Homebrew but load it with
      a plugin manager, use your plugin manager to load the above path
      rather than `source`ing it.

      Then to make ztr available in already open sessions, restart zsh:

        exec zsh

    EOS
  end

  test do
    assert_match "0",
                 shell_output("zsh -c '. #{pkgshare}/ztr.zsh && echo $ZTR_COUNT_PASS'")
  end
end
