class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.36"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.36/yaver-darwin-arm64.tar.gz"
      sha256 "92a79963c0a553ed6eecbb6fdd96d08a9c3cae6d7d8a4237d357a8846d887711"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.36/yaver-darwin-amd64.tar.gz"
      sha256 "3ff27637444162770435d6017f95d18f924d79830fd72b88ed479ef7fc5fa51a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.36/yaver-linux-arm64.tar.gz"
      sha256 "a80b02bb5b8b330e04ea8cbd675e99256cf991b16b8ea779f3310763199e02df"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.36/yaver-linux-amd64.tar.gz"
      sha256 "f5fcbfc91fe6660c77d4dcb522ed3dba91dff71859ed94616e58f4d3ec5da4ac"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
