class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.49"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.49/yaver-darwin-arm64.tar.gz"
      sha256 "507c728587ac00b855ab1ab1183d5527cb55613f3a11baeb0e40c1500256666e"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.49/yaver-darwin-amd64.tar.gz"
      sha256 "8e40d3e98aa59887ca97315bc91550c065808e210dbd75f134894364f876cb31"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.49/yaver-linux-arm64.tar.gz"
      sha256 "476772eee7dcc14654924da5fe7bcada80f1f50fbd8e5f7448cd676d9c89d12f"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.49/yaver-linux-amd64.tar.gz"
      sha256 "0d39004052d230bb6fd35941ff83c38dedce7fe9de144a3917e5a6a7b135daae"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
