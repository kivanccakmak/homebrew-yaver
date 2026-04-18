class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.96.2"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.2/yaver-darwin-arm64.tar.gz"
      sha256 "59447adb73d3b3d437d7a6afd1eab47e882785ccadb96b19bb809f4b0dda2e36"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.2/yaver-darwin-amd64.tar.gz"
      sha256 "a674e9a7f080fa3947669306aa9f565c65e3be1b03fe3ec069c787e829349855"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.2/yaver-linux-arm64.tar.gz"
      sha256 "90f745c3e648ef7b757a5bf467068a5813107411190faf7f3c2409036cfa1833"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.2/yaver-linux-amd64.tar.gz"
      sha256 "abfa246f87df6944849b51ad8cea3f063b971d92c0822e55845e05394975b75b"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
