class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.67.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.67.0/yaver-darwin-arm64.tar.gz"
      sha256 "c53020babbe9589fbef6726945b31b787ad7122cab7daec9a045f65be02a5a4c"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.67.0/yaver-darwin-amd64.tar.gz"
      sha256 "9d0241403787f85427c214bc246a8d8ed5cfc9f70dd4768add84e37d8d33b935"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.67.0/yaver-linux-arm64.tar.gz"
      sha256 "6dc67da9bbed5dd9eec6efde1fc126403406104f5cc24403492958e49a3891eb"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.67.0/yaver-linux-amd64.tar.gz"
      sha256 "f1f5c113b26ead9938e4858b7e713f3444a16496cc78e93d515a651b2f711016"
    end
  end
  def install
    bin.install "yaver"
  end
  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
