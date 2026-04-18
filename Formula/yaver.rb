class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.96.5"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.5/yaver-darwin-arm64.tar.gz"
      sha256 "bb9da83dd70de85d4f0bdbda27781931d3863a9eedc1f5df01d292115827351a"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.5/yaver-darwin-amd64.tar.gz"
      sha256 "3251667304036a4750706a2741578661413cd5a07745dde1a590e7fc6e1737c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.5/yaver-linux-arm64.tar.gz"
      sha256 "3500c305a3bc481721fa9960b87b6820b9198d8ce07c8617f570049538b2d443"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.5/yaver-linux-amd64.tar.gz"
      sha256 "3a7ae4e1d583bd5659a14e8c8762a0e2d4cd5205389ee2379027c55a011e420a"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
