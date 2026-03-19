class Yaver < Formula
  desc "Run AI coding agents from your phone — Claude, Codex, Aider, or custom"
  homepage "https://yaver.io"
  version "1.31.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "089928f5246e1377ba4d3d961e1d4738ce8af5ac97f4c81427313e8e526b72d3"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "af2023b5414803224e59bcfa290df1a666d6f474349b88b4d87d79bb98318b79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "a2c727889dcf3e1545d4c505270498382ecaaea4e5353bf96363d0439ca349bc"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "f7a742f75c9024a5644c967a310d817ffedd53cc5bfd865b9b529c6c1b563e54"
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
