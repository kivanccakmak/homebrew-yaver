class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.58"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.58/yaver-darwin-arm64.tar.gz"
      sha256 "f43e38d9a05234aaf7830053da5580cb59dff497dd529923d68646aae99c1d65"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.58/yaver-darwin-amd64.tar.gz"
      sha256 "fcc2f900f634e5387b0ea4be2fbd779851dba77c421cf81d26db1343abb24ad1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.58/yaver-linux-arm64.tar.gz"
      sha256 "0333be4099ec4fa9cabb41bd625a2b7561211dfa7bee0dfa1847e0afdaee1cdb"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.58/yaver-linux-amd64.tar.gz"
      sha256 "fc224bf08bc707126a5f7179eb647e65dd09142ebc0c7b2c6cf87b7e3b953160"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
