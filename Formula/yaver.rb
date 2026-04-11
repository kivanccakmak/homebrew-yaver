class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.86.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.86.0/yaver-darwin-arm64.tar.gz"
      sha256 "36da341df836aff61c939d7785f6d2a5b8e66892505e1dc6833c3145418f4dba"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.86.0/yaver-darwin-amd64.tar.gz"
      sha256 "d212408ff48467a7d9cd1a9c62b0ef380fd8168c06d555ed68ea67e8838953d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.86.0/yaver-linux-arm64.tar.gz"
      sha256 "ce0086b98391d973eb4b13ecbdb13ff3ce45753cdc567dc83fcb7bead946afdc"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.86.0/yaver-linux-amd64.tar.gz"
      sha256 "cbd72d1e7782f6f236d37f26b23dc95a1fb92c5059245287606c10d433e23ed2"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
