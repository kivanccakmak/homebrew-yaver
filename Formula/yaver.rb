class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.6"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.6/yaver-darwin-arm64.tar.gz"
      sha256 "eddcdb7d452a6e3ec9f65ab7579ff056179d4854fb0a3f77c0c82833b3ad6715"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.6/yaver-darwin-amd64.tar.gz"
      sha256 "01a29b3c87038118924fa8ff974dce480b59b80f4ea4fa7c9c7a9ab60da6db39"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.6/yaver-linux-arm64.tar.gz"
      sha256 "ed4409e1d417f5f3fb09e3fb6fee5083e7857462a60dac105fc95a7f03af7e51"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.6/yaver-linux-amd64.tar.gz"
      sha256 "1d570074b9c7c217c08bcfbe232b130643934438fcbf2ba99541b9724f6f69dd"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
