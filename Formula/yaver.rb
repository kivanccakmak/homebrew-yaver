class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.100"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.100/yaver-darwin-arm64.tar.gz"
      sha256 "97262f2685df3a568df274772c82e77e825ebec1c5a8cc74b6328c424b2dc955"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.100/yaver-darwin-amd64.tar.gz"
      sha256 "b7a21db9687455620dc43b52c40006876ce6c0285e3f7d782a5dc03846a2880c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.100/yaver-linux-arm64.tar.gz"
      sha256 "2a51b07cd695919b3914961f81c47900449b4db1cc585ac89bdf9622dda2d028"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.100/yaver-linux-amd64.tar.gz"
      sha256 "28ca654019fe7ab2d6f84d95b0ad3761c315c89f24478bcf9c1eea84ec398930"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
