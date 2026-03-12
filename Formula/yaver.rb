class Yaver < Formula
  desc "MCP-standard AI agent — use Claude from anywhere, agent-to-agent"
  homepage "https://yaver.io"
  version "1.4.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "5d5279e6e5daa8cca9f5f8add832c5a633c1963d62bb730d473ca346216713da"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "aaff1279c0b945c308a3222c7c5c8a78ed07593c9177eaae2f88196558a240dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "d392ccba2dd4b3b482e649b08dc6b74f8ec60bcea3c7e65ced19dc3c7dd26183"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "98a6f56b24c9bbe08a722a2d8baf99696ec4b970f218e294d75cb4461799ef31"
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

      MCP endpoint available at http://localhost:18080/mcp when serving.
      Any MCP-compatible client can connect to your agent.
    EOS
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
