class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.95.7"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.7/yaver-darwin-arm64.tar.gz"
      sha256 "097dabea0bb17e1cc1693f524ad73129df7f4f42352e6d72ebed7d317a128d33"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.7/yaver-darwin-amd64.tar.gz"
      sha256 "a54bd4965c99ad20e57ecd2b3e692040f474f9146f4fb8f6de1835deb47d05a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.7/yaver-linux-arm64.tar.gz"
      sha256 "9596b1ea4b47998fce592ec181edb82102aa96fa38a2a8b36b11e7abc22aba00"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.7/yaver-linux-amd64.tar.gz"
      sha256 "d112f09136f2e3b32d7c1a43dec1608f8c62b750b033a02fdc392c957c8b0930"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
