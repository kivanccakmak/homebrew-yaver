class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.95.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.0/yaver-darwin-arm64.tar.gz"
      sha256 "c772f9fc21b7ecbcb487091d1320381bd9bec45153834328b209339b76dbd760"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.0/yaver-darwin-amd64.tar.gz"
      sha256 "ce429ccfc4eeb5062c1e7f5bd37e49d2f7ca08584aae1153c9ac095bd6b7c7e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.0/yaver-linux-arm64.tar.gz"
      sha256 "4a20ca4c70c0ba701ffc2d5cb4ac464f5feeffbd83c2df0c031433096e8f7111"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.0/yaver-linux-amd64.tar.gz"
      sha256 "fda56382fba7be2b0413ae125a4dfd8d83791f38cb8e3d8d7fe8b4b9f40d0dc2"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
