class CommandExecutionTimer < Formula
  desc "A zsh plugin for timing, working with, and displaying the time an interactive shell command takes to execute."
  homepage "https://github.com/olets/command-execution-timer"
  url "https://github.com/olets/command-execution-timer/releases/download/v1.0.1.tar.gz"
  sha256 "71a837305e34ccbc15e9384992257857e78cdc30bbb7b2372f0f62dfe2f66dd4"
  head "https://github.com/olets/command-execution-timer.git", :branch => "main"

  def install
    pkgshare.install "command-execution-timer.zsh"
  end

  def caveats
    <<~EOS

      To activate Command Execution Timer, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/command-execution-timer/command-execution-timer.zsh

      If you prefer to manage the package with Homebrew but load it with
      a plugin manager, you may be able to load the above path with your
      plugin manager.

      Then restart zsh. Run:

        exec zsh

    EOS
  end

  test do
    assert_match '3',
      shell_output("zsh -c '. #{pkgshare}/command-execution-timer.zsh && echo $COMMAND_EXECUTION_TIMER_THRESHOLD'")
  end
end
