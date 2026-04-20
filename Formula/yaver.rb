class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.9"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.9/yaver-darwin-arm64.tar.gz"
      sha256 "fe51654091e6b9130de3aaecbccdecd5983a0d323f5f6c1cc20be61202bbb236"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.9/yaver-darwin-amd64.tar.gz"
      sha256 "b4f3756e213f8fef618227c3050f39c97367d18ba4d988b130e6a0c74975c8c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.9/yaver-linux-arm64.tar.gz"
      sha256 "51aef68b577c7b8a64866b65095c991262d6b55a4b9b0a1b3bfc9f6105017b21"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.9/yaver-linux-amd64.tar.gz"
      sha256 "3f888cb79a38cdffcaeee66263948a203b729e53fe37720ccb3474df49c98ec8"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
