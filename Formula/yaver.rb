class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.73.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.73.0/yaver-darwin-arm64.tar.gz"
      sha256 "54b11b28c0edb52da1f1076716b52b8d7c5c2f45c05fc50cd7aaccc2be26ea98"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.73.0/yaver-darwin-amd64.tar.gz"
      sha256 "37e36efec50f275792d64e6eb590dd1f0e4b6545001049e40faa1d0bd057ae5a"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.73.0/yaver-linux-arm64.tar.gz"
      sha256 "d19f20bdeb4699f8b558513c43c01560eb8d3df605c1b4f571dbed262463f4d9"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.73.0/yaver-linux-amd64.tar.gz"
      sha256 "a55f6f1c8edd460c607940f63c9a4606709c094f6ed6ac43225f81300647cdb3"
    end
  end
  def install
    bin.install "yaver"
  end
  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
