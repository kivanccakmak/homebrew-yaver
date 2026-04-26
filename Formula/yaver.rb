class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.47"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.47/yaver-darwin-arm64.tar.gz"
      sha256 "e71b54c4dbc5f01bf4104c64b7ae95692eff0766bf91511357b156b1afbe9673"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.47/yaver-darwin-amd64.tar.gz"
      sha256 "2f43b2bb17a3be516d94dbc0ed39224c37a6f9dce634d27361b6de49a47b8773"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.47/yaver-linux-arm64.tar.gz"
      sha256 "590fb790a12eaf463841fa3fe9b0a5b7be7d7d5e5f0b57608c6fc4519d2407fd"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.47/yaver-linux-amd64.tar.gz"
      sha256 "18ab699ab5fd5cc48b1e58350fca27ea41d3ebd6f889679319e7d253a18cf523"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
