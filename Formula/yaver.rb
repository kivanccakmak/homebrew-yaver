class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.78"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.78/yaver-darwin-arm64.tar.gz"
      sha256 "2a39e5912368d1b2d87fb564cf38231dffdf5311560919322a10fd1b649961ec"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.78/yaver-darwin-amd64.tar.gz"
      sha256 "40039b760c3b309e6a5c8ea5dba1cecb54107ee7339ace4a26a1658c4c7fe1e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.78/yaver-linux-arm64.tar.gz"
      sha256 "ca29b041e3e0306d0d84257fe5cf13efb84d2c86a678d9482b875977f6e332b5"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.78/yaver-linux-amd64.tar.gz"
      sha256 "7349f940d563c37bcae5afcd7ec1eae973c5c053fd8148571003915998e7a73a"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
