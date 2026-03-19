class Yaver < Formula
  desc "Run AI coding agents from your phone — Claude, Codex, Aider, or custom"
  homepage "https://yaver.io"
  version "1.32.0"
  license "Proprietary"
  on_macos do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "d2e02eb17e057d6d7f28f76616ea9301d53be3482e738ca7fd71ea6c88c6034d"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "70e0f9a006ef24a1645632ec2a28379002bd55a9b4e494003a321bec25c1112b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "99d2426d3806497d72538114c2ecb62a70a9336c207c00e830d8bfaa4d0193c3"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "983c0237e815ba4c58c29a2d150ab90f8744fe44face992ede0eb0a0213e4356"
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
