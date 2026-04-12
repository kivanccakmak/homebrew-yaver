class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.89.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.89.0/yaver-v1.89.0-darwin-arm64.tar.gz"
      sha256 "f59919b4cb9572c6ac52beedf868c8915dbc0a6122f81efbc1b6a3d13e3af758"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.89.0/yaver-v1.89.0-darwin-amd64.tar.gz"
      sha256 "ef86dd02e211ecd83469769b93cf56d8febdfc9b4737f4d0735ee0a8b2922735"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.89.0/yaver-v1.89.0-linux-arm64.tar.gz"
      sha256 "5419241b18c7bca45db6d452ad6ffe6d510591991dea3399d6ce2e169ffa0d56"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.89.0/yaver-v1.89.0-linux-amd64.tar.gz"
      sha256 "3beb90f264df232a25dd50237131cc29385ca64439ed1fdf70e4f427ab178410"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
