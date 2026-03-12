class Yaver < Formula
  desc "MCP-standard AI agent — use Claude from anywhere, agent-to-agent"
  homepage "https://yaver.io"
  version "1.2.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "49ffcb0689b132af8d4d887c93e725df6caf636a966337eaaa2a46c02f15f946"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "b5a77f0f85143e94b0c16ca4ee109dc9399cb353c2202c92018d2f84652a2c39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "a03063e87b4c6c4e54a15d31be16e996b46928bb5f6c6954bea47d4091f40000"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "9e5317acfe8a95c1da78bcc5f3d178e74d724820f4f4f01b8adee681d3cc3374"
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
        yaver serve       Start the MCP agent on this machine
        yaver connect     Connect to your dev machine

      MCP endpoint available at http://localhost:8080/mcp when serving.
      Any MCP-compatible client can connect to your agent.
    EOS
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
