class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.112"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.112/yaver-darwin-arm64.tar.gz"
      sha256 "7720c00a948ed1346b320f266856974404a474c660c4f4bba91df7dcb9f5db5f"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.112/yaver-darwin-amd64.tar.gz"
      sha256 "9f258e79b3c743a79077c0b7c0e7f3e3612a72680821ecdf8c1ecd0d344d5cb0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.112/yaver-linux-arm64.tar.gz"
      sha256 "5c32bf4f2a72330d624bb8bbd9c9d1e78931fd08e7b78474cc842bbaf33dba2d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.112/yaver-linux-amd64.tar.gz"
      sha256 "5b5d32148e756de20559e247f7bcfddf2db46147d4f2f048e3e8769ef033037b"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
