class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.67"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.67/yaver-darwin-arm64.tar.gz"
      sha256 "c870bb6de276200f68b52a29e1deaf8e818aea288e2c290dd543a78a1fa54e13"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.67/yaver-darwin-amd64.tar.gz"
      sha256 "f4ed3c981737d6871ab74144d628a6c32951d53620bbf2a1e6d187f41917bd00"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.67/yaver-linux-arm64.tar.gz"
      sha256 "305af02e9cc363dcc4cc9881ab39bcbf1430a13d6ef6071efe35ac7af8cdf1c3"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.67/yaver-linux-amd64.tar.gz"
      sha256 "5801e66b25ef544660c0cabbb0bb2335db2d6a2baf80eb18b8b59efe9161274b"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
