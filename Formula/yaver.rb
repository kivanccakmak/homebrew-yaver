class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.117"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.117/yaver-darwin-arm64.tar.gz"
      sha256 "f5a82cf1ecb657a9c843ca87605ebfa5574029ddd1b05580207e9d5e0768e663"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.117/yaver-darwin-amd64.tar.gz"
      sha256 "5cb1a033fb3c949ba62d4aeeff2190860b56231b4118f276b1a33d5175fce0b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.117/yaver-linux-arm64.tar.gz"
      sha256 "0f1cb0224eb72fbd79552a92cc20b4add95d37e923c728ec00c9f9a99e00b48d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.117/yaver-linux-amd64.tar.gz"
      sha256 "dce58b75249cac653e0af0aae9241a42859861c8268493c7edb2a279ec3d0260"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
