class Yaver < Formula
  desc "MCP-standard AI agent — use Claude from anywhere, agent-to-agent"
  homepage "https://yaver.io"
  version "1.5.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "78c6d47366f84c95f96e3e82c52969f906d04c1d88eb72c24b7c1e3e78759499"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "cadbbdb16012ef42d6698f18887873a0fa029f732e688cbbca981223e5170c7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "05ee6d94e057c2d60c1037d7822a29301a5b33f09a3dec10432e392fb0eac45d"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "d9dbf003d6918b55c00299b654bc5113b35aa02c8d847042b7c45da28a35af4e"
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
