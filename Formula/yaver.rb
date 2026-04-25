class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.44"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.44/yaver-darwin-arm64.tar.gz"
      sha256 "cb47bec2fe9dccea3c828a1ef6108bfbcd70112f81dc828a16fa106bed069fed"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.44/yaver-darwin-amd64.tar.gz"
      sha256 "83d885f23208da42b81abf889d58670efaf957a342a82c642df1a00c0b1fe8c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.44/yaver-linux-arm64.tar.gz"
      sha256 "ae34061729a6ad848cca5410273c523c1f250fdb41781819dfce3a3fb0473c5d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.44/yaver-linux-amd64.tar.gz"
      sha256 "fb472072b8936e732853812c4b737130795e3828bb8b313dd88e37a36c037f07"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
