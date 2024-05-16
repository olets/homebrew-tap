class ZshWindowTitle < Formula
  desc "Zsh plugin for informative terminal window titles"
  homepage "https://github.com/olets/zsh-window-title"
  url "https://github.com/olets/zsh-window-title/archive/refs/tags/v1.1.3.tar.gz"
  sha256 "dc7e21fd207990509093f46e188c8ae327099d3b982aed3ad3f86f1ac4e9d159"
  head "https://github.com/olets/zsh-window-title.git", branch: "main"

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
      a plugin manager, you may be able to load the above path with your
      plugin manager.

      Then to activate zsh-window-title in already open sessions, restart zsh. Run:

        exec zsh

    EOS
  end

  test do
    assert_match "2",
      shell_output("zsh -c '. #{pkgshare}/zsh-window-title.zsh && echo $ZSH_WINDOW_TITLE_DIRECTORY_DEPTH_DEFAULT'")
  end
end
