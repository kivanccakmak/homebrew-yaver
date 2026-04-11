class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.82.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.82.0/yaver-darwin-arm64.tar.gz"
      sha256 "382883e0c1fd16c69ab49342aabdf786eeff6099e533374dbe406699f1c8cb71"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.82.0/yaver-darwin-amd64.tar.gz"
      sha256 "11daec637340e881bd260dfa77bd0c2dcdbed3caeb3d809475226cffe6bdce73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.82.0/yaver-linux-arm64.tar.gz"
      sha256 "3f6b65f61c29c3941a3d0830491ecff64e361ef1094d6dacab2a6e8e8ddb5dd8"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.82.0/yaver-linux-amd64.tar.gz"
      sha256 "315e7210aefcc76a6f888aacf7e8a681fbeaf7ff6fae183edff2584da63c08c5"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
