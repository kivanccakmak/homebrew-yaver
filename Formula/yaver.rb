class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.17"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.17/yaver-darwin-arm64.tar.gz"
      sha256 "4a1f25a232e46457eb6de8e40e9158f6d9e3e40102231270f23286511d35288f"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.17/yaver-darwin-amd64.tar.gz"
      sha256 "ea83cba0da19f3847cc60a21cb9a9a3fb09cb165dabfab9b6ea651601d1707db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.17/yaver-linux-arm64.tar.gz"
      sha256 "81f6226dedef6ecc9dbff9d3bedc652280338fce0894f2e74eea343ec8bf2ed5"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.17/yaver-linux-amd64.tar.gz"
      sha256 "a77bb9afacc3534dac28d45df9328c5f4a152b41316ea995f958269ea73fba87"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
