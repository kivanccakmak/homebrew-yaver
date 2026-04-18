class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.96.6"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.6/yaver-darwin-arm64.tar.gz"
      sha256 "7b94feb9ea55d866a2d3a4291b3f773f7f72cdf91b5370e1d4c13745397d6f02"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.6/yaver-darwin-amd64.tar.gz"
      sha256 "68a659c8fea2609ef8cdd666375dd686e5743b0fd906d4f75fbb9786b453386d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.6/yaver-linux-arm64.tar.gz"
      sha256 "fba3969019fe84fd35d9e82f636c058b97a74958748adf2a45aa8a62769b470b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.6/yaver-linux-amd64.tar.gz"
      sha256 "a44b3a671c78c14bf68308b16265e05067c3364b386dcce9ee1874e8213cee86"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
