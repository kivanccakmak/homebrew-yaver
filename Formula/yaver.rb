class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.57"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.57/yaver-darwin-arm64.tar.gz"
      sha256 "62ece10c707338d33a9af95895974c6e83d9e819b0612fe662d9f1439e9d7e06"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.57/yaver-darwin-amd64.tar.gz"
      sha256 "04d5f107563f68688f5983c741053df36e73724522eb5a4dbfdcf59e8aba832f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.57/yaver-linux-arm64.tar.gz"
      sha256 "74a1db53827d991d921248a94608ccd608af5b7f1112cab2a59eee3fda1780d8"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.57/yaver-linux-amd64.tar.gz"
      sha256 "25a929e0a77d3ac3df59651cc81d734516996f9c3be7dcbb10d3477a66a3b684"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
