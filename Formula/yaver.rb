class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.75"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.75/yaver-darwin-arm64.tar.gz"
      sha256 "f8742ef3035bac0a09ab24893f00761a6369757611be38f6e2d0feba979a89ff"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.75/yaver-darwin-amd64.tar.gz"
      sha256 "835966e243a8f14f1386d9b8a5fe931bdf6da0a4b2a374a48ad071b20959e958"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.75/yaver-linux-arm64.tar.gz"
      sha256 "e8bca7766d61df629980c5317b29edda4d9ca4679706244adfc78b72992a5cf7"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.75/yaver-linux-amd64.tar.gz"
      sha256 "70ad3d1e6924bd392e5317e0b25723f2f2fcd471d02aaa9f1b85aad752517789"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
