class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.26"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.26/yaver-darwin-arm64.tar.gz"
      sha256 "8a5085aa9bf78c65c2e869d62e382eb239dfafe52f63a12b8386d9d5a196a90e"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.26/yaver-darwin-amd64.tar.gz"
      sha256 "f34eea513da2d48cf2d1990a40bb82ece88e9ce159a7d51884d08d6ff2f7bc5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.26/yaver-linux-arm64.tar.gz"
      sha256 "9e20889d73cfe32ca1993fb2c78ad7f184744ba969e17e79e2f21156c81eafbb"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.26/yaver-linux-amd64.tar.gz"
      sha256 "291328674606a8de92c3a51d31b483c2d2f27307c53360ee54615d73ef56e71c"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
