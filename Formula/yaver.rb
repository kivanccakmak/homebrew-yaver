class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.68.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.68.0/yaver-darwin-arm64.tar.gz"
      sha256 "3c2208a8760a20611b16e08b78ff97fa405524aa144752342326d8d092f91601"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.68.0/yaver-darwin-amd64.tar.gz"
      sha256 "fa3d9862c5ced2ddcea41ae2d941275c09f2039282ad8bcdf2eb21b541524c3f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.68.0/yaver-linux-arm64.tar.gz"
      sha256 "a6c4909ab455bef8401c016e41912a03c1d8639931d4b7dc125afd742be79f86"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.68.0/yaver-linux-amd64.tar.gz"
      sha256 "af38a31e12a8a56b83a96172b87654293634beb2995dafc9db5615ce566774ee"
    end
  end
  def install
    bin.install "yaver"
  end
  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
