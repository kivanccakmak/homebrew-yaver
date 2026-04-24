class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.23"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.23/yaver-darwin-arm64.tar.gz"
      sha256 "016141918cb3a324abf8d001aa1de7f8e1cba01e25141d7eb794bf185dca3409"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.23/yaver-darwin-amd64.tar.gz"
      sha256 "2350bc8ce82c7cfcd2ef5454d338d1ecee3affb7e3e587d487b4e269a4c2f570"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.23/yaver-linux-arm64.tar.gz"
      sha256 "4cb4a483a7e0d6098a7a2c10d465ca3e470586c9c97e46467f5d5270705eb4ce"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.23/yaver-linux-amd64.tar.gz"
      sha256 "6fa98498d90b34d793e6ae03366dd09f690ec943296b3402bcb9f4cfddaaf763"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
