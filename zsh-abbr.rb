class ZshAbbr < Formula
  desc "zsh abbreviations, ported from fish's abbr and enhanced"
  homepage "https://github.com/olets/zsh-abbr"
  url "https://github.com/olets/zsh-abbr/releases/download/v2.1.2/v2.1.2.tar.gz"
  sha256 "cdd5f00c9453eaee1addb069202a90e16a2905233a8c3bb9dc54358785e23f7f"

  bottle :unneeded

  def install
    pkgshare.install "zsh-abbr.zsh"
  end

  def caveats
    <<~EOS
      To activate abbreviations, add the following at the end of your .zshrc:
        source #{HOMEBREW_PREFIX}/share/zsh-abbr/zsh-abbr.zsh
      You will also need to force reload of your .zshrc:
        source ~/.zshrc
    EOS
  end

  test do
    assert_match 'true',
      shell_output("zsh -c '. #{pkgshare}/zsh-abbr.zsh && echo $ZSH_ABBR_DEFAULT_BINDINGS'")
  end
end
