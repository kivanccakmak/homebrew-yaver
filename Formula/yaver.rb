class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.108"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.108/yaver-darwin-arm64.tar.gz"
      sha256 "0a16850b86762a002052162744e659993ad045570f2d887cc9f7bc215c813023"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.108/yaver-darwin-amd64.tar.gz"
      sha256 "c69944c7e60769e0ac98782bfbe6dae8c8bc569f797208042f069384839ecf40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.108/yaver-linux-arm64.tar.gz"
      sha256 "c6255fec99410d140091f99a8da25372daa45a6e0ebbf660644dc89c9f18cb1b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.108/yaver-linux-amd64.tar.gz"
      sha256 "0e950d6b527f02a8d52717a9c206a6812c3d2c4db9183d23d34eeec18e1fdc30"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
