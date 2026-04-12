class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.87.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.87.0/yaver-darwin-arm64.tar.gz"
      sha256 "68ee485197bbe10063a1d440e5304f4e0e1fc849bc560d38ed7e6b45261959ef"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.87.0/yaver-darwin-amd64.tar.gz"
      sha256 "aace718590afcf2a1ccd4dd923dd01b00a20f414afdccf4c4ddd42bef0161c6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.87.0/yaver-linux-arm64.tar.gz"
      sha256 "3d7fca771d41612fc76b9769cec84d95e8afe8f7a4511d9978a290c9253b61ab"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.87.0/yaver-linux-amd64.tar.gz"
      sha256 "1455fa828ea6e9b233b449f3cf7bb31c2d73fd29713ef077cef800384940b7af"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
