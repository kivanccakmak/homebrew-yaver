class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.4"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.4/yaver-darwin-arm64.tar.gz"
      sha256 "07a579beb55f7b98f819701b96c5e018b2c3c2f990ce8115599ee7d67ecbda48"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.4/yaver-darwin-amd64.tar.gz"
      sha256 "fa393ce60ffc4d6bbf085807793a1ed9774fa51b0c7173dfa4e6ea089d69399d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.4/yaver-linux-arm64.tar.gz"
      sha256 "753219618b4ce08887c9386ac6555cf27c4289f28ae28a1419e3458283a12034"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.4/yaver-linux-amd64.tar.gz"
      sha256 "5ffad274264ccd408b136152a9d887a264a792f0613d015deb8fdee8b39bb155"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
