class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.82"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.82/yaver-darwin-arm64.tar.gz"
      sha256 "a102713e69cd3a0abdf18bb703a5a7fb69f898d22f1f2d17d73c352c14ff416c"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.82/yaver-darwin-amd64.tar.gz"
      sha256 "dc7fa0b437101764ff86d5e6378cd9cb193c9b9a9b998e809b98560d28772204"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.82/yaver-linux-arm64.tar.gz"
      sha256 "4ccd790355964f56e39b8823e265e42e4825b3541478dbec6b0be34a685938de"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.82/yaver-linux-amd64.tar.gz"
      sha256 "80b35084e46df9029ae70cff9ccd74331ec526fc1120c4c9386b73ca55420819"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
