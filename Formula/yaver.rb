class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.66"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.66/yaver-darwin-arm64.tar.gz"
      sha256 "36ce9fa8ba87572691f0e121b8f3d16a8fc52a872ff95e6467fef3638f7cba35"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.66/yaver-darwin-amd64.tar.gz"
      sha256 "4daa1439980a09cdbb5d221e11709c06122689743bb06233b53655d03cd4abc7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.66/yaver-linux-arm64.tar.gz"
      sha256 "780a39486e90a7454d909d91ff39e075055a1ac79e48c2b169ec59d20cd892e6"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.66/yaver-linux-amd64.tar.gz"
      sha256 "9492ab164d9d9d30af30fb23f04463a630658ccbce50e1a23d65af6bcb4a0161"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
