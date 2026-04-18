class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.96.9"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.9/yaver-darwin-arm64.tar.gz"
      sha256 "f186c56d5ddb5a8640f244c0dbf2737008c6741c68f29a0db6935bf06caa45fc"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.9/yaver-darwin-amd64.tar.gz"
      sha256 "6a2824f2fefac25644452973b02c01433fced1463595b18d55ae0ea72711f1a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.9/yaver-linux-arm64.tar.gz"
      sha256 "8035a722a73ab765a7479839044db080926d47895624ea19bfbba683e021dc22"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.9/yaver-linux-amd64.tar.gz"
      sha256 "d909ad62b13c91c3b64d564ca4da8d246435d65b6d846d0b6b2ffc3c50fea153"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
