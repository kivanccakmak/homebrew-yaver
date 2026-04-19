class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.2"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.2/yaver-darwin-arm64.tar.gz"
      sha256 "bc57c9ebe40c8fe637e9a0dc4e17718ea7c0b756acfc996a2eae071cc83aa6c7"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.2/yaver-darwin-amd64.tar.gz"
      sha256 "fe7f3bffe8845b7dafe656e6a03be4dbbc6203e70b77d38c097102d74cc4db1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.2/yaver-linux-arm64.tar.gz"
      sha256 "7bfa33cb724001534ca29f119b19463d5bb60f8cbc178b7ae4789d16bec2fbd6"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.2/yaver-linux-amd64.tar.gz"
      sha256 "69081a056cca741809bc79a60b8a28d584c70dc6ebba932580c708f0044d0780"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
