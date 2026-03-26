class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.54.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.54.0/yaver-darwin-arm64.tar.gz"
      sha256 "d44689f6fc50d8706d6f360ced3b25bd8b163086f177abc3526571257e3f5c17"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.54.0/yaver-darwin-amd64.tar.gz"
      sha256 "722110f677ade304feb5a808320e72ec3058297f7defd4807a1b8f148e5991e7"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.54.0/yaver-linux-arm64.tar.gz"
      sha256 "92adbf42a07a8d1abcf5591bedc01d96a771f4fd1e736752e00bd47fb8d25d5d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.54.0/yaver-linux-amd64.tar.gz"
      sha256 "cd44a1717c29fcc4b94dbaaa97dadede1ae316535ddfb7cbfdcd0e67ac67e709"
    end
  end
  def install
    bin.install "yaver"
  end
  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
