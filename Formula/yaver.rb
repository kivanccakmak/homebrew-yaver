class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.55"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.55/yaver-darwin-arm64.tar.gz"
      sha256 "d84efdb5ae1d601b4212599056376230592326908f84108623a5d456804e941d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.55/yaver-darwin-amd64.tar.gz"
      sha256 "597d643d52007a5dea68fe24b3ef0900e164ee6cd6676643c1ba5c588b63721c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.55/yaver-linux-arm64.tar.gz"
      sha256 "7359fa1646da6bb8cb525f5b9b6009430efe6a52f0f51e8c8c7b66ccf9b8669b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.55/yaver-linux-amd64.tar.gz"
      sha256 "8ab82ba72c763ccfb361d9c6e31789119f5801e7616d73d1067d2ee4ebd85b3a"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
