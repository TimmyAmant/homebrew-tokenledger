# Homebrew formula for the TokenLedger CLI.
#
# This file is the copy kept next to the Swift sources. The installable tap is
# TimmyAmant/homebrew-tokenledger (brew install TimmyAmant/tokenledger/tokenledger).
# Keep the two in sync when cutting a CLI release: bump version, sha256, and
# the GitHub release asset, then run `./scripts/package-cli.sh`.
class Tokenledger < Formula
  desc "Reads local AI coding transcripts and uploads token counts"
  homepage "https://tokenledger.app"
  url "https://github.com/TimmyAmant/homebrew-tokenledger/releases/download/v0.1.0/tokenledger-0.1.0.tar.gz"
  sha256 "6878fc8b3058446935701ae25dfbd5cc763b8dce59c0bdd732d8a98d16d11294"
  license "MIT"

  depends_on macos: :sonoma

  conflicts_with "tokenboard", because: "tokenboard was the pre-rename binary of tokenledger"

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    bin.install "tokenledger"
  end

  test do
    assert_match "tokenledger/0.1.0", shell_output("#{bin}/tokenledger version")
    assert_match "agent", shell_output("#{bin}/tokenledger status")
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
end
