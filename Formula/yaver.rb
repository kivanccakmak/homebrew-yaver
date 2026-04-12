class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.91.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.91.0/yaver-v1.91.0-darwin-arm64.tar.gz"
      sha256 "24b39621a901b99f9140651e0de007f8cebff65695f8f129f1d8bc797be633b5"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.91.0/yaver-v1.91.0-darwin-amd64.tar.gz"
      sha256 "6be7b651aa7d9a42e3521f507462b767a1cb5c6750cd92f35e34a6857a9a6d41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.91.0/yaver-v1.91.0-linux-arm64.tar.gz"
      sha256 "97d3ee897e1a7882f81399b3d15ab2932bef44b770cbcea84f17fae5fef4b73d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.91.0/yaver-v1.91.0-linux-amd64.tar.gz"
      sha256 "c9655792cf5de237fa1ea687f5ff8c51262b20c191f6c7610a79fcc7e0243ade"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
