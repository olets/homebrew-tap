class CommandExecutionTimer < Formula
  desc "Zsh plugin for timing interactive shell commands"
  homepage "https://github.com/olets/command-execution-timer"
  url "https://github.com/olets/command-execution-timer/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "cb8017c011d55e649b9eaecc73c0dcd7747c088291be2200de4906697497f01a"
  head "https://github.com/olets/command-execution-timer.git", branch: "main"

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

      You have installed the latest version of Command Execution Timer. It
      is possible that you were upgraded to a different major version. To
      check your version, run:

        echo $COMMAND_EXECUTION_TIMER_VERSION

      Refer to https://github.com/olets/command-execution-timer/blob/main/CHANGELOG.md
      for the latest changes and instructions.

      Refer to https://command-execution-timer.vercel.app/installation.html
      for instuctions on pinning this major version or downgrading.

    EOS
  end

  test do
    assert_match "01:00",
      shell_output("zsh -c '. #{pkgshare}/command-execution-timer.zsh && \
        COMMAND_EXECUTION_TIMER_FORMAT=H:M:S command_execution_timer__format 60'")
  end
end
