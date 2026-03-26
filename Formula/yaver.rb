class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.51.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.51.0/yaver-darwin-arm64"
      sha256 "be0b5d0f73b4576dfe55fb1646a5bf724999c233facd76e592a94ceef1afebf6"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.51.0/yaver-darwin-amd64"
      sha256 "e25f04df03facb38158c187aaf0148fe141770aec348729a40ee592b5514bebd"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.51.0/yaver-linux-arm64"
      sha256 "48482a4d7a9f6150caebc7dc1b88b74fba4e0dfe86fd63b962c552681f1ced45"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.51.0/yaver-linux-amd64"
      sha256 "b8b7be3045ad428e02293e34023d6915ab05ce3fc992276bc9ad86e6139e050b"
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
