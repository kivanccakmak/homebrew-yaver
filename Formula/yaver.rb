class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.11"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.11/yaver-darwin-arm64.tar.gz"
      sha256 "335ea752c75d1fdefd8eb414f787e1a731865501712a56cebea97a7f14d336cf"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.11/yaver-darwin-amd64.tar.gz"
      sha256 "aeb6873ec4a17a7e545b1db6b5962a2ac5070384687670c59edb6ad394e3c8ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.11/yaver-linux-arm64.tar.gz"
      sha256 "73c0cef27f35836b6dddb6b1747b32a3e11016741aceabe3ab0eff3e3a83e152"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.11/yaver-linux-amd64.tar.gz"
      sha256 "e7427e3de7fffbec2d3a8a50e4e7ff5fd5deaaa324a0a2b3271ffc6835c77cf9"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
