class ZshAbbr4 < Formula
  desc "Auto-expanding abbreviations manager for zsh, inspired by fish. Legacy version."
  homepage "https://github.com/olets/zsh-abbr"
  url "https://github.com/olets/zsh-abbr/releases/download/v4.9.1/v4.9.1.tar.gz"
  sha256 "15846aab8f545d5f75755aeaa0bbb28c401a53fdb4be35b2b121998525c72a62"
  head "https://github.com/olets/zsh-abbr.git", branch: "v4"

  def install
    pkgshare.install "zsh-abbr.zsh"

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

      Then to activate abbreviations in already open sessions, restart zsh. Run:

        exec zsh

      If you installed with --HEAD, you may now or in the future
      have an unstable version (for example a beta version). Use at your
      own risk. Backing up your abbreviations is recommended.
      To switch to the stable version, first uninstall and then
      (without passing HEAD) reinstall. You can check your version by
      running `abbr --version`.

      v4 is a legacy version of zsh-abbr and no longer receives updates.
      Consider upgrading to the latest. See the homepage for details.
    EOS
  end

  test do
    assert_match "1",
                 shell_output("zsh -c '. #{pkgshare}/zsh-abbr.zsh && echo $ZSH_ABBR_DEFAULT_BINDINGS'")
  end
end
