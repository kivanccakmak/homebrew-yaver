class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.69"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.69/yaver-darwin-arm64.tar.gz"
      sha256 "43e3ee1cf089f880961f846c599e094a950925ebd0eb6fe7096785038d498861"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.69/yaver-darwin-amd64.tar.gz"
      sha256 "db944a7fb489e1f3ca8888347352b53656d84c1adb8f253f199def0e6dfbe09c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.69/yaver-linux-arm64.tar.gz"
      sha256 "4e196018acf1920344f40de7899a71b78c752c30ba8dbfea7d7245016701b59b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.69/yaver-linux-amd64.tar.gz"
      sha256 "8177adc8ae36bdffa366fc7a0d8344acabc21e27b34779d45a53b2702a6143d2"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
