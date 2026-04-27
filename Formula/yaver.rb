class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.77"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.77/yaver-darwin-arm64.tar.gz"
      sha256 "be81d65b2e9046e63faeda9dc116800b9e808ccf1132e091d9fe599b47737c03"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.77/yaver-darwin-amd64.tar.gz"
      sha256 "a7533150bb008db7e8f9ca80524590b3f3231945c703ab976b5b6e5ac0648b83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.77/yaver-linux-arm64.tar.gz"
      sha256 "9cc1c5c22d99d03dd399afa9d2673d9847d2ae4ff22eda2eb709a4405c33cbec"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.77/yaver-linux-amd64.tar.gz"
      sha256 "cffa15f2ac5d781122a12aacf526e743813942a6cfed7899f0417a2e659e695b"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
