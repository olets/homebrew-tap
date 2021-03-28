class ZshTestRunner < Formula
  desc "Straight-forward tests and coverage reports for zsh"
  homepage "https://github.com/olets/zsh-test-runner"
  url "https://github.com/olets/zsh-test-runner/releases/download/v1.1.1/v1.1.1.tar.gz"
  sha256 "017d27085b28af5b89cdca13743cfabedf790ea9289368c3828660b074ecd956"
  head "https://github.com/olets/zsh-test-runner.git", branch: "main"

  bottle :unneeded

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

      Then to activate abbreviations in already open sessions, restart zsh:

        exec zsh

    EOS
  end

  test do
    assert_match "0",
                 shell_output("zsh -c '. #{pkgshare}/ztr.zsh && echo $ZTR_COUNT_PASS'")
  end
end
