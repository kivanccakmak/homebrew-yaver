class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.40.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.40.0/yaver-darwin-arm64"
      sha256 "28fc5c389f2fce883048f7d30e4ece5a97631c341f7a97029d34372cef6ed6a5"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.40.0/yaver-darwin-amd64"
      sha256 "9fe6aa10a7912625812b8cfa297151ca344098c81a94409166239f21c0f51687"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.40.0/yaver-linux-arm64"
      sha256 "40054ce738377f26f481ad7cec6b22dabe5c1922e0be00a999399e78592e8f0c"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.40.0/yaver-linux-amd64"
      sha256 "2b6432d4c6531b3952efddd6febe41712b1d29ac86b91377a85b780acef2d099"
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
