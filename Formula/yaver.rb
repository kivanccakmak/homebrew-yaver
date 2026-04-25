class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.41"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.41/yaver-darwin-arm64.tar.gz"
      sha256 "fc9b3b25e78ea8ec36ca4b7028e0d8dde33ffbc507e751d07ff1659ceea8ba0d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.41/yaver-darwin-amd64.tar.gz"
      sha256 "46e4590f78897df77edf9e577ffe30023475538cb75c986fb8f0cd788b993c95"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.41/yaver-linux-arm64.tar.gz"
      sha256 "58a1779c0b3f7a70b08bae560f113e1bfe95143f035cee001f12d1ccd9a67512"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.41/yaver-linux-amd64.tar.gz"
      sha256 "c5a7649b8f6a6b9f1cd66998fac6b2ae6455ea8eee8383f58849204069c5ac2f"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
