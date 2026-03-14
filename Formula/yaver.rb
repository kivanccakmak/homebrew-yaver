class Yaver < Formula
  desc "Run AI coding agents from your phone — Claude, Codex, Aider, or custom"
  homepage "https://yaver.io"
  version "1.6.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "8e555e80b1060992b7a15ab648de68f92b2e67ff33d475e736f8cad96b25ccbc"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "7f42f78263b9f36bc9977f6dc90389b8a5e22a1486c0f4cc0925a0fdb96f9554"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "9d30be7a17721a2dc8978b8d668ba686ebf65904c407005678a5c8e803f9544a"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "b4ff27e4b226c7db59ef35ec7e5b881d6db8dfb478a897c35e612aa714bce00d"
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
        yaver auth        Sign in (opens browser)
        yaver serve       Start the agent on this machine
        yaver connect     Connect to your dev machine

      Supports Claude Code, OpenAI Codex, Aider, or any custom CLI tool.
      Select your AI runner in the mobile app Settings.
    EOS
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
