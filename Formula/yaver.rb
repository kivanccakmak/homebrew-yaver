class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.37"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.37/yaver-darwin-arm64.tar.gz"
      sha256 "93ef482d9f8a9f0e217004bbb0cdbfeec209464d8487c45ade6e2bf56ccd9807"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.37/yaver-darwin-amd64.tar.gz"
      sha256 "335affcc3984b98d157ad66144e659af0056c3314059e783d9ad14f4353b5b66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.37/yaver-linux-arm64.tar.gz"
      sha256 "d4e433a64bab65e8ad30e3f36341be8ce46bd74895f05ed86a9d1ff4f6622278"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.37/yaver-linux-amd64.tar.gz"
      sha256 "6967f536c7feb694094758bdf86ed082eebd56eab3bddbdcbc2787d90e5d0907"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
