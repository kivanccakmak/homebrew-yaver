class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.95.4"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.4/yaver-darwin-arm64.tar.gz"
      sha256 "0ec9797275acf638482c16e6d2f501ec72736f032f81a1e19412d9bcd6e6334f"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.4/yaver-darwin-amd64.tar.gz"
      sha256 "133e6b9b22d9ec5443e8684d2c63815828b5033f3bf4d81ae0ccc891c53f86ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.4/yaver-linux-arm64.tar.gz"
      sha256 "0536a6d43197958467fed207630a068a5fe05182969f39ea1ee936ef25d7316f"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.4/yaver-linux-amd64.tar.gz"
      sha256 "1f4c7dbf406e92d806d19fa4ed00317930869a9b8e6ae8b69d27e6f92d37eb94"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
