class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.89"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.89/yaver-darwin-arm64.tar.gz"
      sha256 "4b5713cbd4986291dd2475cf8029a90b69a98a0314d21347055390b2d471ccf7"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.89/yaver-darwin-amd64.tar.gz"
      sha256 "2297bf3461c60daf2ac97db332ab7603d1326ecc31526fdf0e9b96b4d4385079"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.89/yaver-linux-arm64.tar.gz"
      sha256 "031de802be3f9baec6b1236e8c42d79a4d775a827ef82721cae203ea6a98f392"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.89/yaver-linux-amd64.tar.gz"
      sha256 "002495649be6832d9b285e582d24199e8bcae71d4ab53cbad959b9fdc3b48de2"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
