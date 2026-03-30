class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.61.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.61.0/yaver-darwin-arm64.tar.gz"
      sha256 "253e869ff7465f6d7916dba0be07bed84d38c278b9fc87ca364d1666fb9bcdf2"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.61.0/yaver-darwin-amd64.tar.gz"
      sha256 "a449b879eba913e810e22292a458171c89f133228f3f97acd76dd6e3c50727a8"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.61.0/yaver-linux-arm64.tar.gz"
      sha256 "5acb5f646fa4538c99ad82e7cced5e5622f007b7e630d0b6be8eb86cc9d0998c"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.61.0/yaver-linux-amd64.tar.gz"
      sha256 "5d389c9a45c9a690bf814714b2e55bd7102555c81ab6b5fa715964c2ff2d5bda"
    end
  end
  def install
    bin.install "yaver"
  end
  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
