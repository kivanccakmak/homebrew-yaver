class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.96.10"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.10/yaver-darwin-arm64.tar.gz"
      sha256 "7d614515ca3a3b16a015dc7db4e32f33f2eb347b9788ae1f661e5e25b76c9239"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.10/yaver-darwin-amd64.tar.gz"
      sha256 "15191859fa8eef778171a8806a105d075e8d6354be68b8b63b8a18acfb31dfc1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.10/yaver-linux-arm64.tar.gz"
      sha256 "d68edf6dfab6a3f9aa5f910967c6f72a1a8c7fdcf3701c940fcb11b42972a55d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.10/yaver-linux-amd64.tar.gz"
      sha256 "254a612b357d5c47012de0608e4d3f12efa6317e5ed97dddd0bcfbc4d01d6b3b"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
