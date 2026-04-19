class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.96.11"
  license "AGPL-3.0-only"

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.11/yaver-darwin-arm64.tar.gz"
      sha256 "79451c90832f3f064e90151224328f8c588cfa0d608631683a5eeb6c7e873b42"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.11/yaver-darwin-amd64.tar.gz"
      sha256 "f6a9d025a0c8a8bd97b28eed188959d74b2638e9f93b0d7a6c70dda13b823228"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.11/yaver-linux-arm64.tar.gz"
      sha256 "c48b54dc699a3387df6f53cac62b1b936bc9671170544beaeafbc57ebc65367d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.96.11/yaver-linux-amd64.tar.gz"
      sha256 "3fcf4de0d3d4ad196f48432a629b7513cb4a68230421981f1f36954b07758003"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
