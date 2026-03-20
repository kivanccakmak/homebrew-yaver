class Yaver < Formula
  desc "Run AI coding agents from your phone — Claude, Codex, Aider, or custom"
  homepage "https://yaver.io"
  version "1.35.0"
  license "Proprietary"
  on_macos do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "ed1677c66b968cb23aeed0e04931a0a743ec73c93ea00037288d83691ccd071c"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "6b1d144dca7b93bd72747948e5f74dc74c55e15369b7f1d8ded358fdbc68483a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "a2ff409c6769d4ed18efe67e25747262c1e5c91f17521b13196f6c7b9aa7429a"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "483b5699284c131e2bfc718cdf5b9b94571e4f9c987b5156e3d9f2234c09de59"
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
