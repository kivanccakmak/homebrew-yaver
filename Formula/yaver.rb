class Yaver < Formula
  desc "Run AI coding agents from your phone — Claude, Codex, Aider, or custom"
  homepage "https://yaver.io"
  version "1.25.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "26dcd91fe2b60ab9acd11a8eda014441b139054a5eacbdb17b1785a7c3a1713b"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "bc0da995881f13381262428b7906433ed6387aee5794c4af967a010b3eb0023a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "17dc2029e825980a480c4ad56ca464c522f5ba46c7585ae278839e6e4641400d"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "edad246f7232b8e22582a76e3602cdfc4df5fc652eb17245cd09fac7b36095b1"
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
