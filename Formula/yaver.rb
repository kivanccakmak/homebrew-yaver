class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.96.12"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.12/yaver-darwin-arm64.tar.gz"
      sha256 "2c5d1761faef054e8a6b1338486bb20c23d479eb2aa4c77a7aefa1466f91eec0"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.12/yaver-darwin-amd64.tar.gz"
      sha256 "70fc8bc2263ab10f64a96d45dc0274f332a03eee1e3ea0d15965ef404c93359b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.12/yaver-linux-arm64.tar.gz"
      sha256 "930c5b17fdf2238ebe42533a2d326ba7eeae1be42805243b6ea4c27bba215bb5"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.12/yaver-linux-amd64.tar.gz"
      sha256 "2462fc14ac9cd54ffd95c1ab5f43632b97687be7465c14123d444338942c7f92"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
