class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.74.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.74.0/yaver-darwin-arm64.tar.gz"
      sha256 "b7afe2f2c9cf944a14efcc19c6ec336fef6534f81f6d0f8bd3a5b7344b05a253"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.74.0/yaver-darwin-amd64.tar.gz"
      sha256 "060e996ffe6652b959ad7d3de28d2a330fae3c79d1b699c8a072e70cf9000789"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.74.0/yaver-linux-arm64.tar.gz"
      sha256 "9ec3032c103df896bc2fd4188157037bf4e942cc8c22f66c5738054a8c5c6c76"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.74.0/yaver-linux-amd64.tar.gz"
      sha256 "58e957657899e2ca518811359f394a95d8d7c358e9f528bbda15ef29f1470647"
    end
  end
  def install
    bin.install "yaver"
  end
  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
