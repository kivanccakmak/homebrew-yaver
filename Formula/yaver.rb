class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.45"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.45/yaver-darwin-arm64.tar.gz"
      sha256 "aad4e1d84712cc0e98940954c8488870423a470a1a1af062137c40a3236ee28a"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.45/yaver-darwin-amd64.tar.gz"
      sha256 "5124fe9d288d22f4d3f38def13274dd582d4625e3d0967b0eb200bb6ccf729f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.45/yaver-linux-arm64.tar.gz"
      sha256 "2141b0d71afcc5c96f2fac819c1825a78f9adfd24b644d8fde72bfe9baeacc45"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.45/yaver-linux-amd64.tar.gz"
      sha256 "06f0edd118b8de462a41205db28ed4bdd9566ed8d574de5776d3ac7eaa53e3f9"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
