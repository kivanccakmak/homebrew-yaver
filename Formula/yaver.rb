class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.99"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.99/yaver-darwin-arm64.tar.gz"
      sha256 "03bd444e878124083fed4caa9665bba003b3792a138450fb39c0e7055a7335ba"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.99/yaver-darwin-amd64.tar.gz"
      sha256 "404205d0ff5553f1d617af0279aed44803a73a6e1d567b5603def04557945fca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.99/yaver-linux-arm64.tar.gz"
      sha256 "8c9a692ed90477e20d329f3da850af06205ef7054a7ab9348d73c9e17867f1d8"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.99/yaver-linux-amd64.tar.gz"
      sha256 "6b459e7edec36ef1c70a8fb96ae4ecd8869ca39418d7dce342b519b3309afa70"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
