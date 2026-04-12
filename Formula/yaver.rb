class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.88.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.88.0/yaver-darwin-arm64.tar.gz"
      sha256 "032723346243ed27126da05321a5a1fee1367e21ef957a9434a266d65d5b25bf"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.88.0/yaver-darwin-amd64.tar.gz"
      sha256 "7cd742110e50c06881bd9f9a06401de8a0ae32ab1ed3fd0647da9e4537f560f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.88.0/yaver-linux-arm64.tar.gz"
      sha256 "f7fc865ef2374966394b4750a291bf21facec5c95987f133f1ca91ce7c97585f"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.88.0/yaver-linux-amd64.tar.gz"
      sha256 "a6f4912244b58e33e106c73230970fd0995baa1423a394389871efc341aa0e99"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
