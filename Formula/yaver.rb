class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.64"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.64/yaver-darwin-arm64.tar.gz"
      sha256 "8850dd89f30f5ad0c5ff43fa7e4ee636bd61deb2c3bdcb7ab4ae2d44109b9ea7"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.64/yaver-darwin-amd64.tar.gz"
      sha256 "a59f60e336a673c362f8c97d49960d3470a3cb7303ee8170a21fe903239acabd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.64/yaver-linux-arm64.tar.gz"
      sha256 "1390004316c55b69aa58a18194cddadb8c979372160a5300d32dc37c6e02c580"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.64/yaver-linux-amd64.tar.gz"
      sha256 "2c0b55c01cc92125005167c277ac439ca6483dbc657ee86438f15ab22786173b"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
