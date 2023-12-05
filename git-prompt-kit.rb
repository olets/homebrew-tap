class GitPromptKit < Formula
  desc "configurable set of components for creating feature rich, high performance Git-aware zsh themes"
  homepage "https://github.com/olets/git-prompt-kit"
  # using url with tag and revision to resolve submodules
  # https://github.com/orgs/Homebrew/discussions/2100
  url "https://github.com/olets/git-prompt-kit.git",
      tag:      "v4.0.0",
      revision: "51ae891f018925be9941d00f72e263a2bfa27351"
  head "https://github.com/olets/git-prompt-kit.git", branch: "next"

  def install
    pkgshare.install "git-prompt-kit.zsh"
    pkgshare.install "gitstatus"
  end

  def caveats
    <<~EOS
      To activate this theme, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/git-prompt-kit/git-prompt-kit.zsh

      Then to activate abbreviations in already open sessions, restart
      zsh by running

        exec zsh
    EOS
  end

  test do
    assert_match "1",
                 shell_output("zsh -fic '. #{pkgshare}/git-prompt-kit.zsh && echo $GIT_PROMPT_KIT_HIDE_INACTIVE_AHEAD_BEHIND'")
  end
end
