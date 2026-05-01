class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.101"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.101/yaver-darwin-arm64.tar.gz"
      sha256 "85783226dcb2269f1e367a33a1f828e24920c03acce072e599345533c5a301e5"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.101/yaver-darwin-amd64.tar.gz"
      sha256 "f73a7fa94e1906f5476d52d096881619620ee37c9a55a35e7334622a3e3fbdb0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.101/yaver-linux-arm64.tar.gz"
      sha256 "0326ac52326468fa8f20ee209880d631708f2cdbf46be991415edcbb1997518b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.101/yaver-linux-amd64.tar.gz"
      sha256 "5e65d3949fc32e4ee2923bd0db97c39eba24bef91745a895db048ab36c2cbc6f"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
