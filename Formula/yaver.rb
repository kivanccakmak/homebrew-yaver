class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.61"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.61/yaver-darwin-arm64.tar.gz"
      sha256 "471d1ee72fa78a27ad5aebfb5d901655780c43d36f5247a7490252b452540625"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.61/yaver-darwin-amd64.tar.gz"
      sha256 "c1b68f6e0d9f00a4b43c027fba9f0607a8273ceed40c82309d0d1baf2d003e09"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.61/yaver-linux-arm64.tar.gz"
      sha256 "0a06ca42e5ebfd4e846ecdded7d8acdfacab22086712ffed2b290b509cd5df91"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.61/yaver-linux-amd64.tar.gz"
      sha256 "4410e5d4f15ecdc9ec753d901b2abb3f2dc7551bb814f1951e38c2f51fd3a9c0"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
