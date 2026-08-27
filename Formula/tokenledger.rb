# Homebrew formula for the TokenLedger CLI.
#
# This file is the copy kept next to the Swift sources. The installable tap is
# TimmyAmant/homebrew-tokenledger (brew install TimmyAmant/tokenledger/tokenledger).
# Keep the two in sync when cutting a CLI release (`./scripts/release-cli.sh`).
class Tokenledger < Formula
  desc "Reads local AI coding transcripts and uploads token counts"
  homepage "https://tokenledger.app"
  url "https://github.com/TimmyAmant/homebrew-tokenledger/releases/download/v0.1.4/tokenledger-0.1.4.tar.gz"
  sha256 "675c1533058bdee0da9a9e6c8e1d63c4ddba3c87fbf0c8127a9d1220f3d2d1a2"
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
    assert_match "tokenledger/0.1.4", shell_output("#{bin}/tokenledger version")
    assert_match "agent", shell_output("#{bin}/tokenledger status")
  end
end
