class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.21"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.21/yaver-darwin-arm64.tar.gz"
      sha256 "58202f6992742d079404a1277ad732c78959162c157e85f82001de93baf26698"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.21/yaver-darwin-amd64.tar.gz"
      sha256 "31ddba526a10ebfc0e5378dc2fdc55051f8ce13701bcab81d4b4f374901eff7f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.21/yaver-linux-arm64.tar.gz"
      sha256 "c1ea7fc65b301cd541ab3c8326059da474069352a94fafd99c7bcdb1a1d3a445"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.21/yaver-linux-amd64.tar.gz"
      sha256 "75ebfdfdc58373179180963230a1407d68909e02fcbc33a13822e48894d66699"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
