class ZshAbbr < Formula
  desc "An enhanced zsh port of fish shell's abbreviations"
  homepage "https://github.com/olets/zsh-abbr"
  url "https://github.com/olets/zsh-abbr/releases/download/v1.2.0/v1.2.0.tar.gz"
  sha256 "c8af8c18b12a7742f65888de9a421ed7d7e73b2f896cd8c2f105e5de766c8799"

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
      shell_output("zsh -c '. #{pkgshare}/zsh-abbr.zsh && echo $ABBRS_DEFAULT_BINDINGS'")
  end
end
