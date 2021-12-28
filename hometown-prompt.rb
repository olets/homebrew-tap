class HometownPrompt < Formula
  desc "A feature rich, high performance Git-aware zsh theme"
  homepage "https://github.com/olets/hometown-prompt"
  url "https://github.com/olets/hometown-prompt/releases/download/v1.0.0.tar.gz"
  sha256 "d8a229a628d7d9a7266ac7da7fd2d4eb59f4dfc8be2059a8d5d2b938e365d26d"
  head "https://github.com/olets/hometown-prompt.git", :branch => "main"

  def install
    pkgshare.install "hometown-prompt.zsh"
  end

  def caveats
    <<~EOS

      To activate Hometown Prompt, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/hometown-prompt/hometown-prompt.zsh

      If you prefer to manage the package with Homebrew but load it with
      a plugin manager, rather than sourcing the above path
      use your plugin manager to load it.

      Then to activate abbreviations in already open sessions, reload .zshrc:

        source ~/.zshrc

    EOS
  end

  test do
    assert_match '1',
      shell_output("zsh -c '. #{pkgshare}/hometown-prompt.zsh && echo $GIT_PROMPT_KIT_HIDE_INACTIVE_AHEAD_BEHIND'")
  end
end
