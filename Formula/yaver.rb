class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.58.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.58.0/yaver-darwin-arm64.tar.gz"
      sha256 "f1c11fb2de719bca3bbcf2f0e803e5b288cedbe53ca02a1356103b8afad7e4a9"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.58.0/yaver-darwin-amd64.tar.gz"
      sha256 "355224e3d8c02ad320393e7ef19a232cbde0ec6f184b221940c9ab9483b08553"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.58.0/yaver-linux-arm64.tar.gz"
      sha256 "b7850d8486b56788b153ed8c635dd92bdf2362dfabc49a55d28e0999987c1ee7"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.58.0/yaver-linux-amd64.tar.gz"
      sha256 "bd0484defa629bda2dc9eb2cdf8dc50c6c8b8477cffc96d6c6e898a2c6bf0774"
    end
  end
  def install
    bin.install "yaver"
  end
  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
