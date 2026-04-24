class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.28"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.28/yaver-darwin-arm64.tar.gz"
      sha256 "e0d6b26c52abc15b6be848d8c6a0d39d991ce185ea7a6d1ae6cfd3e936b246fd"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.28/yaver-darwin-amd64.tar.gz"
      sha256 "88ebc7e34377a8d40e60e33c61338ee5ff87e2c07efdb13cac3e704980d6e2c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.28/yaver-linux-arm64.tar.gz"
      sha256 "5aa01b9e746d39c4d4c4cafec19223e0858da336886b4a4cac78ca09cf1884a7"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.28/yaver-linux-amd64.tar.gz"
      sha256 "b7bb5948ac12e5c2d384e8044617b7ba9ad0c622032f0e2bf7547d715330479e"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
