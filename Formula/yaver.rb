class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.25"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.25/yaver-darwin-arm64.tar.gz"
      sha256 "91042270d318c2e4fca6a4c2e4c912cf4a0765bbff16b0293ef2bc9cf0dd9bec"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.25/yaver-darwin-amd64.tar.gz"
      sha256 "d25509c9051d167e76ed6b5c2b4d993599839bf9499c697e261e33b78accf53b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.25/yaver-linux-arm64.tar.gz"
      sha256 "4d3a27499617c321793509a1479e40851628b2fb69200caf7167ef77f7a0be9b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.25/yaver-linux-amd64.tar.gz"
      sha256 "02f52ac2c6bd51e94c7a0327011d30e165dc641ddff79c5788053989fdcf0aa2"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
