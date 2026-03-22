class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.41.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.41.0/yaver-darwin-arm64"
      sha256 "2356975cb8b1ed279680e3cc73827125439083baaa184d341d49264a6477668f"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.41.0/yaver-darwin-amd64"
      sha256 "716128cfa16a5d4f42e3bc6f9fedccf0ff8091a0189ad4112e6c6b04c90ce4e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.41.0/yaver-linux-arm64"
      sha256 "c816741928d3f914b00d544e4065ccf9e566794701aeae530a373196ed09149f"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.41.0/yaver-linux-amd64"
      sha256 "c467f09a927d1a7768164aa7712ced9d4a14306768370cb4f6c74b8edf0dce7c"
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
