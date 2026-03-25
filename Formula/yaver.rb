class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.46.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-darwin-arm64"
      sha256 "1327aedd730707e0a6913c6bbe6938cdeb41b1e2341b57378f46143c3a74063e"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-darwin-amd64"
      sha256 "462c7b9114be76666dd792cfed30df805ca4a3e11543dd9980b339320ad2da2e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-linux-arm64"
      sha256 "4f10c6b14b42c3e26f23aba7fbbdde30320c29be36372d660c67bb34ede557b8"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.46.0/yaver-linux-amd64"
      sha256 "ff1683b06aaac7b2f53d09455be2fdc823cf92f9465f7c8d451ded3e7d237971"
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
