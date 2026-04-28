class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.93"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.93/yaver-darwin-arm64.tar.gz"
      sha256 "95e570204a17ede6fe557c6241a5ab536d1f5bb3f30eacaf4fadd8e879aba22b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.93/yaver-darwin-amd64.tar.gz"
      sha256 "f7f82d77ec96cee0065088b9e38a0215454d5d395d71ba633bfef764eef16e8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.93/yaver-linux-arm64.tar.gz"
      sha256 "c2566f2e7e9ab44bc8d3cb8bb1d18f40cfb16218c46b22dda8228d542f62f310"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.93/yaver-linux-amd64.tar.gz"
      sha256 "04a7f5dc511a68e010146f1f3c6f02524ac61050eac87676a10c71c37b54353a"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
