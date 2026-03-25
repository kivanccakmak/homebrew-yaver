class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.50.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.50.0/yaver-darwin-arm64"
      sha256 "05df7b5e04eb7257fff464fec3b46514ac2ebfa707d1511da39983e78e4eb172"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.50.0/yaver-darwin-amd64"
      sha256 "50a9a310bf3951016a84b3db4e9c079e23262856e83f1bd77302d3799734cb9e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.50.0/yaver-linux-arm64"
      sha256 "d212e5b65238a16a0dcaafb48cc7ec1216ca1bd205e2e5c975edff20ced2d821"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.50.0/yaver-linux-amd64"
      sha256 "88d7912ab0fa5f4a7e28ddb34fa4a03eadd43db218cb15960178df1517da74c3"
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
