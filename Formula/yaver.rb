class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.39"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.39/yaver-darwin-arm64.tar.gz"
      sha256 "c3b3f20810ee29057b02cf45e3b7431d5f68b94e6aa1ff75b11c574f132c9d4d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.39/yaver-darwin-amd64.tar.gz"
      sha256 "f053b0b0176801b390286928b80e1a27d1d9ec1c7493d9d085fa84995e139921"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.39/yaver-linux-arm64.tar.gz"
      sha256 "3a287610c1f55be4c0528df9f13a9b9395974ac987c4e5a4c7738ee2b6c475ae"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.39/yaver-linux-amd64.tar.gz"
      sha256 "180fce001e9c85dd64ee04bf8e8b6d6d1c84d7444866de5f07b374aab95f2605"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
