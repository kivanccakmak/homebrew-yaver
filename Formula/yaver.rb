class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.92"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.92/yaver-darwin-arm64.tar.gz"
      sha256 "aefbfd5eec6bba1b362b22a91e707b54849c3b8b4fd388b39b8bbec8b77094ea"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.92/yaver-darwin-amd64.tar.gz"
      sha256 "bc63a62c4aa2a8961aeeb162adeb7787e489a8438f252a16147c7f1b6f281803"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.92/yaver-linux-arm64.tar.gz"
      sha256 "1a4bd4522ed7fa2e0ff354d50228c8d74e96f0e45d226e660544eeee3ed0660b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.92/yaver-linux-amd64.tar.gz"
      sha256 "4f0cd3317f4983810cd5a87580ab05663ad44060cdb60482720f3c939c78ebfb"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
