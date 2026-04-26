class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.48"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.48/yaver-darwin-arm64.tar.gz"
      sha256 "32dade2813c27870e5b41ecf5f1f56c9974725a474cb0ff8919b2554e282e592"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.48/yaver-darwin-amd64.tar.gz"
      sha256 "1df9044838104f83b02e46dc4b61066e6ca1029fb0abec20d2ea182b4f8d27f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.48/yaver-linux-arm64.tar.gz"
      sha256 "2ed3c0bc50c46303c2e4a7fd03a602db814c4103195e0faa177d2dee13b309c1"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.48/yaver-linux-amd64.tar.gz"
      sha256 "d298affacd97f4bbb08255163a2f3eb4f3f232286b01171b0cdfd71bc9ec073e"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
