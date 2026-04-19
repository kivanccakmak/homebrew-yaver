class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.7"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.7/yaver-darwin-arm64.tar.gz"
      sha256 "7ba1a9b0e44c8693dc7c76edba571bc25ec074bf7221eee2e5b0133093e66829"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.7/yaver-darwin-amd64.tar.gz"
      sha256 "168addd922458a212f8ef099d19fb5ca6246961a5ad0fe36063bb9c69ac5cafa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.7/yaver-linux-arm64.tar.gz"
      sha256 "0ba4b93fa070851712bb6ba5ccaa65dd8b6b101ee9d11f17350148f2ef4f843d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.7/yaver-linux-amd64.tar.gz"
      sha256 "8edec3da8946677f517b50814b79c2ace6a61758d7e42a0a9b72a9af07544ffc"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
