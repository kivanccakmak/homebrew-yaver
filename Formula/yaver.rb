class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.70"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.70/yaver-darwin-arm64.tar.gz"
      sha256 "f31fb3a8db365b1c533b3967ac887f6aa022d67320843a0b6cdb1cafdfc345e1"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.70/yaver-darwin-amd64.tar.gz"
      sha256 "9743cd52a93935b0d4259e80d7ef895a1cb95df5377bb8ee3e23bcfdc5719335"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.70/yaver-linux-arm64.tar.gz"
      sha256 "401f8684b0ce0dfe4e4c83a42c73281168fba112777a0858802e69c921c4cab6"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.70/yaver-linux-amd64.tar.gz"
      sha256 "62bb46f9096d408ed2c7498a46f9ec7e563392b3455fd7318dc9a64649b185d6"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
