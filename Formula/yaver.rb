class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.62"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.62/yaver-darwin-arm64.tar.gz"
      sha256 "dc1e481a1e29a00bb0f7dc8993c85cbf67921f4dc0d84596f3797316e5cc75aa"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.62/yaver-darwin-amd64.tar.gz"
      sha256 "6ae6d15ac4cea7e48ed40f2f2b7f837a241041780f4126088371139d651a6512"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.62/yaver-linux-arm64.tar.gz"
      sha256 "cd5d2b9f816050b1dbb57fe9ea14dfeb5cfbcedc253f8378423fae4c80ac7ff1"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.62/yaver-linux-amd64.tar.gz"
      sha256 "34a6109862a42afc9895d5bd67e84915932fb6a04702973ee7ad819bed3274ae"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
