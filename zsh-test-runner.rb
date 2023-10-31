class ZshTestRunner < Formula
  desc "Straight-forward tests and coverage reports for zsh"
  homepage "https://github.com/olets/zsh-test-runner"
  url "https://github.com/olets/zsh-test-runner/releases/download/v2.0.0/v2.0.0.tar.gz"
  sha256 "4395bad5800a8ebccf2054cb2a65b15c55b4f7d8c239ca6e917f61a9271a0c65"
  head "https://github.com/olets/zsh-test-runner.git", branch: "main"

  def install
    pkgshare.install "ztr.zsh"
    pkgshare.install "completions/_ztr"

    man1.mkpath
    man1.install "man/man1/ztr.1"
  end

  def caveats
    <<~EOS

      To activate ztr, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/zsh-test-runner/ztr.zsh

      If you prefer to manage the package with Homebrew but load it with
      a plugin manager, you may be able to load the above path with your
      plugin manager.

      Then to make ztr available in already open sessions, restart zsh:

        exec zsh

      To activate completions for ztr commands, add the following to
      your .zshrc:

        if type brew &>/dev/null; then
          FPATH=$(brew --prefix)/share/zsh-test-runner:$FPATH

          autoload -Uz compinit
          compinit
        fi

      You may also need to force rebuild `zcompdump`:

        rm -f ~/.zcompdump; compinit

      Additionally, if you receive "zsh compinit: insecure directories"
      warnings when attempting to load these completions, you may need
      to run these commands:

        chmod go-w '#{HOMEBREW_PREFIX}/share'
        chmod -R go-w '#{HOMEBREW_PREFIX}/share/zsh'

    EOS
  end

  test do
    # test that the program is installed
    assert_match "0",
                 shell_output("zsh -c '. #{pkgshare}/ztr.zsh && echo $ZTR_COUNT_PASS'")

    # test that completions are installed
    (testpath/"test.zsh").write <<~EOS
      fpath=(#{pkgshare} $fpath)
      autoload _ack
      which _ack
    EOS
    assert_match(/^_ack/, shell_output("zsh test.zsh"))
  end
end
