class Yaver < Formula
  desc "Run AI coding agents from your phone — Claude, Codex, Aider, or custom"
  homepage "https://yaver.io"
  version "1.33.0"
  license "Proprietary"
  on_macos do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "fe285d877d5145f01d2d71e8d087458d45a292a1d99372f0fd32c694e97eb2a1"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "dbf175b79d59a96ee0b8e2539918c95c775b6e254047429574c231c2a4dfdbdf"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "f3d8ecf9555e884f4747aaf3374f8a12e057614edc2317243ea1dd08fd2df456"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "1fa84a74fb2010f0c8fbeec2c8a24729eeb497f27b3665507dbc678c93efb89d"
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
