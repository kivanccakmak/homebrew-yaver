class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.8"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.8/yaver-darwin-arm64.tar.gz"
      sha256 "cc24c3cfcf403ae37631e94ce794b541e61bea6bbeff474d5c602738aa1975ec"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.8/yaver-darwin-amd64.tar.gz"
      sha256 "d0d9d0199c4d03d5616c06329b81a0681463d3b5d0a20018bf778c5e562cc800"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.8/yaver-linux-arm64.tar.gz"
      sha256 "c9ec7b3b084c75ffca466511aeec9d63340ad8963ba9dc153ccd6629bfd72184"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.8/yaver-linux-amd64.tar.gz"
      sha256 "3190b1ceb7ec8730c1f8ac88592c5f08458468c94a209e9fd09504cea44766dd"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
