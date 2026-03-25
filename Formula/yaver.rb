class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.46.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-darwin-arm64"
      sha256 "9b4bc9293659f2423c68d1a067aaf8796793d96af8b6135bf9b121997c140964"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-darwin-amd64"
      sha256 "b933c0c6fb6ea5774cc85d1dba889d536a55be0e628ca995ea1856f2721cbc06"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-linux-arm64"
      sha256 "af623dd3a1a5d611933685f9e76e9d8872414917d660b8f032813e38f25a7810"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-linux-amd64"
      sha256 "979c0210c67e083bcfb77d1b7fdc96db9b61e9c772174e1521a4a9af796f1f5d"
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
