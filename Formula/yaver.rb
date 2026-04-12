class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.93.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.93.0/yaver-v1.93.0-darwin-arm64.tar.gz"
      sha256 "a9502a1eef0133926ed49ee909351acbeb9130ea7fb13c05e9fb9b2760c2638b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.93.0/yaver-v1.93.0-darwin-amd64.tar.gz"
      sha256 "963277a49e1b19be3683e5bc2324a8a9eec3e0b0c85be9cce2af67e482da16cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.93.0/yaver-v1.93.0-linux-arm64.tar.gz"
      sha256 "a1a247c739b47631e960a971a8b1a6c8b51f10111d499dde83c259431d9cc4e0"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.93.0/yaver-v1.93.0-linux-amd64.tar.gz"
      sha256 "e7eb790eb4cbdda39df605f788867a5a6ebf6ccdcaf6174e3f89d9468f43551b"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
