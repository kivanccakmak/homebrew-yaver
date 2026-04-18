class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.96.7"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.7/yaver-darwin-arm64.tar.gz"
      sha256 "af6858362b96c1f8dccc11d81b37213f88c23912c670c032704c63150b47c88d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.7/yaver-darwin-amd64.tar.gz"
      sha256 "3d97754d0cdc54b2f46eda1f3fa7e0c958029c3b713a499a3f58357528be0234"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.7/yaver-linux-arm64.tar.gz"
      sha256 "a0e83ae8d34669f0ed223dfb7e714ec457aafd1215f8def8d27b772dbcad4b20"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.7/yaver-linux-amd64.tar.gz"
      sha256 "812d084d9f8b0e7eb3c72f2a579aa19909b86a222595e13d02a41b64bf5c445a"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
