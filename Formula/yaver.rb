class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.51"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.51/yaver-darwin-arm64.tar.gz"
      sha256 "055075db1c940410d2251f6f009a77d15667c70244bbbfd09531c7cf495a07c8"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.51/yaver-darwin-amd64.tar.gz"
      sha256 "9d30168be614cb9c080ac6c80f780140d0668ea0e6ba302dc551b41779868f42"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.51/yaver-linux-arm64.tar.gz"
      sha256 "cc8badf1e28a2c254a1130b9317c52dd0afc66693e49d5b417ff2fa64565f8cd"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.51/yaver-linux-amd64.tar.gz"
      sha256 "71b67487cae82f909bd93826534153502e499e93815cea102a2192faa5f922ea"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
