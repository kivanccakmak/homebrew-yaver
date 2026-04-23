class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.20"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.20/yaver-darwin-arm64.tar.gz"
      sha256 "0814712176e91459e76adbd665f432bf4909ff1dbed33d721132739fddc4318b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.20/yaver-darwin-amd64.tar.gz"
      sha256 "26a58f1e8b3b8a753bf0a2c0f1647b27b37441d8196292a96c8c94e8bcba588e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.20/yaver-linux-arm64.tar.gz"
      sha256 "1fd7640adb1406c54a148edda2814b5e5a6106be26af94399bab1a5599707272"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.20/yaver-linux-amd64.tar.gz"
      sha256 "f921aa9a751d28530d2d17987c8aeec6d9c0583aabcc0cead218ae660f1cfccd"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
