class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.38.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.38.0/yaver-darwin-arm64"
      sha256 "218e5c9010655721d0660889134d9ebffd793db99c5de18e3ba92809d9bb8bb8"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.38.0/yaver-darwin-amd64"
      sha256 "97eb85747c3d316450860178260444b3ff471051d7502b6460e518d783d37526"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.38.0/yaver-linux-arm64"
      sha256 "4d747b13858d197194264a381f3da3a29edfd31d49914b6579377fb7e49a3614"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.38.0/yaver-linux-amd64"
      sha256 "25380178b6ec0f94382b9e2d6a05952ca17e113426907697d8c026f2e954ee0b"
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
