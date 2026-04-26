class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.50"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.50/yaver-darwin-arm64.tar.gz"
      sha256 "7aaa3c631a2b8a54623eb026f78719d61f4d9dacfa7f989414f9e1a2384d5fa6"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.50/yaver-darwin-amd64.tar.gz"
      sha256 "3859d8893daf3b35008553f41c562d61572149be9da6414ee9d660f0a9b79329"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.50/yaver-linux-arm64.tar.gz"
      sha256 "917322bfa525b812c0ee428bfb0b88128e82d4fc346eb52a295aa3d45491b30f"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.50/yaver-linux-amd64.tar.gz"
      sha256 "4e2eb95a2645bcd8df44b23d1c717460b4e176f95daa8cd3e320e4a4aca6068c"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
