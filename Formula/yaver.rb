class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.13"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.13/yaver-darwin-arm64.tar.gz"
      sha256 "e92371f78cdf05b3d604c38034b3be3d32a20643cb1edf59a8237410902d6622"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.13/yaver-darwin-amd64.tar.gz"
      sha256 "c0f246246df7ab1918734a581dae2cee7db727c3b2cc24e26c6ddefa2cea9d93"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.13/yaver-linux-arm64.tar.gz"
      sha256 "82ef4d261eb5bd79c6d2445802a055e194669e2da8b02c4ef733b1a568f60ebe"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.13/yaver-linux-amd64.tar.gz"
      sha256 "5dc6a793c8d64a2e33bc05a19e791ed82b00ac88a7d8dec2968e1dfb155c0090"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
