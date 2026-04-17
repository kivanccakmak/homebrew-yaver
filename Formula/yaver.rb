class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.95.2"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.2/yaver-darwin-arm64.tar.gz"
      sha256 "6d03c9ee4dfe1c75a8bee032b69e347d60c549fd7046cbdc3fedcd0a3c0b1788"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.2/yaver-darwin-amd64.tar.gz"
      sha256 "33b9e0441658df6bdbc7dc12aafe730a447e3816f7b2a42065e8b4db12b3c57c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.2/yaver-linux-arm64.tar.gz"
      sha256 "561274b787b239d9360f446fd7686faae53de31be77b3a653809a6773640faeb"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.2/yaver-linux-amd64.tar.gz"
      sha256 "2c97cbb2e5e954083adce960e59e3a1d485e162b63b8dfcede75c313997238cd"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
