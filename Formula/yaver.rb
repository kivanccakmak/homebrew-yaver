class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.46.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-darwin-arm64"
      sha256 "22458cd13e3e3d21e9dd2f0c6d69aa64dcdb0408c3d8e18c7e9a32a06546a4c6"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-darwin-amd64"
      sha256 "3fda511965f5bb093a5470c57353ca4935b97bf20ea1f6c64cbb24dfa871c509"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-linux-arm64"
      sha256 "9b53a1691f82b30d1aee0b783c1b7203c01c0e8c715d3769577b650ee19ae9e2"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-linux-amd64"
      sha256 "43e7cb3ed552bf5d873d73e7fe14d0c190ef67489d352c7abe3736ca9291cb36"
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
