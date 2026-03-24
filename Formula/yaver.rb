class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.45.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.45.0/yaver-darwin-arm64"
      sha256 "a75c80203d4f03592859f96c9a5b17c9e60dbd6ea753ff3833d2203db744543c"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.45.0/yaver-darwin-amd64"
      sha256 "b7e0e1d13ad86c2262679e6f0baa384d4561bba35dbab949901bfb26d475bcb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.45.0/yaver-linux-arm64"
      sha256 "e681d204b4d6c4c6439117fd0e0ff74bb91b65e3ef20429530953532531f8b6d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.45.0/yaver-linux-amd64"
      sha256 "ed1128a89e6cb8a478c74fd729e4e9ef562d315f441bafab41ec5a3313e089a4"
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
