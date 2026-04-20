class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.10"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.10/yaver-darwin-arm64.tar.gz"
      sha256 "45a0cb3a5c91165bfd1d574b8c49b46a150e67859f0cd71df839553915a6165c"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.10/yaver-darwin-amd64.tar.gz"
      sha256 "9f3afccf7b8266d2ca516340366a9b14b503529dfc9feceb7b0b45acb906d755"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.10/yaver-linux-arm64.tar.gz"
      sha256 "03bceabf988805de91c08107e004535f8d1db53737abc5ff4e17777ba0e4da38"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.10/yaver-linux-amd64.tar.gz"
      sha256 "c715eccf179a076591c51a99aa5a36abd402ad5e9e87729f262b5eb7c49db511"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
