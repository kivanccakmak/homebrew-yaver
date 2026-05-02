class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.119"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.119/yaver-darwin-arm64.tar.gz"
      sha256 "b210acef172e2cf6a931bab4e9e292ab65ce62da130d281032e630cd966e5e9a"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.119/yaver-darwin-amd64.tar.gz"
      sha256 "801a5bd054e99a6e791b74129490cd6f4eb53eecccd16fa2298f836c32a2df96"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.119/yaver-linux-arm64.tar.gz"
      sha256 "7463d4922a862b99977f2446893e10845f45d63839a403954e928f606f916411"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.119/yaver-linux-amd64.tar.gz"
      sha256 "39a6e0f62828b35d5cbb382b20628490a007c4a5f58909e3ba17843078125fbb"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
