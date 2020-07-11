class GitPromptKit < Formula
  desc "A zsh plugin for timing, working with, and displaying the time an interactive shell command takes to execute."
  homepage "https://github.com/olets/command-execution-timer"
  url "https://github.com/olets/command-execution-timer/releases/download/v1.0.0.tar.gz"
  sha256 "39af92c2747aa68d6e30e2907a1042f3485932aaa39d9b6877d444d263c0a318"
  head "https://github.com/olets/command-execution-timer.git", :branch => "main"

  bottle :unneeded

  def install
    pkgshare.install "command-execution-timer.zsh"
  end

  def caveats
    <<~EOS

      To activate Command Execution Timer, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/command-execution-timer/command-execution-timer.zsh

      If you prefer to manage the package with Homebrew but load it with
      a plugin manager, rather than sourcing the above path
      use your plugin manager to load it.

      Then to activate abbreviations in already open sessions, reload .zshrc:

        source ~/.zshrc

    EOS
  end

  test do
    assert_match '3',
      shell_output("zsh -c '. #{pkgshare}/command-execution-timer.zsh && echo $COMMAND_EXECUTION_TIMER_THRESHOLD'")
  end
end
