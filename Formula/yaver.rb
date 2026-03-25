class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.49.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.49.0/yaver-darwin-arm64"
      sha256 "c4d83c9132dd2b7851d23b22816afbd7bcccbcb7e9dc3cfac50639483edefdce"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.49.0/yaver-darwin-amd64"
      sha256 "c48cdebaec27588f43f691e89100cd9e64c5cf25c83a2e779189d912e01fdd07"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.49.0/yaver-linux-arm64"
      sha256 "53f4a6b38afd081031016c08f6e08be6ad828a3e320ecab147e5347b6c081dda"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.49.0/yaver-linux-amd64"
      sha256 "f21d03dba97f77670b6eb8dc3bdff90710f997efb24de8897c9eed839abb2b12"
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
