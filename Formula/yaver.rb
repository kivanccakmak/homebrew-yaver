class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.74"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.74/yaver-darwin-arm64.tar.gz"
      sha256 "7bf750767a9874f939722e76ce89805a31da0f36cd3e5c38b8bb7dd41dd5af2a"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.74/yaver-darwin-amd64.tar.gz"
      sha256 "3d6237ba6bacd5271418b2ae30ef842a7bb8547adc4c28bb8f989a2a3a91703e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.74/yaver-linux-arm64.tar.gz"
      sha256 "ab63360182f9669d6a74b870c58aab3d2068385d33fa87603ef4f905fc5d8530"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.74/yaver-linux-amd64.tar.gz"
      sha256 "8e5fe2c7a0013d19c1626b0bc327821796912c4f6728cee5ee55cae9f67f5f6d"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
