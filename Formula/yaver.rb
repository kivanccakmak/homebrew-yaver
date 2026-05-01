class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.106"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.106/yaver-darwin-arm64.tar.gz"
      sha256 "5483d41796c442b56188ab9ee9211283508c49c865502d5ac6e64ad880987082"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.106/yaver-darwin-amd64.tar.gz"
      sha256 "0717579d865aba295057cb262d294d5527d8329317167ada3c6d1302fee86fcb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.106/yaver-linux-arm64.tar.gz"
      sha256 "116d490d64c8a0bf2f3e42d03f60d7f8acc9ab92c70ffad577768cf9a8b9d70c"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.106/yaver-linux-amd64.tar.gz"
      sha256 "6ad47bc45a409276665e701569d3be77edf18e5111c1836dc8dd6f5ea0f0d986"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
