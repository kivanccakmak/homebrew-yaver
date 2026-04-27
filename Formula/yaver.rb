class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.60"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.60/yaver-darwin-arm64.tar.gz"
      sha256 "64bdd54b97d43e2824a7557ca7a1ef59f0ed25c026b31388f04f113e00cd91b7"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.60/yaver-darwin-amd64.tar.gz"
      sha256 "b06de8de5619ecd452affe355650f3ef343bc4fa5c75183c76f0a6b4197003dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.60/yaver-linux-arm64.tar.gz"
      sha256 "7fb521906bb5c574bd56398c23cc0d8a02df10008042e5c212aee6c031d3f22b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.60/yaver-linux-amd64.tar.gz"
      sha256 "04626f3e1e9fec723423236d625781e9d5db156eeea89e134fec520286f6a0d3"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
