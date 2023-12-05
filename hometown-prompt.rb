class HometownPrompt < Formula
  desc "Feature rich, high performance Git-centric theme for zsh"
  homepage "https://github.com/olets/hometown-prompt"
  url "https://github.com/olets/hometown-prompt/archive/v3.0.0.tar.gz"
  sha256 "c9d8bfd4e5afb7ff92331959b3880d64109454284cf6ceb38fbd178d48d0072a"
  head "https://github.com/olets/hometown-prompt.git", branch: "main"

  def install
    pkgshare.install "hometown.zsh-theme"
  end

  def caveats
    <<~EOS
      To activate this theme, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/hometown-prompt/hometown.zsh-theme

      Then to activate abbreviations in already open sessions, restart
      zsh by running

        exec zsh
    EOS
  end

  test do
    assert_match "1",
                 shell_output("zsh -fic '. #{pkgshare}/hometown.zsh-theme && echo $HOMETOWN_LINEBREAK_AFTER_GIT_REF'")
  end
end
