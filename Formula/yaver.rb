class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.80"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.80/yaver-darwin-arm64.tar.gz"
      sha256 "e656b74d0d78a913d6a7219d0435731a3241ee98ee6b060d90d9a2af1e24bb85"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.80/yaver-darwin-amd64.tar.gz"
      sha256 "92775dc11380c374367090ddccfe59653684d07bd48ce0b58a2a7da8b9acafcd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.80/yaver-linux-arm64.tar.gz"
      sha256 "9ad62366520b5cf8b8926aebd688ee4942b2c4073ab58de1ecfc153b544455b0"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.80/yaver-linux-amd64.tar.gz"
      sha256 "9d1187528c1f1446035561db439502e020349631b117f171dc321f4f17e73df6"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
