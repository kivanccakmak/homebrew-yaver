class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.85.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.85.0/yaver-darwin-arm64.tar.gz"
      sha256 "5197653380054211e6f64e06bbe4f40c860d906aa17c597d7b07580e76a4810b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.85.0/yaver-darwin-amd64.tar.gz"
      sha256 "5f5a551436a94b1e8803376f49b0d80ba46e7906011098c6b9126c63a2ca7e31"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.85.0/yaver-linux-arm64.tar.gz"
      sha256 "567a71c21a507a638223b8b10d419581a7651c7f1627bef1acb3e74ba1e024a8"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.85.0/yaver-linux-amd64.tar.gz"
      sha256 "e00d77fda7b9ecccbdaaee54f019dc712b58d377f6b0759132017b1ec99d7743"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
