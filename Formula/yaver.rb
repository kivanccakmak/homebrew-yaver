class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.95"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.95/yaver-darwin-arm64.tar.gz"
      sha256 "940be1f06ffe0045873ae2b4d271184b846d9374f2809c2b11ca0927fa4aee3d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.95/yaver-darwin-amd64.tar.gz"
      sha256 "78b1529fd26abb77b053f458552ce9738de93413530045eef2f0e937aa7ec750"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.95/yaver-linux-arm64.tar.gz"
      sha256 "e4fed4b77cd1890dcb8f68c37735e66d6a07ad660115bfbfca3486a32e7e310e"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.95/yaver-linux-amd64.tar.gz"
      sha256 "5407cb614844295ba9ae914c53beae3ac8b8a06dc8b40b4bbb33dc7835d77fc8"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
