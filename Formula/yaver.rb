class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.63"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.63/yaver-darwin-arm64.tar.gz"
      sha256 "3939dbd181505792bad28de818c9dc335f3f6936c851d4f75e15bcd27eabb860"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.63/yaver-darwin-amd64.tar.gz"
      sha256 "f534e8610750e1f18b523b17b117dbc1c691fafa0877dbaebc549903c0f42dd8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.63/yaver-linux-arm64.tar.gz"
      sha256 "1cd2573e56908714905338a241276c09f2d93b052788dfc4cdb935222e5b5ba9"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.63/yaver-linux-amd64.tar.gz"
      sha256 "78f68cf32fcada28d0e74439ec31fb7cc2c2259762e7c72a20f1159e7b021bcc"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
