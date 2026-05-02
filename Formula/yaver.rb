class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.118"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.118/yaver-darwin-arm64.tar.gz"
      sha256 "9d0ccfe34f82f2d7ba0d481867c25d177ad4060ed622ab430627fe52444c1385"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.118/yaver-darwin-amd64.tar.gz"
      sha256 "7d370e43801a8f154a569ad2459e2c66d7e749f2a1fe8b813a80e426227e1e30"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.118/yaver-linux-arm64.tar.gz"
      sha256 "d0221b4cc5a8fea2f5f21fd757049900cbd5a0a2be9c4ccaad66be2d4341e5ea"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.118/yaver-linux-amd64.tar.gz"
      sha256 "cbfc2aaa753e6324eddaff319c45392a2737519d8cdd807275a2e696a48a0d9c"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
