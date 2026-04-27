class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.79"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.79/yaver-darwin-arm64.tar.gz"
      sha256 "d2b3dbc95f6749b8492f451d263e39dc80f5f35e8610d3eaf271d6e702b55b96"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.79/yaver-darwin-amd64.tar.gz"
      sha256 "fb4cc1c7135b1e493a8ef22dc996e36627bd5f6c00af4daf34e6f9d7c393f4cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.79/yaver-linux-arm64.tar.gz"
      sha256 "6dc15180218ffa436095742845eeb3a52589c333e9a0bebfc3f4fb2894ee8d1c"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.79/yaver-linux-amd64.tar.gz"
      sha256 "668ad52be61933a659aadf6c55be31cde62ddda0a46e5ad18b1b3060c17239c3"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
