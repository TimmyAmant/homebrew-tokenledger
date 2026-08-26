# Homebrew formula for the TokenLedger CLI.
#
# This file is the copy kept next to the Swift sources. The installable tap is
# TimmyAmant/homebrew-tokenledger (brew install TimmyAmant/tokenledger/tokenledger).
# Keep the two in sync when cutting a CLI release (`./scripts/release-cli.sh`).
class Tokenledger < Formula
  desc "Reads local AI coding transcripts and uploads token counts"
  homepage "https://tokenledger.app"
  url "https://github.com/TimmyAmant/homebrew-tokenledger/releases/download/v0.1.1/tokenledger-0.1.1.tar.gz"
  sha256 "331d49b44cf211414b401ae0126bab969644a5e45830343c9d0d8e2a12a214b6"
  license "MIT"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  def install
    bin.install "tokenledger"
  end

  def caveats
    <<~EOS
      Homebrew 6 installs this by fully-qualified name:

        brew install TimmyAmant/tokenledger/tokenledger

      Then sign in and start the background agent:

        tokenledger login --url #{homepage}
        tokenledger start

      After `brew upgrade`, restart a running agent with `tokenledger restart`
      (or `tokenledger update`, which upgrades and restarts in one step).
    EOS
  end

  test do
    assert_match "tokenledger/0.1.1", shell_output("#{bin}/tokenledger version")
    assert_match "agent", shell_output("#{bin}/tokenledger status")
  end
end
