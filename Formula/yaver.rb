class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.116"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.116/yaver-darwin-arm64.tar.gz"
      sha256 "ad6324bedc1858ded8a1e7bc915b0aa9bcd9c3603ce3d3c2b39d8224dc6aaeee"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.116/yaver-darwin-amd64.tar.gz"
      sha256 "ea7978b4d5f315e19f031642834df8dbd3fede90364f8d1023c3a9d7c0e871f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.116/yaver-linux-arm64.tar.gz"
      sha256 "89c9f590e500e3664a7f3608d82d511ed3989c1839a69ab4674e4e81629c51f1"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.116/yaver-linux-amd64.tar.gz"
      sha256 "ac31347d1570129718410786feb376c29712336b59d191fac259f118837f11ee"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
