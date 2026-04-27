class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.87"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.87/yaver-darwin-arm64.tar.gz"
      sha256 "3a087a8bad63ba0ed8aaa702cb64f3775f9d327657c6cad944082986664d1fdf"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.87/yaver-darwin-amd64.tar.gz"
      sha256 "1b0064cc2544b6fa6b46a4ebba1ba8b5270f803c9d6dad6165d80cc5e0d33dd4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.87/yaver-linux-arm64.tar.gz"
      sha256 "899c48c58fa6dce8a6a20a349a618421238fb8905f6c0871655cf6378b91c514"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.87/yaver-linux-amd64.tar.gz"
      sha256 "1397944bf485b044f6524a9466891c9e51c49e1be89b90e1a603673594ed5d8a"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
