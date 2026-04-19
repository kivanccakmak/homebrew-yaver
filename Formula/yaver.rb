class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.0"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.0/yaver-darwin-arm64.tar.gz"
      sha256 "1e67f6c0b3d4513af4fe239ca94419b566ae355a7a270baa5b0c09c38d673791"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.0/yaver-darwin-amd64.tar.gz"
      sha256 "7837d67d91ccad6c5c1de82aa50f97c3121c04debbe8e01335ee1dca36bb8f4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.0/yaver-linux-arm64.tar.gz"
      sha256 "7bc826085222cbe782bd45ffcf0534cae6156fd99af9c8f3fff586e9e3ed9a68"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.0/yaver-linux-amd64.tar.gz"
      sha256 "3ca876907d1eda01dc241f17b77111cfa3a5f6b6fdf40d02c03dbdea14340852"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
