class ZshAbbr < Formula
  desc "Auto-expanding abbreviations manager for zsh, inspired by fish"
  homepage "https://github.com/olets/zsh-abbr"
  url "https://github.com/olets/zsh-abbr/releases/download/v4.8.4/v4.8.4.tar.gz"
  sha256 "906301a06ec3368ca53534b84d24a145c186aaccddd7fd25cd82734995057cca"
  head "https://github.com/olets/zsh-abbr.git", branch: "next"

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
    EOS
  end

  test do
    assert_match "1",
                 shell_output("zsh -c '. #{pkgshare}/zsh-abbr.zsh && echo $ZSH_ABBR_DEFAULT_BINDINGS'")
  end
end
