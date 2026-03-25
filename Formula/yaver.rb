class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.47.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.47.0/yaver-darwin-arm64"
      sha256 "7dba2a4e561fbd86f4b74f846b8e214bd69d3e3cc28be2c093d8647dee24bc90"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.47.0/yaver-darwin-amd64"
      sha256 "e131c96f3a0a69b4333b3a8e6aa104cad2b9dbed5e26fc802c2640f4dd6c338d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.47.0/yaver-linux-arm64"
      sha256 "4fcaccc75c959f9ff34f667d59f59850312c096d675002bcebf46e311ed04c30"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.47.0/yaver-linux-amd64"
      sha256 "ff17404fdb445661a54a42037e633bbfcf150912ccfc28202deee97d90399386"
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
