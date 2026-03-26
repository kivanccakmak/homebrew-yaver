class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.60.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.60.0/yaver-darwin-arm64.tar.gz"
      sha256 "4026b8d9565c2df65953c8b675b9ba5621f365d53b09703c4fc72c30e625a1b5"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.60.0/yaver-darwin-amd64.tar.gz"
      sha256 "66eb3153e644f033daaff9e21b33ef60735078a2e9cd67d4cab710f516a54184"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.60.0/yaver-linux-arm64.tar.gz"
      sha256 "abd6c9ebe3427a7d72f6cd0b7c41a0cafdc9e8eb494a82a8b3b49cf9da62c816"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.60.0/yaver-linux-amd64.tar.gz"
      sha256 "ae755213e97d8061bd42eafb9c8dc2ba3c0ed280755fbbc7f84ec0a84b6a35c3"
    end
  end
  def install
    bin.install "yaver"
  end
  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
