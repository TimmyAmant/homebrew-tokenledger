# TokenLedger Homebrew tap

macOS CLI for [TokenLedger](https://tokenledger.app). Reads local AI coding
transcripts and uploads token counts — never prompts, completions, or file
paths.

```bash
brew install TimmyAmant/tokenledger/tokenledger
tokenledger login --url https://tokenledger.app
tokenledger start
```

The fully-qualified name is required under Homebrew 6: `brew install tokenledger`
looks in homebrew/core, and a short name from a third-party tap is only used
after that formula is trusted. The one-liner above taps, trusts, and installs.

```bash
tokenledger version
tokenledger status
tokenledger help
```
