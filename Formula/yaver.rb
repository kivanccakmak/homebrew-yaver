class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.34"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.34/yaver-darwin-arm64.tar.gz"
      sha256 "3d33378aa72683c842d9fc5e9945af545b0b17fe4acdf1a649cf137bdfb0b4f5"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.34/yaver-darwin-amd64.tar.gz"
      sha256 "30215836e3fadc110900d43a6ee0b6cffd9dfd69d38d5b5e8c2acf621c44ee39"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.34/yaver-linux-arm64.tar.gz"
      sha256 "f6ac8268200b2391fccff04261b51ed1e859719e1aa70a7ac574d3e9c901f1e7"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.34/yaver-linux-amd64.tar.gz"
      sha256 "7b0623684f628b5f8455f82e1935968bad6e5a3bc96bfdfa71a0b1f79fbe7260"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
