class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.88"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.88/yaver-darwin-arm64.tar.gz"
      sha256 "5d5f7eb540e6bc71581479c517c18ea5dbae95302c729b87988f7202ad9dfb5d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.88/yaver-darwin-amd64.tar.gz"
      sha256 "3d19a9238b54221637615a7c0ba78bd8ab43693bdefa50a3cab84c241c1d9300"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.88/yaver-linux-arm64.tar.gz"
      sha256 "c2a48c564a87f14901baaebb828be64d5b0a39724a695444bb707f12dc180d9d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.88/yaver-linux-amd64.tar.gz"
      sha256 "c09f67adfc66f5df82f44b0e8bd1fad280e89d8852439f12eff495dc945d6641"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
