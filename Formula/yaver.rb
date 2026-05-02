class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.110"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.110/yaver-darwin-arm64.tar.gz"
      sha256 "990926d203271893b1bfb8bbd322f0476cdad0f23010500eef11b0248391a7da"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.110/yaver-darwin-amd64.tar.gz"
      sha256 "3c28d476ee157d12ae690216e88fe552813af73d45062030a3db9164444bc24b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.110/yaver-linux-arm64.tar.gz"
      sha256 "f0fa6e84893a22c77371f014417da93721d2202b1fa21dd09aeb0c1dff90397d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.110/yaver-linux-amd64.tar.gz"
      sha256 "29619fe79e17d972b4ebd6dee52f10b0721b21add9f625c5771e181288076570"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
