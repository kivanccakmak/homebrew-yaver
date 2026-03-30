class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.64.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.64.0/yaver-darwin-arm64.tar.gz"
      sha256 "d13a321ab1b7c0b924a0a1ff69f2dd23f00fefdca68ad719236e294d84b25823"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.64.0/yaver-darwin-amd64.tar.gz"
      sha256 "2a8c05004f987bbe9fc9573f4d48a75811d04f081bb852c3a05394aef21fcc8d"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.64.0/yaver-linux-arm64.tar.gz"
      sha256 "2e198689a3c6e47ebd5717d483b4a61cc81f880df2e0d0cc67e2e0ea798dc8fb"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.64.0/yaver-linux-amd64.tar.gz"
      sha256 "4f1c82861b53ad67ed885181af4b1ea047a8b1e2ea28636c066ccd707f57480c"
    end
  end
  def install
    bin.install "yaver"
  end
  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
