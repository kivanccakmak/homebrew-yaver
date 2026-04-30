class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.98"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.98/yaver-darwin-arm64.tar.gz"
      sha256 "82e9dbaaa03ca789b63965cc426407c5812c3f2e28590a91b3b3fb73acfcd19f"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.98/yaver-darwin-amd64.tar.gz"
      sha256 "3ec06940103ffec28ce4fe148df4097f0b39483d28fa573bbd3572622aebb7fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.98/yaver-linux-arm64.tar.gz"
      sha256 "317070c8252ceaeba1aa833c4e7c1f1f7a4050356b38bdb0d0a74c5929c8dcec"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.98/yaver-linux-amd64.tar.gz"
      sha256 "1ea0cc12a42cb6e8a2ed68a015c1b87b30a72554d4f19011cf3b0b953855491d"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
