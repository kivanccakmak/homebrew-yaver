class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.31"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.31/yaver-darwin-arm64.tar.gz"
      sha256 "242f3231bcd7f5128738ef018d9b0dfb21ad3fbd6754abc37cad0fb7de148f59"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.31/yaver-darwin-amd64.tar.gz"
      sha256 "1dc58376595b66eba72bbee997b49e6ea94eac0bed86ffd2c165beb383b86584"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.31/yaver-linux-arm64.tar.gz"
      sha256 "8648c751edbfca6b3ac672537ff188e89c5ab1a69aa2e9f4e74da4c7a37d3eec"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.31/yaver-linux-amd64.tar.gz"
      sha256 "d455abb636704f679a030783fed0eb1d1094e6739839ace09d21269b324d943c"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
