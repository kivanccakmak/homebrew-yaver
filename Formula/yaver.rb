class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.113"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.113/yaver-darwin-arm64.tar.gz"
      sha256 "c362f8f43fec4673a519ef3faf70a7ddbc3f35dd5289ed658b97381ad17c519d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.113/yaver-darwin-amd64.tar.gz"
      sha256 "2a9b8990c38bbfea375d4eaa15842c91abdef518570106ffeaf2de35dfa5aa38"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.113/yaver-linux-arm64.tar.gz"
      sha256 "ce158bfc3c0256883ef82c39e40374cfa7d1cd31a33e0b110739def7ff5939d4"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.113/yaver-linux-amd64.tar.gz"
      sha256 "f34cab4801db960a67222590041d9b1f3a4b590d4711694644ca84d70b2e2b48"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
