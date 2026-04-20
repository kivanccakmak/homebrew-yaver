class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.14"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.14/yaver-darwin-arm64.tar.gz"
      sha256 "cd7f78abbfc6648c212ac9ede8fb738cdc1c7b5693731fde7ad0ef27bce5a04e"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.14/yaver-darwin-amd64.tar.gz"
      sha256 "ba15c02078b978aa99ff0854bec4ab71f9ee2eb250794abeb263c529f0787e2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.14/yaver-linux-arm64.tar.gz"
      sha256 "4ff95b4a0c83853ddc7b1b94827ddab2e09155325d3c9d49353b5f7a79c52ac4"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.14/yaver-linux-amd64.tar.gz"
      sha256 "f052765de5f9862537c16bd43bb3f52b400fbcec89109f7fffa6f8ae4b60374c"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
