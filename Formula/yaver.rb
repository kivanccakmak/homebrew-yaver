class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.96"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.96/yaver-darwin-arm64.tar.gz"
      sha256 "aa8f84638f0607b1ee74703fb45e710da17718ed5e801536d21b794fa1a58fc4"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.96/yaver-darwin-amd64.tar.gz"
      sha256 "2590ab132f4b3da2914270b463a4c8deacdb1c4d38fde6a1d0503641f38d447a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.96/yaver-linux-arm64.tar.gz"
      sha256 "8847acbfb4f19bf0246300f47f319d78261c92bcd80cd7144cbb84a39c7b1d12"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.96/yaver-linux-amd64.tar.gz"
      sha256 "4edc7b410ba8867d2563eed48560ebbf9e542f44c596d3097b8990589f1cbf1b"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
