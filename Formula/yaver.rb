class Yaver < Formula
  desc "Run AI coding agents from your phone — Claude, Codex, Aider, or custom"
  homepage "https://yaver.io"
  version "1.28.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "6bf8933129622fc2537fa301136a456cd12490d0549548769b413587f3c1ad46"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "e1dff872a50f0c47d3ca4bc2ba9c836eb9ae6ec4129baf571bfc8cdb6394ea10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "8ec5bd5045506b402f18e769893e73d8bb3dd2c56698f14b7aef13ca7b9ad917"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "2585c887b898d0da08951d6b71dd15bc583ad60b137a771e33a4295b4065b76c"
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
