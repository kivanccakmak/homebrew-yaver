class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.107"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.107/yaver-darwin-arm64.tar.gz"
      sha256 "b2b6c16689517302e8cc0c25811d5f5611c7f4cfc1b2cc4580a5d919d16247c9"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.107/yaver-darwin-amd64.tar.gz"
      sha256 "9083d9f6f0b2c644222b94c738559ee79ec5856ab409485f80245cb62f725b20"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.107/yaver-linux-arm64.tar.gz"
      sha256 "04c2f732280d4dbb3d13e4ee6994ac9e82dbbcf29052106e5601f72e8158d4fc"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.107/yaver-linux-amd64.tar.gz"
      sha256 "07ef19e6c0145a8079fb68436dfc4408e619b37ffd0b420fa216de145bbbe065"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
