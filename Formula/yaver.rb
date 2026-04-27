class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.65"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.65/yaver-darwin-arm64.tar.gz"
      sha256 "70aa3c95ea23cb0d1b48204485a22624060bd7c820366eaee2d9fda17309d6a9"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.65/yaver-darwin-amd64.tar.gz"
      sha256 "c67f61306fcc268b4ed3b349e4d137c7c1f15b7b00f2bf4e503117b9dd9fee60"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.65/yaver-linux-arm64.tar.gz"
      sha256 "f26003e9cee5e8668eefd91a5bed5f4ed3568c3d5ae138aaf4a77ed2c32b60bd"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.65/yaver-linux-amd64.tar.gz"
      sha256 "bbe830ad8364a8cd2bc5985e6087ffefd2c54b88e2bc58e12d52ed572359aab9"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
