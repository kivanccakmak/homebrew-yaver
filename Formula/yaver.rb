class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.87.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.87.0/yaver-darwin-arm64.tar.gz"
      sha256 "ca3f9dce382e617bdfb135d5de4ad93e618bf28d24554d9eec8f8a2257f1bda5"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.87.0/yaver-darwin-amd64.tar.gz"
      sha256 "6d7eab0b6baba07e13d75c3d1644f910a8c849ace5cf65c8025a2905c43eaba4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.87.0/yaver-linux-arm64.tar.gz"
      sha256 "b9bd0630ffacdf54bbebdecb8eaa2e0e199f2c869f916bdb335d103c532b3813"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.87.0/yaver-linux-amd64.tar.gz"
      sha256 "fdc0a36795f93454f4abcda61ee089bb05827af6ca5f0f6263e3e3c0165ce179"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
