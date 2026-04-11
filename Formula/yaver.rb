class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.83.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.83.0/yaver-darwin-arm64.tar.gz"
      sha256 "6a21177e67b943f4cc84553a82e45a867f3472c44ce5c255607379af6bbb7696"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.83.0/yaver-darwin-amd64.tar.gz"
      sha256 "3bbddd384851ac2f65d4a6d2c5434e5991ddd699dee870e8cf851f14b7f26607"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.83.0/yaver-linux-arm64.tar.gz"
      sha256 "50476009f064cb03159c65abb04452679db8b0afcc7b01614bc023062d77234b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.83.0/yaver-linux-amd64.tar.gz"
      sha256 "20b835bd6b3f3c670568ba3014ea79951567f63df2028a108c29a085bf6bd1da"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
