class ZshAbbrAT6 < Formula
  desc "Auto-expanding abbreviations manager for zsh, inspired by fish. Version 6.x"
  homepage "https://github.com/olets/zsh-abbr"
  url "https://github.com/olets/zsh-abbr/archive/refs/tags/v6.0.0-beta.1.tar.gz"
  sha256 "70b6ce804b0f97cde35a03cc36851e8831a39e198245c6ec98df41e479877771"
  head "https://github.com/olets/zsh-abbr.git", branch: "v6"
  depends_on "olets/tap/zsh-job-queue"

  def install
    pkgshare.install "zsh-abbr.zsh"
    pkgshare.install "zsh-job-queue"

    man1.mkpath
    man1.install "man/man1/abbr.1"
  end

  def caveats
    <<~EOS

      To activate abbreviations, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/zsh-abbr@6/zsh-abbr.zsh

      If you prefer to manage the package with Homebrew but load it with
      a plugin manager, you may be able to load the above path with your
      plugin manager.

      Then to activate abbreviations in already open sessions, restart
      zsh by running

        exec zsh

      To activate completions for abbr commands, add the following to
      your .zshrc:

        if type brew &>/dev/null; then
          FPATH=$(brew --prefix)/share/zsh-abbr:$FPATH

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

      If you installed with --HEAD, you may now or in the future
      have an unstable version (for example a beta version). Use at your
      own risk. Backing up your abbreviations is recommended.
      To switch to the stable version, first uninstall and then
      (without passing HEAD) reinstall. You can check your version by
      running `abbr --version`.

      You have installed the latest 6.x version of zsh-abbr.
      See https://v6.zsh-abbr.olets.dev for details.
    EOS
  end

  test do
    # test that the program is installed
    assert_match "1",
                 shell_output("zsh -c '. #{pkgshare}/zsh-abbr.zsh && echo $ABBR_DEFAULT_BINDINGS'")

    # test that completions are installed
    (testpath/"test.zsh").write <<~EOS
      fpath=(#{pkgshare} $fpath)
      autoload _ack
      which _ack
    EOS
    assert_match(/^_ack/, shell_output("zsh test.zsh"))
  end
end
