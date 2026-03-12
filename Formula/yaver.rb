class Yaver < Formula
  desc "MCP-standard AI agent — use Claude from anywhere, agent-to-agent"
  homepage "https://yaver.io"
  version "1.2.6"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "050f14f9c9f4479b041b39e545316de8588ab7719c1cf79dc291a9a30bfbbc20"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "6578f0cb5a78ffe63c640cf7c0261aa6e250a8e82f455395a81656a86299f915"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "68edbc64fa783d5c01b8cd844e36eb5c3af884ba174b64a591876fe137845ed7"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "688b3afc505ee69651fd2a7c1830622d6154111a15c0cc2c0d9eec46c53aa79b"
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
