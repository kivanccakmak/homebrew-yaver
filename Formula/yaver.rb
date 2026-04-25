class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.43"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.43/yaver-darwin-arm64.tar.gz"
      sha256 "f10ca2b391559c527aa2ec43ea3f006707e5cc578bea6ac2245097d88c19d883"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.43/yaver-darwin-amd64.tar.gz"
      sha256 "faf2bb004ab88c0824a01aaa3ce8057bd14df176063c7c95ffb065ebd79e69d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.43/yaver-linux-arm64.tar.gz"
      sha256 "90fdd524ed70ec2f05ae6d1bf3b1117702ffc7b597d908a3c6388f6941acac44"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.43/yaver-linux-amd64.tar.gz"
      sha256 "916b00de679904d89f668957bcb426e614aa4c50842715995e3d3ec88ba05596"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
