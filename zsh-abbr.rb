class ZshAbbr < Formula
  desc "zsh abbreviations, ported from fish's abbr and enhanced"
  homepage "https://github.com/olets/zsh-abbr"
  url "https://github.com/olets/zsh-abbr/releases/download/v3.2.3/v3.2.3.tar.gz"
  sha256 "f42f7ad3e8faa2a4fb8bdfa8c45a8e85f53acd4c82580d25936c3c143a9238c9"
  head "https://github.com/olets/zsh-abbr.git"

  bottle :unneeded

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
      a plugin manager, rather than sourcing the above path
      use your plugin manager to load it.

      Then to activate abbreviations in already open sessions, reload .zshrc:

        source ~/.zshrc

    EOS
  end

  test do
    assert_match '1',
      shell_output("zsh -c '. #{pkgshare}/zsh-abbr.zsh && echo $ZSH_ABBR_DEFAULT_BINDINGS'")
  end
end
