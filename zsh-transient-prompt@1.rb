class ZshTransientPromptAT1 < Formula
  desc "Add a transient prompt to your zsh command line. Version 1.x"
  homepage "https://codeberg.org/olets/zsh-transient-prompt"
  url "https://codeberg.org/olets/zsh-transient-prompt/archive/v1.0.1.tar.gz"
  sha256 "5d3a30e79bdec272db307f156a8e498d875d8b2464760d4c93dd283840face84"
  head "https://codeberg.org/olets/zsh-transient-prompt.git", branch: "v1"

  def install
    pkgshare.install "zsh-transient-prompt.zsh-theme"
  end

  def caveats
    <<~EOS

      To activate zsh-transient-prompt, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/zsh-transient-prompt/zsh-transient-prompt.zsh-theme

      If you prefer to manage the package with Homebrew but load it with
      a plugin manager, you may be able to load the above path with your
      plugin manager.

      Then restart zsh. Run:

        exec zsh

      You have installed the 1.x version of zsh-transient-prompt.

      Refer to https://zsh-transient-prompt.olets.dev for more information,
      including how to switch to the 'latest' channel.

    EOS
  end

  test do
    assert_match "0",
      shell_output("zsh -c '. #{pkgshare}/zsh-transient-prompt.zsh-theme && [[ -n $TRANSIENT_PROMPT_VERSION ]]; echo $?'")
  end
end
