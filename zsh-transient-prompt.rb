class ZshTransientPrompt < Formula
  desc "Add a transient prompt to your zsh command line"
  homepage "https://codeberg.org/olets/zsh-transient-prompt"
  url "https://codeberg.org/olets/zsh-transient-prompt/archive/v1.0.1.tar.gz"
  sha256 "5d3a30e79bdec272db307f156a8e498d875d8b2464760d4c93dd283840face84"
  head "https://codeberg.org/olets/zsh-transient-prompt.git", branch: "main"

  def install
    pkgshare.install "transient-prompt.zsh-theme"
  end

  def caveats
    <<~EOS

      To activate zsh-transient-prompt, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/zsh-transient-prompt/transient-prompt.zsh-theme

      If you prefer to manage the package with Homebrew but load it with
      a plugin manager, you may be able to load the above path with your
      plugin manager.

      Then restart zsh. Run:

        exec zsh

      You have installed the latest version of zsh-transient-prompt.

      Refer to https://zsh-transient-prompt.olets.dev for more information,
      including how to pin to version 1.x.

    EOS
  end

  test do
    assert_match "0",
      shell_output("zsh -c '. #{pkgshare}/transient-prompt.zsh-theme && [[ -n $TRANSIENT_PROMPT_VERSION ]]; echo $?'")
  end
end
