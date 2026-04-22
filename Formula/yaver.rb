class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.16"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.16/yaver-darwin-arm64.tar.gz"
      sha256 "5b20825f94c3ec791a81d97b94a2a95128352ee61e1ba778a58f36f81164aa2d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.16/yaver-darwin-amd64.tar.gz"
      sha256 "3c079efcd618934f8a60a6b896e466eebfe3ce14ea007f7b50abf53540a38e93"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.16/yaver-linux-arm64.tar.gz"
      sha256 "708568a1fb502ca3e988073e8e0ae5a4151a9fe46e8169afd51c9b16f2ab79a7"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.16/yaver-linux-amd64.tar.gz"
      sha256 "e6310a7de80f489272da7fb62df36d50344126289b55e6a13a40029ec3dbeae6"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
