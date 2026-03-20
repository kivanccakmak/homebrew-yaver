class Yaver < Formula
  desc "Run AI coding agents from your phone — Claude, Codex, Aider, or custom"
  homepage "https://yaver.io"
  version "1.37.0"
  license "Proprietary"
  on_macos do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "5a34863eec5de802002d7ed630a0cba04091227f8acce14f7e36bcf4bc1c5938"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "fcaa9cdd65495cea469e4e48e3c7934296a88366539cc65c439fab239ea96f45"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "e207950126e38023cd6e92b104e7ac16dd11c6f86500efedf4bc02c6de636514"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "1b5d9fd11201b0f9bc89dd9fe47e4baea638fb5f8ed06492959893d20c76bade"
    end
  end
  def install
    binary = Dir.glob("yaver-*").first || "yaver"
    bin.install binary => "yaver"
    chmod "+x", bin/"yaver"
  end
  def caveats
    <<~EOS
      Get started:
        yaver auth          Sign in & start the agent
      Supports Claude Code, OpenAI Codex, Aider, or any custom CLI tool.
    EOS
  end
  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
