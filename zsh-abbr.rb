class ZshAbbr < Formula
  desc "zsh abbreviations, ported from fish's abbr and enhanced"
  homepage "https://github.com/olets/zsh-abbr"
  url "https://github.com/olets/zsh-abbr/releases/download/v3.0.2/v3.0.2.tar.gz"
  sha256 "98aefd8f12c2fbf2c896d4459dbc2be6182a1359a5c0901392755ee92e76f58a"

  bottle :unneeded

  def install
    pkgshare.install "zsh-abbr.zsh"
  end

  def caveats
    <<~EOS
      To activate abbreviations, add the following at the end of your .zshrc:
        source #{HOMEBREW_PREFIX}/share/zsh-abbr/zsh-abbr.zsh
      Then to activate abbreviations in already open sessions, reload .zshrc:
        source ~/.zshrc
    EOS
  end

  test do
    assert_match 'true',
      shell_output("zsh -c '. #{pkgshare}/zsh-abbr.zsh && echo $ZSH_ABBR_DEFAULT_BINDINGS'")
  end
end
