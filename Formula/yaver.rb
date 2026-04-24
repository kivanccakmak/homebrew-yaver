class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.32"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.32/yaver-darwin-arm64.tar.gz"
      sha256 "6ca7d3da019c35b4c5a16c4b09fbea36314289d8268d6db5eec7ead5519746a8"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.32/yaver-darwin-amd64.tar.gz"
      sha256 "b21d008574e0d5d9dcde1ba6ea12890eaa3350461aaeb0ffb6eccf61f4f8e891"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.32/yaver-linux-arm64.tar.gz"
      sha256 "f8fac5a97ef3a21679d659f8e4518d167bf854c70789cdbabcaa97f895c0123e"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.32/yaver-linux-amd64.tar.gz"
      sha256 "4bf0d000c1a5ebb2e1f18e0e4526cd05397f08e300aac67c64f8fad5e8e1bb47"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
