class ZshAbbr < Formula
  desc "zsh abbreviations, ported from fish's abbr and enhanced"
  homepage "https://github.com/olets/zsh-abbr"
  url "https://github.com/olets/zsh-abbr/releases/download/next/v3.1.1.b1.tar.gz"
  sha256 "25a29e880421c9f62c1cda7b821052ed42a2f20931bfac11238d8a034b28385e"

  bottle :unneeded

  def install
    pkgshare.install "zsh-abbr.zsh"

    man1.mkpath
    man1.install "man/man1/zsh-abbr.1"
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
