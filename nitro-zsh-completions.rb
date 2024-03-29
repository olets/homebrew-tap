class NitroZshCompletions < Formula
  desc "Zsh completions for https://github.com/craftcms/nitro"
  homepage "https://github.com/olets/nitro-zsh-completions"
  url "https://github.com/olets/nitro-zsh-completions/releases/download/v1.1.0/v1.1.0.tar.gz"
  sha256 "b11ee3a3012880e615fe8cabbe012cdc6bcf750f07939af922fb62fed06144bc"
  head "https://github.com/olets/nitro-zsh-completions.git", branch: "main"

  def install
    pkgshare.install "completions/_nitro"
  end

  def caveats
    <<~EOS
      To activate these completions, add the following to your .zshrc:
        if type brew &>/dev/null; then
          FPATH=$(brew --prefix)/share/nitro-zsh-completions:$FPATH
          autoload -Uz compinit
          compinit
        fi

      You may also need to force rebuild `zcompdump`:

        rm -f ~/.zcompdump; compinit

      Additionally, if you receive "zsh compinit: insecure directories"
      warnings when attempting to load these completions, you may need
      to run this:

        chmod -R go-w '#{HOMEBREW_PREFIX}/share/zsh'
    EOS
  end

  test do
    (testpath/"test.zsh").write <<~EOS
      fpath=(#{pkgshare} $fpath)
      autoload _ack
      which _ack
    EOS
    assert_match(/^_ack/, shell_output("/bin/zsh test.zsh"))
  end
end
