class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.84.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.84.0/yaver-darwin-arm64.tar.gz"
      sha256 "25b5995326902d75d62905559b5193d2540c6e5557c152410bb414dcb13efd0f"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.84.0/yaver-darwin-amd64.tar.gz"
      sha256 "c16918590ab91186cc6598d0c6361840fa8d5bdc312209a3b58fecb70cdd1c7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.84.0/yaver-linux-arm64.tar.gz"
      sha256 "86b1cc8b39bd2de679af1f6069b32683b5aef86bf8875226cf1b2fba358013c0"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.84.0/yaver-linux-amd64.tar.gz"
      sha256 "d593d7370901a3a8ef79b99542d3b5b402dd5afc71f216587cc42db6fe111bd0"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
