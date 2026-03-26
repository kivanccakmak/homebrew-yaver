class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.53.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.53.0/yaver-darwin-arm64"
      sha256 "2be242c9d1257c685cab20e0ae63c4e9ff4def62a6a19540b7c98deca708528d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.53.0/yaver-darwin-amd64"
      sha256 "d1918bc05332933ecc03b56aa2cb533ba84982ee8b4f48acdbab01e2f31afb99"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.53.0/yaver-linux-arm64"
      sha256 "442a6dfd53664cbebc4f8276153ee98183bc8f644fb967dae283cd6246a91cfe"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.53.0/yaver-linux-amd64"
      sha256 "83a1f6d2e5204e98a3bd07b8cfbf4fe45b2b1bfa9b73d7650eea1f992955edc2"
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
