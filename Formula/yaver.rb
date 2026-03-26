class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.59.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.59.0/yaver-darwin-arm64.tar.gz"
      sha256 "25cd3a2bc220ab05fe789ee6e981df3b63336657edd9f97ffe191275e3cd9750"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.59.0/yaver-darwin-amd64.tar.gz"
      sha256 "d9b341df5c16a9344d80de3d70717c85770633992ed6cb8a1fc7ba62f8ed0859"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.59.0/yaver-linux-arm64.tar.gz"
      sha256 "ab98182aaf7356739998495491816a0a4063e79229421bfc46c13d005a2f3327"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.59.0/yaver-linux-amd64.tar.gz"
      sha256 "abc79ddcfa3ab8d8f07bcd7a67d9fa35c57d221dfd3357da9a6c12d224225ab2"
    end
  end
  def install
    bin.install "yaver"
  end
  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
