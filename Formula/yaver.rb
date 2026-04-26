class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.53"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.53/yaver-darwin-arm64.tar.gz"
      sha256 "4712f7648a5a2157723ae3734c24538ac985b8f5c659fd791f7c5ba2ae0b8df6"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.53/yaver-darwin-amd64.tar.gz"
      sha256 "6779bf60179113a445f1c7383f725950c08e7e72502975397be808005e680a69"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.53/yaver-linux-arm64.tar.gz"
      sha256 "b3cdb14da22fa154f83c6e71622e979c2bc9c564de8d813fcc4a107321ada574"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.53/yaver-linux-amd64.tar.gz"
      sha256 "71724384de4765f22319606077b0a8325bf27a38c7924dbfa0a2819912ab8edd"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
