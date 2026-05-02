class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.111"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.111/yaver-darwin-arm64.tar.gz"
      sha256 "ebc7729b4b8a020293ce9201f92ed29c1430ef23e08a31b8d068b145eb77cb09"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.111/yaver-darwin-amd64.tar.gz"
      sha256 "78547b94d1510538c17e8a34b752cd9d86547b88537d05e1a28a37fa7e4b67d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.111/yaver-linux-arm64.tar.gz"
      sha256 "f5890da85c294b5849dc32140b28368eb78771b68090a87f3bd1e354f46d849b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.111/yaver-linux-amd64.tar.gz"
      sha256 "dd088d9cd3121e08c17126e534c6d4bcf1406e11ec356dc187ce843452368761"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
