class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.59"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.59/yaver-darwin-arm64.tar.gz"
      sha256 "425e54635c2c8b93a722cb573e4e7008843b44c87b3b47d587d9a1863c9a5627"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.59/yaver-darwin-amd64.tar.gz"
      sha256 "b919b465bde1a9a9d5b353910c3085dccb63b8080ba329949f4e6dd351040c5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.59/yaver-linux-arm64.tar.gz"
      sha256 "34472e85a701d0e8458d37f90f586108f8753689a39403157bdcf6109f193a8a"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.59/yaver-linux-amd64.tar.gz"
      sha256 "c043b8e1b9e463af54f3506fd4b9622861606428477fbfc809e2568b1ea21c38"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
