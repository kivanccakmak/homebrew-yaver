class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.72"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.72/yaver-darwin-arm64.tar.gz"
      sha256 "a9decc5999a4f0a50ce75432b94cf28131e23bd8bdcd17f6c0f52e0aa59dec97"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.72/yaver-darwin-amd64.tar.gz"
      sha256 "6f3165a43acd2b73337834ac8d4a10e1e9ab28d3783396be6b21c654b0d54087"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.72/yaver-linux-arm64.tar.gz"
      sha256 "bce42ca1fda5875933dc5237f26f7cca2c9f4168f88e0c5fc43e64c5e8ab119f"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.72/yaver-linux-amd64.tar.gz"
      sha256 "e1a227af8e1b0df86a3878894ba3cf303c7f036d719ed79f15a2aea9d98f5a5f"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
