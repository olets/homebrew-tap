class GitPromptKit < Formula
  desc "A configurable set of components for creating feature rich, high performance Git-aware zsh prompts"
  homepage "https://github.com/olets/git-prompt-kit"
  url "https://github.com/olets/git-prompt-kit/releases/download/v2.0.0.tar.gz"
  sha256 "c9acfd6cd761b1cbcd465e7657291526f61747d5cfc19d38fd837282a733e83b"
  head "https://github.com/olets/git-prompt-kit.git", :branch => "main"

  def install
    pkgshare.install "git-prompt-kit.zsh"
  end

  def caveats
    <<~EOS

      To activate Git Prompt Kit, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/git-prompt-kit/git-prompt-kit.zsh

      If you prefer to manage the package with Homebrew but load it with
      a plugin manager, rather than sourcing the above path
      use your plugin manager to load it.

      Then to activate abbreviations in already open sessions, reload .zshrc:

        source ~/.zshrc

    EOS
  end

  test do
    assert_match '1',
      shell_output("zsh -c '. #{pkgshare}/git-prompt-kit.zsh && echo $GIT_PROMPT_KIT_HIDE_INACTIVE_AHEAD_BEHIND'")
  end
end
