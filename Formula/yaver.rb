class Yaver < Formula
  desc "MCP-standard AI agent — use Claude from anywhere, agent-to-agent"
  homepage "https://yaver.io"
  version "1.2.10"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "d3c07868e6ebecdb4e41c4236a2117c2bba5a3761a0b240553b9b0a2da9c35df"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "458cb7001f21876396959c275b18086d6ebcb016d331f991b6cf0482769f8709"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "5a4dfdb2cbc0c6917be930ba453768c1018d73ba35a16ce889ed1edaa2d0d8d9"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "e9c5926fa797c6a0d0834a66e48d25a9c155378577df01bbe23a5877addee56a"
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
