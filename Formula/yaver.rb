class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.98.0"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.98.0/yaver-darwin-arm64.tar.gz"
      sha256 "a4cfcb261db0f6498dcdb9b3e702e74f083b66bd88e3c208c180690dbc12395f"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.98.0/yaver-darwin-amd64.tar.gz"
      sha256 "6411e2e8678ce94f6dd3da287dc6f370ef3b44b870e985ea22fc068a5b763d1b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.98.0/yaver-linux-arm64.tar.gz"
      sha256 "c346b9fb2a5b649dc54236b075d0913005f315a20a7912e9335d5d4c7802dd22"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.98.0/yaver-linux-amd64.tar.gz"
      sha256 "ab8999ea816ac190dc9767a09a275ce8b977a4c9466fb903fab87cbdfe9e87a0"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
