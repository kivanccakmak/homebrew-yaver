class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.96.4"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.4/yaver-darwin-arm64.tar.gz"
      sha256 "0dedd2ca956a33eeaaa9ee71afb56f82fc1931e46f128b70cfb225865d4285cc"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.4/yaver-darwin-amd64.tar.gz"
      sha256 "c6a9a2ebf871186d3e7c482d044d68145a4b53cc6c90818e316fa3cab857ee03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.4/yaver-linux-arm64.tar.gz"
      sha256 "20e115caf8f373d3fef1142ce846a4888e9f67d8d9f6544eb33f26b89de302d0"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.4/yaver-linux-amd64.tar.gz"
      sha256 "a5b38495cb70056e660881037278602f7a55950990d4e98a026501cf99afb652"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
