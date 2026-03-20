class Yaver < Formula
  desc "Run AI coding agents from your phone — Claude, Codex, Aider, or custom"
  homepage "https://yaver.io"
  version "1.34.0"
  license "Proprietary"
  on_macos do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "b3a48d221436f2bca207aa6ff999240a31744d6fba752a07c53182b41e6078dc"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "604b355be68beb2b9c5ee6a89683b54a7b136458d3da918bc561c83d723e43b6"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "e298f160453e4157c8bd517be74ed9f782ebd06a3829e337135f0f029e20beaf"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "c06234ff518a0956941993e0641adddfb8ad1c2ff9ec2b6b07d2d687a4daad8a"
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
