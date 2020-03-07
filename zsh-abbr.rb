class ZshAbbr < Formula
  desc "zsh abbreviations, ported from fish's abbr and enhanced"
  homepage "https://github.com/olets/zsh-abbr"
  url "https://github.com/olets/zsh-abbr/releases/download/v3.1.0/v3.1.0.tar.gz"
  sha256 "fbf7b4f8298755f29f63ff29f40cc61a59d55e6d1d263c30f4d8027fb6c4cef7"

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
