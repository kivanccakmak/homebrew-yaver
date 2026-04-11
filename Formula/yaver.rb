class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.78.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.78.0/yaver-darwin-arm64.tar.gz"
      sha256 "6441a6e02432e87e7369e9265a78c53e273a81dd6b1b9fb3ba79d5bab977f129"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.78.0/yaver-darwin-amd64.tar.gz"
      sha256 "f37763fe551073056f3092d6abe59261dc09a4a1ed1bc5324e3b3a27c7525a4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.78.0/yaver-linux-arm64.tar.gz"
      sha256 "1e5fc4786ee2ed2cea189b7f5667c6c366a4e4bd057be45262d99f076bc19cc1"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.78.0/yaver-linux-amd64.tar.gz"
      sha256 "8c2ed8582dd2af723715f3d3d7bb5dc7d10c5d63e794020cdc1edc1def49989f"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
