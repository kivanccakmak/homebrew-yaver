class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.46"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.46/yaver-darwin-arm64.tar.gz"
      sha256 "efc0d349f1ac144f5833f865edc4b9577414638448923810d8d1a46cc74efa76"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.46/yaver-darwin-amd64.tar.gz"
      sha256 "7663472012785134c26496b6b120d1c100f78a37743256d93a1f3ce7600fe5e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.46/yaver-linux-arm64.tar.gz"
      sha256 "24b1b18c49b489c51e442131988763439ac5313f613cf092b15d405e17b8e90b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.46/yaver-linux-amd64.tar.gz"
      sha256 "4fdac8d94761bdb127ded02fbce021a356a983143889a75e325cda6de31cc4a3"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
