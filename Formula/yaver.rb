class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.1"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.1/yaver-darwin-arm64.tar.gz"
      sha256 "5074d8e5be2b82a30693ed0b1ce2307bcc0d9a5a926c9887e00f07e8625af88e"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.1/yaver-darwin-amd64.tar.gz"
      sha256 "8cddb7436dbb0c47394aa064456dcb7ab60f091aba0a80eaead0a608f30a80a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.1/yaver-linux-arm64.tar.gz"
      sha256 "6f3385534e7435e66692cac690e5fbf82ed84994f1ce11761f116c496b9f85f3"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.1/yaver-linux-amd64.tar.gz"
      sha256 "08776ba90146b54a4a48f8a777eff4d566ed732360e955796fbe0956903f5ced"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
