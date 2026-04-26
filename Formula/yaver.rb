class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.54"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.54/yaver-darwin-arm64.tar.gz"
      sha256 "00df0f9009b9b4e1fda10c73fce197eafb81beb50727eca05bb5431197dcd4ca"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.54/yaver-darwin-amd64.tar.gz"
      sha256 "0612b90435d704ce863170daf5a80b6a3a18e949d2d02e918b70da867936b332"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.54/yaver-linux-arm64.tar.gz"
      sha256 "ee20259549531cf0f3b7125ea0d4f1f38e93667e2faacb10b253f2a2b087abdc"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.54/yaver-linux-amd64.tar.gz"
      sha256 "72281d7c7c1573de4f89c8bf3cd88e1dc20e4b1fe1b99e8c092fbea4a86985ab"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
