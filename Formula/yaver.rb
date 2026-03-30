class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.65.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.65.0/yaver-darwin-arm64.tar.gz"
      sha256 "f4e7c468513e85b6e9b44df8d5c6d68eb95406970ef5dd6e66a9d961b076b205"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.65.0/yaver-darwin-amd64.tar.gz"
      sha256 "c352c908b83e03554efba13d5b1a35a6c874409e69a96acf8599853ee7ca1f24"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.65.0/yaver-linux-arm64.tar.gz"
      sha256 "633f10fb5248799cecb7305e542c7addd6b653f0f28fad84b2e2aeff228c5117"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.65.0/yaver-linux-amd64.tar.gz"
      sha256 "b199e5ace8260d1db3ac1a7c40c39ca68a642679ba14c1f2f644ff2d489e7d7e"
    end
  end
  def install
    bin.install "yaver"
  end
  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
