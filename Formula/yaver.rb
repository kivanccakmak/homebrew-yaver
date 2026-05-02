class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.115"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.115/yaver-darwin-arm64.tar.gz"
      sha256 "9f77c1e9c1b24098e8919dc9c2ebaae7927a5e718d45a8f1c5a03c84f63830dc"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.115/yaver-darwin-amd64.tar.gz"
      sha256 "d17d066b5f3fff62325228282b81e0d96a93c4615bee82e63c389569f6a6cbf9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.115/yaver-linux-arm64.tar.gz"
      sha256 "baad8d4084b6fefc0b8a76481a4400e2681b5cac55c6f73dbcdc45502341c214"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.115/yaver-linux-amd64.tar.gz"
      sha256 "10e587eeda77efff8a93b04e106a69c3b5adf03ab624ea6e06f8e264d5fc912d"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
