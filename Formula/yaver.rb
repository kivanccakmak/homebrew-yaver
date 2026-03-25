class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.46.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-darwin-arm64"
      sha256 "462c7b9114be76666dd792cfed30df805ca4a3e11543dd9980b339320ad2da2e"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-darwin-amd64"
      sha256 "462c7b9114be76666dd792cfed30df805ca4a3e11543dd9980b339320ad2da2e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-linux-arm64"
      sha256 "462c7b9114be76666dd792cfed30df805ca4a3e11543dd9980b339320ad2da2e"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-linux-amd64"
      sha256 "462c7b9114be76666dd792cfed30df805ca4a3e11543dd9980b339320ad2da2e"
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
