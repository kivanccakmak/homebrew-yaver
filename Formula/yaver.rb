class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.52.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.52.0/yaver-darwin-arm64"
      sha256 "2d406362a1fc57657b55bbfd9d40a511204b7bedc305b23c57d9337d9818e08a"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.52.0/yaver-darwin-amd64"
      sha256 "17c4ec70eecc4761d7d35b79ce902ab10f59290d2b3229279cd8c3aefe2dca7e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.52.0/yaver-linux-arm64"
      sha256 "84e0aceb63f2358dab73f051ccc1641e4519641123576e4934c62c257d8a040a"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.52.0/yaver-linux-amd64"
      sha256 "17216a7294b1942bb87a5ff048969ebdcb5da8cde16002394634d257d198f1f7"
    end
  end
  def install
    binary = Dir["yaver-*"].first
    bin.install binary => "yaver"
  end
  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
