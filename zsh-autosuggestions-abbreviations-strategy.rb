class ZshAutosuggestionsAbbreviationsStrategy < Formula
  desc "Zsh plugin to add zsh-abbr's abbreviations to zsh-autosuggestions' suggestions"
  homepage "https://github.com/olets/zsh-autosuggestions-abbreviations-strategy"
  url "https://github.com/olets/zsh-autosuggestions-abbreviations-strategy/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "111e40bd08c5229395dab3522e616a9798246a4792dadd3789a519bdbfa83fe9"
  head "https://github.com/olets/zsh-autosuggestions-abbreviations-strategy.git", branch: "main"

  def install
    pkgshare.install "zsh-autosuggestions-abbreviations-strategy.zsh"
  end

  def caveats
    <<~EOS

      To activate zsh-autosuggestions-abbreviations-strategy, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/zsh-autosuggestions-abbreviations-strategy/zsh-autosuggestions-abbreviations-strategy.zsh

      If you prefer to manage the package with Homebrew but load it with
      a plugin manager, you may be able to load the above path with your
      plugin manager.

      Then add the "abbreviations" strategy to ZSH_AUTOSUGGEST_STRATEGY.
      See the homepage for possibilities. For example, in .zshrc

        # load zsh-abbr
        # load zsh-autosuggestions
        # load zsh-autosuggestions-abbreviation-strategy
        ZSH_AUTOSUGGEST_STRATEGY=( abbreviations $ZSH_AUTOSUGGEST_STRATEGY )

      Then restart zsh. Run:

        exec zsh

    EOS
  end

  test do
    assert_match "y",
      shell_output("zsh -c '. #{pkgshare}/zsh-autosuggestions-abbreviations-strategy.zsh && \
        ${ZSH_AUTOSUGGESTIONS_ABBREVIATIONS_STRATEGY_VERSION:+y}'")
  end
end
