class ZshAutosuggestionsAbbreviationsStrategy < Formula
  desc "Zsh plugin to add your zsh-abbr abbreviations to zsh-autosuggestions' suggestions"
  homepage "https://github.com/olets/zsh-autosuggestions-abbreviations-strategy"
  url "https://github.com/olets/zsh-autosuggestions-abbreviations-strategy/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "8a3c1285fb3b0a52864028755ce3401403a60716a648e30fcb10b2557698fa64"
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
        ZSH_AUTOSUGGEST_STRATEGY+=( abbreviations )
        
      Then restart zsh. Run:

        exec zsh

    EOS
  end

  test do
    assert_match "2",
      shell_output("zsh -c '. #{pkgshare}/zsh-autosuggestions-abbreviations-strategy.zsh && echo $ZSH_WINDOW_TITLE_DIRECTORY_DEPTH_DEFAULT'")
  end
end
