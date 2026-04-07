class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.75.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.75.0/yaver-darwin-arm64.tar.gz"
      sha256 "cc155024ae52aaf965eb51762c04b82e131e9d3b5e991a8536fd41fa7d9d48ac"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.75.0/yaver-darwin-amd64.tar.gz"
      sha256 "2b75599396817405c9a3e38d346ac1ca74e8388888cdf811f159ef649fa48465"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.75.0/yaver-linux-arm64.tar.gz"
      sha256 "3e9a51a8fe719af61a8d1943d91dff67d74623790bba2e505c9a0416a4e33c4a"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.75.0/yaver-linux-amd64.tar.gz"
      sha256 "45ea39879fbb6e71c72d3abd2131023ede902b49a7df8989c21c8fec7c6e0828"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
