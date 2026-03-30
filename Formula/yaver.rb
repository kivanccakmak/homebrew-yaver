class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.66.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.66.0/yaver-darwin-arm64.tar.gz"
      sha256 "d6c551e8e6fc1083cf4e2934a05598884f2b0ea4b634d9a0d1e2816d01c3e0b0"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.66.0/yaver-darwin-amd64.tar.gz"
      sha256 "fab72dea04b29c8754bd45c248f46a88ddec11b342f147bb47eb016412db683c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.66.0/yaver-linux-arm64.tar.gz"
      sha256 "5a253e0e9b3ca747641e0b680d71a183cc34165e1311a84cb15b93065edf1953"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.66.0/yaver-linux-amd64.tar.gz"
      sha256 "a8bf7da355b69befc54c7d664f167fbc186d484629b2cfad8679b54c3c6d1d33"
    end
  end
  def install
    bin.install "yaver"
  end
  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
