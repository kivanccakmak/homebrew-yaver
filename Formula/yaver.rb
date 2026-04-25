class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.43"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.43/yaver-darwin-arm64.tar.gz"
      sha256 "4480a89f0fccd0b8d309c021f945ae71eb273fb7151abeeccf2ace192ef59b75"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.43/yaver-darwin-amd64.tar.gz"
      sha256 "a5fdc11b26aa7b46ad82ede1acd177c7cf1877138fb16d0399ec810408385d52"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.43/yaver-linux-arm64.tar.gz"
      sha256 "24c34f10c86bf6b428a14ef4c294c3bfa42629ae693868694bc009db1374def6"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.43/yaver-linux-amd64.tar.gz"
      sha256 "5270545d60ba5ea42239b0b4cf9945f85a3987c56a5fbaa32cc65a223c099b2c"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
