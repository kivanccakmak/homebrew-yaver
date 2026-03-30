class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.62.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.62.0/yaver-darwin-arm64.tar.gz"
      sha256 "3010829f98b564ebceb398d2b1a01b5b4eeb242e8cf6698605a65f2113850395"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.62.0/yaver-darwin-amd64.tar.gz"
      sha256 "6e78767114dd1c4f79bafe0703990355980f912e38971398c250bb363670da0f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.62.0/yaver-linux-arm64.tar.gz"
      sha256 "7a614b1df04769db3e0ee93cbc5993845d5fa539ae02e7941324ccfffb201541"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.62.0/yaver-linux-amd64.tar.gz"
      sha256 "249279746f8f1662fee47055c521a9a9fa47f34f892b2d7904f953c35fb639ae"
    end
  end
  def install
    bin.install "yaver"
  end
  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
