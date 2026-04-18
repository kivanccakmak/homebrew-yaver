class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.96.3"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.3/yaver-darwin-arm64.tar.gz"
      sha256 "1094c3d59bf6956fe1721cd5a545cff0e774e8d54ec79d91e71677caca17d5a2"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.3/yaver-darwin-amd64.tar.gz"
      sha256 "abd02e63b11d7511d723be31c5e95084078448ec380860e1dd87edcb8869d74d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.3/yaver-linux-arm64.tar.gz"
      sha256 "b6eaf1a8123a02978dc6e37d94be2dc51345ed46319eb3323428cba0830742fa"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.3/yaver-linux-amd64.tar.gz"
      sha256 "948e1cdf93151f975092823b06804f5a4bd435c18db623d4ddc3597f50c85988"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
