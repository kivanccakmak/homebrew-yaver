class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.71"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.71/yaver-darwin-arm64.tar.gz"
      sha256 "46fa8378e52ca176b144f0e4aeae89912e3ae6e416709c9fcf6c73ead086d5bf"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.71/yaver-darwin-amd64.tar.gz"
      sha256 "6a2dce4a36d9db67ac12460fd8314692c4cf27c2b87c9a058428e0e9b204c7fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.71/yaver-linux-arm64.tar.gz"
      sha256 "1a7b7d814006953aeb355218bc9cfa263f6bc4bdb591fd636576df190815cca3"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.71/yaver-linux-amd64.tar.gz"
      sha256 "cf989263dee05417d5cec878ad2831773e09ad31b918dc37d10c08a1b727078a"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
