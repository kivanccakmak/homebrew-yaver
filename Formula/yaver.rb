class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.52"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.52/yaver-darwin-arm64.tar.gz"
      sha256 "1799ba6962eb9d8e3af6c1ce8896837a18839be15fdefddf2331aa736747f66c"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.52/yaver-darwin-amd64.tar.gz"
      sha256 "197d9b19e1ac1a8780d001e5d332a96d53cb29792dd7702c000fcd915a5a3f4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.52/yaver-linux-arm64.tar.gz"
      sha256 "476b54a3fec38120eea03cc59b6e642351d53447e83d4c578c708a65e7310b2b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.52/yaver-linux-amd64.tar.gz"
      sha256 "15a41b9eeb9378e862cfb0148f21ae4f2c281456b9ae702d51e5f071e1d02734"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
