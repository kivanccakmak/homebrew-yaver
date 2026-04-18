class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.96.8"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.8/yaver-darwin-arm64.tar.gz"
      sha256 "4ae0afc07616b566b22f1718ab04fd39d481d1ca3a7678dff1ae13e0a0ee0851"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.8/yaver-darwin-amd64.tar.gz"
      sha256 "e28c8b3639136023d999f7fa492b338cb10373e1ef6cb8e95ce2f4c462873829"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.8/yaver-linux-arm64.tar.gz"
      sha256 "e9563a10ef8b770bcdf3595caf4d2235f733bb9d8cfe4f035fff8fc9ec68afb3"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.8/yaver-linux-amd64.tar.gz"
      sha256 "489e5d8a7dde4f0536a746d428a59ce45833389b0429cac64170bde332c8818b"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
