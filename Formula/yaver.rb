class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.15"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.15/yaver-darwin-arm64.tar.gz"
      sha256 "6c73a1e0f0343d60f4909d26a241d15875887683b7afc6ca32802737af49fc6d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.15/yaver-darwin-amd64.tar.gz"
      sha256 "8572be7edb36efe98744b81f359337efeb9681bfa349b8c0aaff94cc07b18538"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.15/yaver-linux-arm64.tar.gz"
      sha256 "4ae9c99577d7d33b9192ce7488911a1df9c7ac777aa2cde308782b8cd8b5698a"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.15/yaver-linux-amd64.tar.gz"
      sha256 "efe3f4c0172cdf7b276eaa260fd9f8d0584f36f90c10a98c3a6067e8626dafa1"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
