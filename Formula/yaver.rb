class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.35"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.35/yaver-darwin-arm64.tar.gz"
      sha256 "bc178dc9e480089edd9fc1bdddcaedae588bd27d32a3e4c7e3bbda3b658f79cc"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.35/yaver-darwin-amd64.tar.gz"
      sha256 "fc89e2b34e4563f9d0c3f09f8733652a1d1d98f5e422819bac78ea411db4ea92"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.35/yaver-linux-arm64.tar.gz"
      sha256 "177a8bfcd45f1e8fafeb1352f3183081d698524fc7b4552a4d81d117f635a69b"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.35/yaver-linux-amd64.tar.gz"
      sha256 "07e210e6d95989994451cf4d85161c8d2eb57b5f0dffbc9549b0a52464692818"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
