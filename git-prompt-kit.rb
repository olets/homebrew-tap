class GitPromptKit < Formula
  desc "Configurable, feature rich, high performance Git components for zsh themes"
  homepage "https://github.com/olets/git-prompt-kit"
  # using url with tag and revision to resolve submodules
  # https://github.com/orgs/Homebrew/discussions/2100
  url "https://github.com/olets/git-prompt-kit.git",
      tag:      "v4.1.2",
      revision: "f5979bb812ebeb615e3f1ffe48347b8cb82bb2ff"
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
