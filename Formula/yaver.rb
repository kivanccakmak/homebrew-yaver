class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.94"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.94/yaver-darwin-arm64.tar.gz"
      sha256 "771c34df873dc6b0955b8375f569499c53cf62afcea141085f2c74bc0862095b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.94/yaver-darwin-amd64.tar.gz"
      sha256 "cb4fad638b6b19f74d7d75290d15114424acf332736880935302a6953cdbb860"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.94/yaver-linux-arm64.tar.gz"
      sha256 "e1a16674268ff878771f0b921c2ca0678b00a1f9585ad3332ef6861d76efb3ec"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.94/yaver-linux-amd64.tar.gz"
      sha256 "14232bc91cf335bd2d8c6718080239bd060b40e865647e68e737f8f1dce8316c"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
