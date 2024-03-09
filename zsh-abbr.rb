class ZshAbbr < Formula
  desc "Auto-expanding abbreviations manager for zsh, inspired by fish"
  homepage "https://github.com/olets/zsh-abbr"
  url "https://github.com/olets/zsh-abbr/archive/v5.4.1.tar.gz"
  sha256 "31e129d1881236335cc295bcf5d5872139dbdd3e4079ba08a7d1764027bcc736"
  head "https://github.com/olets/zsh-abbr.git", branch: "next"

  def install
    pkgshare.install "zsh-abbr.zsh"
    pkgshare.install "completions/_abbr"

    man1.mkpath
    man1.install "man/man1/abbr.1"
  end

  def caveats
    <<~EOS

      To activate abbreviations, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/zsh-abbr/zsh-abbr.zsh

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
