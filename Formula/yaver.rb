class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.15"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.15/yaver-darwin-arm64.tar.gz"
      sha256 "e815ac591b482aa5dd5a719d1937fc6c9a3f253d8759634ad4b587d734964d23"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.15/yaver-darwin-amd64.tar.gz"
      sha256 "2464f370dd31c1c5e89f4033bf808efc330b72abc24a4912285bc741f5feb14e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.15/yaver-linux-arm64.tar.gz"
      sha256 "12246452ca94eb2c4213830fd36b9fc97ffd7afc01d399faf05212654ccd214e"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.15/yaver-linux-amd64.tar.gz"
      sha256 "b72c49e823e7d7e62657f0aeea4960fcfa6d5a6c8e349ae57f264b595a0c7c99"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
