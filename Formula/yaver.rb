class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.5"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.5/yaver-darwin-arm64.tar.gz"
      sha256 "a693f0671ef680dcdfb8353852d9d8ef6832c461b6a907a291413f88b192d394"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.5/yaver-darwin-amd64.tar.gz"
      sha256 "07d0cad2a58bac4b544020ddcd3b99d727560fbf7cc6bb6a149c237d383643e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.5/yaver-linux-arm64.tar.gz"
      sha256 "6b5f03befef01652d55c283d6900e5550a6f14c6656079c54b21223305aec4bb"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.5/yaver-linux-amd64.tar.gz"
      sha256 "06a42dabee49f0f760d54aa86deebc94f73ae2dcea46c1c44e8e7cf78fafd10c"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
