class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.22"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.22/yaver-darwin-arm64.tar.gz"
      sha256 "525bcb472d8fece69bab4cae912c4f27b9ead6710ceb56f1ab9fa170c94aadb2"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.22/yaver-darwin-amd64.tar.gz"
      sha256 "66ceace8e60b11c0ee9980d1697e5f1d57f1a1496e757412543ecc481c8331a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.22/yaver-linux-arm64.tar.gz"
      sha256 "66ec33f3f74b2494203fd484baa5d0cc8cd32610ac4c358d237d05360795490d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.22/yaver-linux-amd64.tar.gz"
      sha256 "05ee70e877353733372cd8ad3b27083d696891dbcdeaa767703bc1796900dc64"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
