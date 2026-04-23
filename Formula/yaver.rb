class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.18"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.18/yaver-darwin-arm64.tar.gz"
      sha256 "bb0ee488af88a8bb34594ad5ff30bafa0f7bb0b1cd09ed72e48d109df01ca5b4"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.18/yaver-darwin-amd64.tar.gz"
      sha256 "918c9a6de0c0a90d7cde69960a516052dfe860dbdb7ec3f7e344bd82f5ff8500"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.18/yaver-linux-arm64.tar.gz"
      sha256 "814e900eb8078e9b9f8883c72ff471d5557660df8a1496ed3a429d15ba2376df"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.18/yaver-linux-amd64.tar.gz"
      sha256 "1d04ad1944c8a19b2251b8fbe5245c289a95e5bdfec53710016bf81d719428e7"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
