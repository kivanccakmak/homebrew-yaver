class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.86.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.86.0/yaver-darwin-arm64.tar.gz"
      sha256 "7db86fc076361af0bbdf4496170017b3f3c1d3c0ef1121acb5dae4738aa11ef3"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.86.0/yaver-darwin-amd64.tar.gz"
      sha256 "b9391e65249a9682bc7c68b02ab328ca010d877b44b135a9c38bb187cce81635"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.86.0/yaver-linux-arm64.tar.gz"
      sha256 "f37683013f2247ff37fc64dccbf513b5365951edfe5217be11f3b87fc773e52c"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.86.0/yaver-linux-amd64.tar.gz"
      sha256 "6e631884c7ed58ffbc212dd9c0c37b6e5217e16fd2cd0b85b03c83ff6dc56c85"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
