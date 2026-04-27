class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.81"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.81/yaver-darwin-arm64.tar.gz"
      sha256 "9aa42301439367254e4f364317750512e79b69498f5d196092503aa9f5bd29cc"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.81/yaver-darwin-amd64.tar.gz"
      sha256 "eb9e58efd52ab8e8aa22025c721767d2bfcb4ca57065fab638d0fffb18f907e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.81/yaver-linux-arm64.tar.gz"
      sha256 "ab3ffed994f55f9d52fffdd60d045f426cbe799b8317702e38844cf85d43db8d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.81/yaver-linux-amd64.tar.gz"
      sha256 "7859c2fa2db910e43446ccd5f3686fc7fc182ea353b21ab2cafcef57103b3d47"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
