class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.90"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.90/yaver-darwin-arm64.tar.gz"
      sha256 "a200b9340a5827537669c946bee84089ce738b6aca2ec90bd15b18c384dfaebc"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.90/yaver-darwin-amd64.tar.gz"
      sha256 "a3cb35de7bc4f8d3990a54b28c8ec08ad917ebff1f75968aba73df663dc06ec3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.90/yaver-linux-arm64.tar.gz"
      sha256 "8464e9d8082415f78bb671c40c166cba037822216176de50dfcf062abff8b39b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.90/yaver-linux-amd64.tar.gz"
      sha256 "9cd1f73f55f282b7e127fd3408d3bb3d50eb5b7e1e19359831766e5d48aebdea"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
