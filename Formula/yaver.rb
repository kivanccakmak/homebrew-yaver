class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.95.5"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.5/yaver-darwin-arm64.tar.gz"
      sha256 "b7551ef4dbdfc7daf2d622feef2bb64a77d183d1ab0a8465c039eecb4f570638"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.5/yaver-darwin-amd64.tar.gz"
      sha256 "c987d2ab3e725ebb99ff32580e8da900fcd435c22e5e12e27ed3292182905efc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.5/yaver-linux-arm64.tar.gz"
      sha256 "97e6edcc37a0952da29c1f15200fc74af6db14c0bbe3b44399f4b75c74314509"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.5/yaver-linux-amd64.tar.gz"
      sha256 "7dc27204eb683a00944447feecc22775fc5c491e89304b15fcf9d23bc38df95f"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
