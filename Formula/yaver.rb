class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.29"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.29/yaver-darwin-arm64.tar.gz"
      sha256 "3fd9e78e507cf7f66627453a7da8dcbe0f852cda686366822a7dfe9b3a32caf9"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.29/yaver-darwin-amd64.tar.gz"
      sha256 "17bca9d48f0c6f9354228379b60f65fa78f7dd677f5760377663f3a2b6837468"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.29/yaver-linux-arm64.tar.gz"
      sha256 "d38723b2fe8056e1d60d1a75a7d0b9dff65a0da67b357efa14c29b2251fd4aa0"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.29/yaver-linux-amd64.tar.gz"
      sha256 "b9c745507f5ddf5cf393cbc58a3c00892fdffa2ccb886d93874b0919fa19b2f1"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
