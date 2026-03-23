class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.43.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.43.0/yaver-darwin-arm64"
      sha256 "27f51929e5f9cb731574e17dfaeac7b35df5ae696480dbd7da2e11f10daf19cd"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.43.0/yaver-darwin-amd64"
      sha256 "d006bb060a1614a2ec999d3c5677996f3ef065530fc030593c1cdfe7ae86286d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.43.0/yaver-linux-arm64"
      sha256 "1f2de53802729fcaf28d7164beba7aa44892e88691cfc133a67a28ecae950417"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.43.0/yaver-linux-amd64"
      sha256 "69e603a8cdd669512eac2255bb8e968f7194d28acc72c4eb27fecfce105de258"
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
