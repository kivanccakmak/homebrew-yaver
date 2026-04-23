class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.19"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.19/yaver-darwin-arm64.tar.gz"
      sha256 "07283cafab22388d039d3f7d79154d873ee474067bbc7cfb732da46efc530296"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.19/yaver-darwin-amd64.tar.gz"
      sha256 "f396ab079b23cea2d089285f7bfd322f9cfede20e64f671cbe04f76c64654d25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.19/yaver-linux-arm64.tar.gz"
      sha256 "acb5554ec1ffe712073fea51951386fadd1d123060bf17a05abc6d052433609a"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.19/yaver-linux-amd64.tar.gz"
      sha256 "ef3bafd1e9230c3fe8ebc9bda1506ad84baafa2dce9a396412d01f540a3548ee"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
