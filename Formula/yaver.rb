class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.77.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.77.0/yaver-darwin-arm64.tar.gz"
      sha256 "e8b5819b45d04f40c09d22bfb87aaa3fb6c07e862560c2d04dce783b792d6dd5"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.77.0/yaver-darwin-amd64.tar.gz"
      sha256 "c10065d1d979186f9e9ed08d4fbd1e04b49398087915747921cff4e671f99533"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.77.0/yaver-linux-arm64.tar.gz"
      sha256 "dd4965af43ed9116849149429d9d8c0c3356762ea306aeacff6b554b83ba0a2e"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.77.0/yaver-linux-amd64.tar.gz"
      sha256 "8411d9bec98c4ef246792fb19f1e7c7366fc64530b77b2b9d8d8905e2084b910"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
