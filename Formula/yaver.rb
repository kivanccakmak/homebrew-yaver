class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.85"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.85/yaver-darwin-arm64.tar.gz"
      sha256 "9cb19d5060d357a7f9024c99710329ff704dfb713cb2b3b087f84a97e0a01fe7"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.85/yaver-darwin-amd64.tar.gz"
      sha256 "60721a6f4bbe9c36e37fbc270597bd7c49c8771efeb0345aec34c4eb99e5255f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.85/yaver-linux-arm64.tar.gz"
      sha256 "f131a863925fcc65143ece0283955df9189d2940bb864b21705d9e53c4fecf87"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.85/yaver-linux-amd64.tar.gz"
      sha256 "092f259414ae745b48ea88eaa55857f449c76bd8a99440e8f6cb882c137fa988"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
