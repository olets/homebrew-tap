class ZshJobQueueAT1 < Formula
  desc "Zsh global synchronous job queue plugin. Version 1.x"
  homepage "https://github.com/olets/zsh-job-queue"
  url "https://github.com/olets/zsh-job-queue/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f0cdfeee0b2258857d3e3bcf5be6a1210810094e8d441abc71bfeb0005aa5bc0"
  head "https://github.com/olets/zsh-job-queue.git", branch: "v1"

  def install
    pkgshare.install "zsh-job-queue.zsh"

    man1.mkpath
    man1.install "man/man1/job-queue.1"
  end

  def caveats
    <<~EOS

      To activate zsh-job-queue, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/zsh-job-queue/zsh-job-queue.zsh

      If you prefer to manage the package with Homebrew but load it with
      a plugin manager, you may be able to load the above path with your
      plugin manager.

      Then restart zsh. Run:

        exec zsh

      You have installed the latest 1.x version of zsh-job-queue.

      Refer to https://zsh-job-queue.olets.dev for more information,
      including whether there a newer major version is available
      and how to pin a specific major version.

    EOS
  end

  test do
    assert_match "0",
      shell_output("zsh -c '. #{pkgshare}/zsh-job-queue.zsh && [[ -n $JOB_QUEUE_DEBUG ]]; echo $?'")
  end
end
