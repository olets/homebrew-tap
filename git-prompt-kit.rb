class GitPromptKit < Formula
  desc "Use Git Prompt Kit for its accelerated configurable Git-focused zsh prompt, or as component kit for building a custom prompt"
  homepage "https://github.com/olets/git-prompt-kit"
  url "https://github.com/olets/git-prompt-kit/releases/download/v1.0.0.tar.gz"
  sha256 "f8ffd516981dd2e09a5334abb9a528b0595acde329197b5e46340e1645813fc2"
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
      shell_output("zsh -c '. #{pkgshare}/git-prompt-kit.zsh && echo $GIT_PROMPT_KIT_USE_DEFAULT_PROMPT'")
  end
end
