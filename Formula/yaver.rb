class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.30"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.30/yaver-darwin-arm64.tar.gz"
      sha256 "ecb9c200c0dd7192fbdb7acd089959e9338aae9433be02734230cb5e671113bf"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.30/yaver-darwin-amd64.tar.gz"
      sha256 "1bc8140bcd163806603086aa046b472092b0dcd3465879618d73f0d3edb45f28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.30/yaver-linux-arm64.tar.gz"
      sha256 "7d60819e760ffd28295b0d14525fc777d829e78deddac46ae42243634d9451ff"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.30/yaver-linux-amd64.tar.gz"
      sha256 "786f89125002dfccbcd955d2fafb20450930583b91bb01668ac1325897f056fe"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
