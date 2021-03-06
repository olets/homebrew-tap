class ZshAbbr < Formula
  desc "Auto-expanding abbreviations manager for zsh, inspired by fish"
  homepage "https://github.com/olets/zsh-abbr"
  url "https://github.com/olets/zsh-abbr/releases/download/v4.3.0/v4.3.0.tar.gz"
  sha256 "c0038b47b60d9326f8c2e0c25f79e5b4330a1cd49a992b9838dea9c65b5ee8fc"
  head "https://github.com/olets/zsh-abbr.git", branch: "main"

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
