class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.91"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.91/yaver-darwin-arm64.tar.gz"
      sha256 "b631dcb5bcf1d086b7aec89b3aa00c822f379e5b4cd8cc2b4046b7f6749ed737"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.91/yaver-darwin-amd64.tar.gz"
      sha256 "874d2f1f76ddd0396998d7de99a79737a574b75467347a1bddf456eddf6cfaf6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.91/yaver-linux-arm64.tar.gz"
      sha256 "0e14aad19488804fc9b48bfa7a548c80821397dacf81c6d1e515ac7f55484df0"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.91/yaver-linux-amd64.tar.gz"
      sha256 "dc31240bb692b3701347bc0156319ecf3215b9f44f3ea39d041b3159a86cbedc"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
