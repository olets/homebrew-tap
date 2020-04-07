class ZshAbbr < Formula
  desc "zsh abbreviations, ported from fish's abbr and enhanced"
  homepage "https://github.com/olets/zsh-abbr"
  url "https://github.com/olets/zsh-abbr/releases/download/v3.2/v3.2.tar.gz"
  sha256 "c9d83217e35312e698e94c0d561fa2ad5290e14df81fc888968c8cc530a8fbc8"
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
    assert_match 'true',
      shell_output("zsh -c '. #{pkgshare}/zsh-abbr.zsh && echo $ZSH_ABBR_DEFAULT_BINDINGS'")
  end
end
