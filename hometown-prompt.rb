class HometownPrompt < Formula
  desc "Feature rich, high performance Git-centric theme for zsh"
  homepage "https://github.com/olets/hometown-prompt"
  # using url with tag and revision to resolve submodules
  # https://github.com/orgs/Homebrew/discussions/2100
  url "https://github.com/olets/hometown-prompt.git",
      tag:      "v3.1.5",
      revision: "1fb3cb3665c5ae1465d5463abdabca6ca14a0b9f"
  head "https://github.com/olets/hometown-prompt.git", branch: "main"

  def install
    pkgshare.install "hometown.zsh-theme"
    pkgshare.install "git-prompt-kit"
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
