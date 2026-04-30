class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.97"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.97/yaver-darwin-arm64.tar.gz"
      sha256 "28122d2c0a209db5f4ce6d51bfcb0b11457e0494d12fd6f4f592817d0c06bb58"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.97/yaver-darwin-amd64.tar.gz"
      sha256 "f8a69fdeec0669346544790f3a7d4d6fb2ee58355d4ec8c0febd256bc3db7e35"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.97/yaver-linux-arm64.tar.gz"
      sha256 "c94b64cef1e23b6203f93416fe526bc7928b2be0f161e19757f1c5dac380767a"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.97/yaver-linux-amd64.tar.gz"
      sha256 "e318b3ed22b9694aa53c3af294b23894400963e98df83578e0129bb8b41a6b35"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
