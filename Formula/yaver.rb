class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.3"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.3/yaver-darwin-arm64.tar.gz"
      sha256 "ed461881e6204fd383b11c7cb724cd1267574476f0814c4775c245da8b38b5e9"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.3/yaver-darwin-amd64.tar.gz"
      sha256 "03468df368d8880d3fd522e678d7838102f857bc8903ef7423de6744e43852d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.3/yaver-linux-arm64.tar.gz"
      sha256 "9366da871025496b86b95dd91a087507ab06f58465da4af6827af9e830515437"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.3/yaver-linux-amd64.tar.gz"
      sha256 "8091c1e44fbdef5dca6661dc506f55aab72a9936d8479ec6bf904280bfb4deed"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
