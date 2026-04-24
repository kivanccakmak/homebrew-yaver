class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.24"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.24/yaver-darwin-arm64.tar.gz"
      sha256 "5c9a006be77a668c61e50e16d08837d5c50d742219c9f1d1296f6476cc396b8b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.24/yaver-darwin-amd64.tar.gz"
      sha256 "5328cb0a8e8ac5e341a073402e8d830b6cfc505a47b9308578715c950e0a5056"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.24/yaver-linux-arm64.tar.gz"
      sha256 "c4e6ef52109503396490dc006f7d63a42b082daead951bb0cb53d8c0a7204825"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.24/yaver-linux-amd64.tar.gz"
      sha256 "40fab2ac402c096847294ba27f01c48b5d5e2a58495f7bc0774a318e2e262bea"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
