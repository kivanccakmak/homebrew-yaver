class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.108"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.108/yaver-darwin-arm64.tar.gz"
      sha256 "8d7d1bd1bb085b30bb07a58af120a592bda1f2a2f5996d7085bb9d326bfee784"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.108/yaver-darwin-amd64.tar.gz"
      sha256 "952f424ff48c0489fbadefc65d0a9764669c47f50cd3fae52b8fb355d85e6a7f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.108/yaver-linux-arm64.tar.gz"
      sha256 "8d2fb82ed6d0aa035004bfdbb7d7a7f3a7e667bea72bcc21ae58facfd74218e2"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.108/yaver-linux-amd64.tar.gz"
      sha256 "f82591067c2ab016d3ddb541521c80a4550f127f265eea7a99e8b6a5b82db5d1"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
