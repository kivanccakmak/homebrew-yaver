class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.48.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.48.0/yaver-darwin-arm64"
      sha256 "3f0ed9a1c11551b12bb3dd2a7e2e9ba6a69d81f1ff9d489bc6ad7885bffa68b2"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.48.0/yaver-darwin-amd64"
      sha256 "10d8a2394417c75db6948a5392180a0a294d198f54de6adb3b5c2cd4122307e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.48.0/yaver-linux-arm64"
      sha256 "f4c6abadc514bb4211ce02128e7d82dad22266536f496299116f668f087c6237"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.48.0/yaver-linux-amd64"
      sha256 "ecf73ab3f75d2080db78d31adae0cc17baec0f78c895d8a60fb6ccd67491385f"
    end
  end

  def install
    binary = Dir["yaver-*"].first
    bin.install binary => "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
