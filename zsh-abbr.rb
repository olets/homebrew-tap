class ZshAbbr < Formula
  desc "The zsh manager for auto-expanding abbreviations, inspired by fish"
  homepage "https://github.com/olets/zsh-abbr"
  url "https://github.com/olets/zsh-abbr/releases/download/v3.3.4/v3.3.4.tar.gz"
  sha256 "8324f32c975489146d60b92fb4668ee3d067186aacea17767efc85fb68a43a72"
  head "https://github.com/olets/zsh-abbr.git", :branch => "master"

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
      a plugin manager, use your plugin manager to load the above path
      rather than `source`ing it.

      Then to activate abbreviations in already open sessions, restart zsh:

        exec zsh

    EOS
  end

  test do
    assert_match "1",
      shell_output("zsh -c '. #{pkgshare}/zsh-abbr.zsh && echo $ZSH_ABBR_DEFAULT_BINDINGS'")
  end
end
