class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.123"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.123/yaver-darwin-arm64.tar.gz"
      sha256 "f61fcac60913a2891207708d4e55f970dc05e6c5fc1e5c1f1e684f344df94929"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.123/yaver-darwin-amd64.tar.gz"
      sha256 "03beda70310411a8a744f730c8af041bcf265cdeccd72bab57f506e6b3a3c53a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.123/yaver-linux-arm64.tar.gz"
      sha256 "eb739ea8ddff82278ead6b10baec85a1ef0e29673b8fd512bc2cdbbfcf432ef9"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.123/yaver-linux-amd64.tar.gz"
      sha256 "4e6da23959294898d2e80401333b01cc77710bbaac41da33e1318f0745cb7cc7"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
