class ZshWindowTitle < Formula
  desc "A zsh plugin for informative terminal window titles"
  homepage "https://github.com/olets/zsh-window-title"
  url "https://github.com/olets/zsh-window-title/releases/download/v1.0.0/v1.0.0.tar.gz"
  sha256 "1065bf6fc851de544f942b1de5d5df74b25931025326d59e04aab35324ac9426"
  head "https://github.com/olets/zsh-window-title.git", branch: "main"

  bottle :unneeded

  def install
    pkgshare.install "zsh-window-title.zsh"

    man1.mkpath
    man1.install "man/man1/zwt.1"
  end

  def caveats
    <<~EOS

      To activate zsh-window-title, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/zsh-window-title/zsh-window-title.zsh

      If you prefer to manage the package with Homebrew but load it with
      a plugin manager, use your plugin manager to load the above path
      rather than `source`ing it.

      Then to activate zsh-window-title in already open sessions, restart zsh. Run:

        exec zsh

    EOS
  end

  test do
    assert_match "2",
                 shell_output("zsh -c '. #{pkgshare}/zsh-window-title.zsh && echo $ZSH_WINDOW_TITLE_DIRECTORY_DEPTH_DEFAULT'")
  end
end
